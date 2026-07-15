import 'package:ucum/src/internal.dart'; // Import for File operations

/// Main public entry point of the UCUM library (a process-wide singleton).
///
/// Wraps the parse -> convert -> compose pipeline behind high-level
/// operations: [validate], [convert], [isComparable], [isEqual], [multiply],
/// [divideBy], [analyse], [search], and the FHIR-facing leniency helper
/// [resolveCommonUnit]. Backed by an in-memory [UcumModel] and the special
/// unit handler [Registry].
class UcumService {
  /// Returns the shared [UcumService] singleton.
  factory UcumService() => _ucumService;

  UcumService._();

  static final UcumService _ucumService = UcumService._();

  /// The HL7 OID that identifies the UCUM code system.
  static const String ucumOid = '2.16.840.1.113883.6.8';

  /// In-memory catalogue of every prefix, base unit, and defined unit.
  final UcumModel model = UcumModel();

  /// Registry of handlers for non-linear (special) units such as Celsius.
  Registry handlers = Registry();

  /// Identifies the UCUM essence data backing this service, e.g.
  /// 'UCUM specification 2.2, revision N/A (2024-06-17)'. Parity with
  /// Ucum-java's ucumIdentification(); the raw fields are available as
  /// [ucumEssenceVersion], [ucumEssenceRevision], [ucumEssenceRevisionDate].
  String ucumIdentification() =>
      'UCUM specification $ucumEssenceVersion, revision '
      '$ucumEssenceRevision ($ucumEssenceRevisionDate)';

  static final List<String> _synonymKeysByLength = commonUnitSynonyms.keys
      .toList()
    ..sort((a, b) => b.length.compareTo(a.length));

  /// Resolves a human-friendly unit string to strict UCUM, following
  /// ucum-lhc's substitution contract: input that is already valid UCUM is
  /// returned unchanged; otherwise known synonym tokens ('mcg', 'hours',
  /// 'inch' — see [commonUnitSynonyms]) are substituted on word boundaries
  /// and the result is returned if it now validates. Returns null when no
  /// resolution to valid UCUM exists.
  ///
  /// [validate] itself stays spec-strict; call this when you want the
  /// lenient behavior and can surface the substitution to the caller.
  String? resolveCommonUnit(String unit) {
    if (unit.isEmpty) {
      return null;
    }
    if (validate(unit) == null) {
      return unit;
    }
    var candidate = unit;
    for (final key in _synonymKeysByLength) {
      candidate = candidate.replaceAll(
        RegExp('\\b${RegExp.escape(key)}\\b', caseSensitive: false),
        commonUnitSynonyms[key]!,
      );
    }
    if (candidate != unit && validate(candidate) == null) {
      return candidate;
    }
    return null;
  }

  /// Builds a standardized "invalid argument" message naming the [method],
  /// the offending [param], and the reason [msg]. Used as the failure text
  /// for the argument assertions throughout this class.
  String paramError(String method, String param, String msg) {
    return 'UcumService.$method.$param is not acceptable: $msg';
  }

  /// Searches the [model] for concepts of the given [kind] matching [text],
  /// interpreting [text] as a regular expression when [isRegex] is true.
  List<UcumConcept> search(ConceptKind kind, String text, bool isRegex) {
    assert(
      text.isNotEmpty,
      paramError('search', 'text', 'must not be null or empty'),
    );
    return Search().doSearch(model, kind, text, isRegex);
  }

  /// Self-checks the loaded [model], returning a list of human-readable
  /// problems found in the essence data (empty when the data is internally
  /// consistent).
  List<String> validateUCUM() {
    return UcumValidator(model: model, handlers: handlers).validate();
  }

  /// The set of distinct physical properties (e.g. 'length', 'mass') across
  /// all defined units in the [model].
  Set<String> getProperties() {
    final result = <String>{};
    for (final unit in model.definedUnits) {
      result.add(unit.property);
    }
    return result;
  }

  /// Spec-strict validation of a UCUM unit string: returns null when [unit]
  /// parses as valid UCUM, otherwise the error message explaining why it did
  /// not.
  String? validate(String unit) {
    assert(
      unit.isNotEmpty,
      paramError('validate', 'unit', 'must not be null or empty'),
    );
    try {
      ExpressionParser(model).parse(unit);
      return null;
    } catch (e) {
      if (e is UcumException) {
        return e.message;
      } else {
        return e.toString();
      }
    }
  }

  /// Validates that [unit] belongs to the named physical [property] (e.g.
  /// 'length', 'concentration'). Returns an empty string on success, or an
  /// explanatory message when [unit] resolves to a different property.
  String validateInProperty(String unit, String property) {
    assert(
      unit.isNotEmpty,
      paramError('validate', 'unit', 'must not be null or empty'),
    );
    assert(
      property.isNotEmpty,
      paramError(
        'validateInProperty',
        'property',
        'must not be null or empty',
      ),
    );

    try {
      final term = ExpressionParser(model).parse(unit);
      final can = Converter(model, handlers).convert(term);
      final cu = ExpressionComposer().composeCanonical(can, false);
      if (can.units.length == 1) {
        if (property == can.units[0].base.property) {
          return '';
        } else {
          return 'unit $unit is of the property type '
              '${can.units[0].base.property} ($cu), not $property as required.';
        }
      }
      // Defined special case
      if (property == 'concentration' && (cu == 'g/L' || cu == 'mol/L')) {
        return '';
      }
      return 'unit $unit has the base units $cu, and are not from the '
          'property $property as required.';
    } catch (e) {
      return e.toString();
    }
  }

  /// Validates that [unit] canonicalizes to exactly the expected [canonical]
  /// base-unit form. Returns an empty string on match, or a message stating
  /// the actual canonical form otherwise.
  String validateCanonicalUnits(String unit, String canonical) {
    assert(
      unit.isNotEmpty,
      paramError('validate', 'unit', 'must not be null or empty'),
    );
    assert(
      canonical.isNotEmpty,
      paramError(
        'validateCanonicalUnits',
        'canonical',
        'must not be null or empty',
      ),
    );

    try {
      final term = ExpressionParser(model).parse(unit);
      final can = Converter(model, handlers).convert(term);
      final cu = ExpressionComposer().composeCanonical(can, false);
      if (canonical != cu) {
        return 'unit $unit has the base units $cu, not $canonical as required.';
      }
      return '';
    } catch (e) {
      return e.toString();
    }
  }

  /// Produces a human-readable description of [unit] by parsing it and
  /// rendering the formal structure of its terms (e.g. 'gram / deciliter').
  /// Returns '(unity)' for the empty/dimensionless unit.
  String analyse(String unit) {
    if (Utilities.noString(unit)) {
      return '(unity)';
    }
    assert(
      checkStringParam(unit),
      paramError('analyse', 'unit', 'must not be null or empty'),
    );
    final term = ExpressionParser(model).parse(unit);
    return FormalStructureComposer().compose(term);
  }

  /// Returns the canonical (base-unit) string form of [unit], e.g. 'mg/dL'
  /// becomes 'g/L'-equivalent base units. Throws [UcumException] if [unit]
  /// cannot be parsed or converted.
  String getCanonicalUnits(String unit) {
    assert(
      checkStringParam(unit),
      paramError('getCanonicalUnits', 'unit', 'must not be null or empty'),
    );
    try {
      final term = ExpressionParser(model).parse(unit);
      return ExpressionComposer()
          .composeCanonical(Converter(model, handlers).convert(term), false);
    } catch (e) {
      throw UcumException('Error processing $unit: $e');
    }
  }

  /// Returns every non-special defined unit whose canonical form equals the
  /// canonical base-unit [code] — i.e. all the named units measuring that
  /// same physical quantity.
  List<DefinedUnit> getDefinedForms(String code) {
    assert(
      checkStringParam(code),
      paramError('getDefinedForms', 'code', 'must not be null or empty'),
    );
    final result = <DefinedUnit>[];
    for (final unit in model.definedUnits) {
      if (!(unit.isSpecial ?? false) && code == getCanonicalUnits(unit.code)) {
        result.add(unit);
      }
    }
    return result;
  }

  /// Whether [s] is a usable (non-empty) string argument.
  bool checkStringParam(String s) {
    return s.isNotEmpty;
  }

  /// Canonicalizes a value+unit [Pair], returning a new [Pair] whose unit is
  /// the base-unit form and whose value has been scaled accordingly. Bare
  /// affine special units (Cel, [degF]) are routed through their ratio scale
  /// (K) so temperature Pairs can be canonicalized despite having no
  /// multiplicative canonical form.
  Pair getCanonicalForm(Pair value) {
    assert(
      checkStringParam(value.unit),
      paramError(
        'getCanonicalForm',
        'value.unit',
        'must not be null or empty',
      ),
    );

    final term = ExpressionParser(model).parse(value.unit);

    // Unlike unit-level canonicalization (which must throw for affine
    // scales — no multiplicative form exists), a Pair carries the actual
    // measurement value, so a bare Cel/[degF] can be converted onto its
    // ratio scale (K) and canonicalized from there. This is what lets
    // FHIRPath/CQL compare temperatures across scales.
    final special = _offsetHandlerFor(term);
    if (special != null) {
      return getCanonicalForm(
        Pair(value: special.toRatio(value.value), unit: special.getUnits()),
      );
    }

    final c = Converter(model, handlers).convert(term);
    Pair p;
    p = Pair(
      value: value.value.multiply(c.value),
      unit: ExpressionComposer().composeCanonical(c, false),
    );
    if (value.value.isWholeNumber()) {
      p.value.checkForCouldBeWholeNumber();
    }
    return p;
  }

  /// Converts a numeric [value] from [sourceUnit] to [destUnit], returning
  /// the converted value. Affine special units (Cel, [degF]) are converted
  /// through their ratio scale (K). Throws [UcumException] when the two units
  /// do not share a canonical form (are not convertible).
  UcumDecimal convert(UcumDecimal value, String sourceUnit, String destUnit) {
    assert(
      checkStringParam(sourceUnit),
      paramError('convert', 'sourceUnit', 'must not be null or empty'),
    );
    assert(
      checkStringParam(destUnit),
      paramError('convert', 'destUnit', 'must not be null or empty'),
    );

    if (sourceUnit == destUnit) {
      return value;
    }

    final srcTerm = ExpressionParser(model).parse(sourceUnit);
    final dstTerm = ExpressionParser(model).parse(destUnit);

    // Affine special units (Cel, [degF]) have no multiplicative canonical
    // form, so the canonical path below cannot handle them (the Converter
    // throws, as Ucum-java does). A *bare* offset unit is instead converted
    // through its ratio scale (K): scale in, convert linearly, scale out —
    // the approach ucum-lhc uses. Compound or prefixed offset units (Cel/s,
    // mCel) still throw from the Converter rather than silently mis-convert.
    final srcSpecial = _offsetHandlerFor(srcTerm);
    final dstSpecial = _offsetHandlerFor(dstTerm);
    if (srcSpecial != null || dstSpecial != null) {
      final ratioValue = srcSpecial == null ? value : srcSpecial.toRatio(value);
      final ratioSource = srcSpecial?.getUnits() ?? sourceUnit;
      final ratioDest = dstSpecial?.getUnits() ?? destUnit;
      final converted = ratioSource == ratioDest
          ? ratioValue
          : convert(ratioValue, ratioSource, ratioDest);
      final special =
          dstSpecial == null ? converted : dstSpecial.fromRatio(converted);
      if (value.isWholeNumber()) {
        special.checkForCouldBeWholeNumber();
      }
      return special;
    }

    final src = Converter(model, handlers).convert(srcTerm);
    final dst = Converter(model, handlers).convert(dstTerm);
    final s = ExpressionComposer().composeCanonical(src, false);
    final d = ExpressionComposer().composeCanonical(dst, false);

    if (s != d) {
      throw UcumException(
        'Unable to convert between units $sourceUnit and $destUnit as they '
        'do not have matching canonical forms ($s and $d respectively)',
      );
    }

    final canValue = value.multiply(src.value);
    final res = canValue.divide(dst.value);

    if (value.isWholeNumber()) {
      res.checkForCouldBeWholeNumber();
    }

    return res;
  }

  /// Divides the [dividend] quantity by the [divisor] quantity, composing a
  /// `dividend/divisor` unit (parenthesizing compound operands) and returning
  /// the canonicalized result [Pair].
  Pair divideBy(Pair dividend, Pair divisor) {
    final unit =
        "${dividend.unit.contains("/") || dividend.unit.contains("*") ? "(${dividend.unit})" : dividend.unit}/${divisor.unit.contains("/") || divisor.unit.contains("*") ? "(${divisor.unit})" : divisor.unit}";
    final res = Pair(value: dividend.value.divide(divisor.value), unit: unit);
    return getCanonicalForm(res);
  }

  /// A friendlier display of [code] with the UCUM square-bracket markers
  /// (used for non-metric/customary codes such as `[in_i]`) stripped out.
  String getCommonDisplay(String code) {
    return code.replaceAll('[', '').replaceAll(']', '');
  }

  /// Whether [units1] and [units2] measure the same dimension, i.e. share a
  /// canonical base-unit form and so can be converted between each other.
  bool isComparable(String units1, String units2) {
    final u1 = getCanonicalUnits(_ratioUnits(units1));
    final u2 = getCanonicalUnits(_ratioUnits(units2));
    return u1 == u2;
  }

  /// Substitutes a bare affine special unit (Cel, [degF]) with its ratio
  /// scale unit (K), so comparability and equality can be decided even
  /// though the affine unit itself has no canonical form. [convert] handles
  /// the actual affine arithmetic.
  String _ratioUnits(String unit) {
    final special = _offsetHandlerFor(ExpressionParser(model).parse(unit));
    return special?.getUnits() ?? unit;
  }

  /// If [term] is exactly one bare symbol — no prefix, exponent 1, nothing
  /// multiplied or divided — of a special unit whose handler has an offset
  /// (an affine scale such as Cel or [degF]), returns that handler.
  SpecialUnitHandler? _offsetHandlerFor(Term term) {
    if (term.op != null || term.term != null) {
      return null;
    }
    final comp = term.comp;
    if (comp is! Symbol || comp.prefix != null || (comp.exponent ?? 1) != 1) {
      return null;
    }
    final unit = comp.unit;
    if (unit is! DefinedUnit || !(unit.isSpecial ?? false)) {
      return null;
    }
    final handler = handlers.get(unit.code);
    return (handler != null && handler.hasOffset()) ? handler : null;
  }

  /// Multiplies the two quantities [o1] and [o2], composing an `o1.o2` unit
  /// and returning the canonicalized product [Pair]. Wraps any failure in a
  /// [UcumException].
  Pair multiply(Pair o1, Pair o2) {
    try {
      final resultValue = o1.value.multiply(o2.value);
      final resultCode = '${o1.unit}.${o2.unit}';
      final result = Pair(value: resultValue, unit: resultCode);
      return getCanonicalForm(result);
    } catch (e) {
      throw UcumException(e.toString());
    }
  }

  /// Whether [validatedQuantity]'s unit resolves to valid UCUM (directly or
  /// via a known common-unit synonym).
  bool isValid(ValidatedQuantity validatedQuantity) =>
      resolveCommonUnit(validatedQuantity.unit) != null;

  /// Quantity equality with unit conversion. Because the operands are
  /// [ValidatedQuantity]s (the lenient, FHIR-facing type), common synonyms
  /// are resolved first ('1 inch' == '2.54 cm'); the String-based APIs
  /// ([validate], [convert], [isComparable]) remain spec-strict.
  bool isEqual(ValidatedQuantity value1, ValidatedQuantity value2) {
    final u1 = resolveCommonUnit(value1.unit);
    final u2 = resolveCommonUnit(value2.unit);
    if (u1 == null || u2 == null || !isComparable(u1, u2)) {
      return false;
    }
    final converted = convert(value2.value, u2, u1);
    return value1.value.equalsValue(converted);
  }
}
