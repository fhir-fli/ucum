import '../internal.dart'; // Import for File operations

// UcumService implements the UcumService interface
class UcumService {
  // Private constructor
  UcumService._();

  factory UcumService() => _ucumService;

  static final UcumService _ucumService = UcumService._();

  static const String ucumOid = '2.16.840.1.113883.6.8';

  final UcumModel model = UcumModel();
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
    ..sort((String a, String b) => b.length.compareTo(a.length));

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
    String candidate = unit;
    for (final String key in _synonymKeysByLength) {
      candidate = candidate.replaceAll(
          RegExp('\\b${RegExp.escape(key)}\\b', caseSensitive: false),
          commonUnitSynonyms[key]!);
    }
    if (candidate != unit && validate(candidate) == null) {
      return candidate;
    }
    return null;
  }

  String paramError(String method, String param, String msg) {
    return '$runtimeType.$method.$param is not acceptable: $msg';
  }

  List<UcumConcept> search(ConceptKind kind, String text, bool isRegex) {
    assert(text.isNotEmpty,
        paramError('search', 'text', 'must not be null or empty'));
    return Search().doSearch(model, kind, text, isRegex);
  }

  List<String> validateUCUM() {
    return UcumValidator(model: model, handlers: handlers).validate();
  }

  Set<String> getProperties() {
    final Set<String> result = <String>{};
    for (final DefinedUnit unit in model.definedUnits) {
      result.add(unit.property);
    }
    return result;
  }

  String? validate(String unit) {
    assert(unit.isNotEmpty,
        paramError('validate', 'unit', 'must not be null or empty'));
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

// Dart translation of validateInProperty method
  String validateInProperty(String unit, String property) {
    assert(unit.isNotEmpty,
        paramError('validate', 'unit', 'must not be null or empty'));
    assert(
        property.isNotEmpty,
        paramError(
            'validateInProperty', 'property', 'must not be null or empty'));

    try {
      // Assuming Term, ExpressionParser, Converter, Canonical, ExpressionComposer are implemented in Dart
      final Term term = ExpressionParser(model).parse(unit);
      final Canonical can = Converter(model, handlers).convert(term);
      final String cu = ExpressionComposer().composeCanonical(can, false);
      if (can.units.length == 1) {
        if (property == can.units[0].base.property) {
          return '';
        } else {
          return 'unit $unit is of the property type ${can.units[0].base.property} ($cu), not $property as required.';
        }
      }
      // Defined special case
      if (property == 'concentration' && (cu == 'g/L' || cu == 'mol/L')) {
        return '';
      }
      return 'unit $unit has the base units $cu, and are not from the property $property as required.';
    } catch (e) {
      return e.toString();
    }
  }

// Dart translation of validateCanonicalUnits method
  String validateCanonicalUnits(String unit, String canonical) {
    assert(unit.isNotEmpty,
        paramError('validate', 'unit', 'must not be null or empty'));
    assert(
        canonical.isNotEmpty,
        paramError('validateCanonicalUnits', 'canonical',
            'must not be null or empty'));

    try {
      final Term term = ExpressionParser(model).parse(unit);
      final Canonical can = Converter(model, handlers).convert(term);
      final String cu = ExpressionComposer().composeCanonical(can, false);
      if (canonical != cu) {
        return 'unit $unit has the base units $cu, not $canonical as required.';
      }
      return '';
    } catch (e) {
      return e.toString();
    }
  }

  // Dart translation of the `analyse` method
  String analyse(String unit) {
    if (Utilities.noString(unit)) {
      return '(unity)';
    }
    assert(checkStringParam(unit),
        paramError('analyse', 'unit', 'must not be null or empty'));
    final Term term = ExpressionParser(model).parse(unit);
    return FormalStructureComposer().compose(term);
  }

// Dart translation of the `getCanonicalUnits` method
  String getCanonicalUnits(String unit) {
    assert(checkStringParam(unit),
        paramError('getCanonicalUnits', 'unit', 'must not be null or empty'));
    try {
      final Term term = ExpressionParser(model).parse(unit);
      return ExpressionComposer()
          .composeCanonical(Converter(model, handlers).convert(term), false);
    } catch (e) {
      throw UcumException('Error processing $unit: $e');
    }
  }

// Dart translation of the `getDefinedForms` method
  List<DefinedUnit> getDefinedForms(String code) {
    assert(checkStringParam(code),
        paramError('getDefinedForms', 'code', 'must not be null or empty'));
    final List<DefinedUnit> result = <DefinedUnit>[];
    for (final DefinedUnit unit in model.definedUnits) {
      if (!(unit.isSpecial ?? false) && code == getCanonicalUnits(unit.code)) {
        result.add(unit);
      }
    }
    return result;
  }

  bool checkStringParam(String s) {
    return s.isNotEmpty;
  }

// Dart translation of the `getCanonicalForm` method
  Pair getCanonicalForm(Pair value) {
    assert(
        checkStringParam(value.unit),
        paramError(
            'getCanonicalForm', 'value.unit', 'must not be null or empty'));

    final Term term = ExpressionParser(model).parse(value.unit);

    // Unlike unit-level canonicalization (which must throw for affine
    // scales — no multiplicative form exists), a Pair carries the actual
    // measurement value, so a bare Cel/[degF] can be converted onto its
    // ratio scale (K) and canonicalized from there. This is what lets
    // FHIRPath/CQL compare temperatures across scales.
    final SpecialUnitHandler? special = _offsetHandlerFor(term);
    if (special != null) {
      return getCanonicalForm(
          Pair(value: special.toRatio(value.value), unit: special.getUnits()));
    }

    final Canonical c = Converter(model, handlers).convert(term);
    Pair p;
    p = Pair(
        value: value.value.multiply(c.value),
        unit: ExpressionComposer().composeCanonical(c, false));
    if (value.value.isWholeNumber()) {
      p.value.checkForCouldBeWholeNumber();
    }
    return p;
  }

  UcumDecimal convert(UcumDecimal value, String sourceUnit, String destUnit) {
    assert(checkStringParam(sourceUnit),
        paramError('convert', 'sourceUnit', 'must not be null or empty'));
    assert(checkStringParam(destUnit),
        paramError('convert', 'destUnit', 'must not be null or empty'));

    if (sourceUnit == destUnit) {
      return value;
    }

    final Term srcTerm = ExpressionParser(model).parse(sourceUnit);
    final Term dstTerm = ExpressionParser(model).parse(destUnit);

    // Affine special units (Cel, [degF]) have no multiplicative canonical
    // form, so the canonical path below cannot handle them (the Converter
    // throws, as Ucum-java does). A *bare* offset unit is instead converted
    // through its ratio scale (K): scale in, convert linearly, scale out —
    // the approach ucum-lhc uses. Compound or prefixed offset units (Cel/s,
    // mCel) still throw from the Converter rather than silently mis-convert.
    final SpecialUnitHandler? srcSpecial = _offsetHandlerFor(srcTerm);
    final SpecialUnitHandler? dstSpecial = _offsetHandlerFor(dstTerm);
    if (srcSpecial != null || dstSpecial != null) {
      final UcumDecimal ratioValue =
          srcSpecial == null ? value : srcSpecial.toRatio(value);
      final String ratioSource = srcSpecial?.getUnits() ?? sourceUnit;
      final String ratioDest = dstSpecial?.getUnits() ?? destUnit;
      final UcumDecimal converted = ratioSource == ratioDest
          ? ratioValue
          : convert(ratioValue, ratioSource, ratioDest);
      final UcumDecimal special =
          dstSpecial == null ? converted : dstSpecial.fromRatio(converted);
      if (value.isWholeNumber()) {
        special.checkForCouldBeWholeNumber();
      }
      return special;
    }

    final Canonical src = Converter(model, handlers).convert(srcTerm);
    final Canonical dst = Converter(model, handlers).convert(dstTerm);
    final String s = ExpressionComposer().composeCanonical(src, false);
    final String d = ExpressionComposer().composeCanonical(dst, false);

    if (s != d) {
      throw UcumException(
          'Unable to convert between units $sourceUnit and $destUnit as they do not have matching canonical forms ($s and $d respectively)');
    }

    final UcumDecimal canValue = value.multiply(src.value);
    final UcumDecimal res = canValue.divide(dst.value);

    if (value.isWholeNumber()) {
      res.checkForCouldBeWholeNumber();
    }

    return res;
  }

  Pair divideBy(Pair dividend, Pair divisor) {
    final String unit =
        "${dividend.unit.contains("/") || dividend.unit.contains("*") ? "(${dividend.unit})" : dividend.unit}/${divisor.unit.contains("/") || divisor.unit.contains("*") ? "(${divisor.unit})" : divisor.unit}";
    final Pair res =
        Pair(value: dividend.value.divide(divisor.value), unit: unit);
    return getCanonicalForm(res);
  }

  String getCommonDisplay(String code) {
    return code.replaceAll('[', '').replaceAll(']', '');
  }

  bool isComparable(String units1, String units2) {
    final String u1 = getCanonicalUnits(_ratioUnits(units1));
    final String u2 = getCanonicalUnits(_ratioUnits(units2));
    return u1 == u2;
  }

  /// Substitutes a bare affine special unit (Cel, [degF]) with its ratio
  /// scale unit (K), so comparability and equality can be decided even
  /// though the affine unit itself has no canonical form. [convert] handles
  /// the actual affine arithmetic.
  String _ratioUnits(String unit) {
    final SpecialUnitHandler? special =
        _offsetHandlerFor(ExpressionParser(model).parse(unit));
    return special?.getUnits() ?? unit;
  }

  /// If [term] is exactly one bare symbol — no prefix, exponent 1, nothing
  /// multiplied or divided — of a special unit whose handler has an offset
  /// (an affine scale such as Cel or [degF]), returns that handler.
  SpecialUnitHandler? _offsetHandlerFor(Term term) {
    if (term.op != null || term.term != null) {
      return null;
    }
    final Component? comp = term.comp;
    if (comp is! Symbol || comp.prefix != null || (comp.exponent ?? 1) != 1) {
      return null;
    }
    final UcumUnit? unit = comp.unit;
    if (unit is! DefinedUnit || !(unit.isSpecial ?? false)) {
      return null;
    }
    final SpecialUnitHandler? handler = handlers.get(unit.code);
    return (handler != null && handler.hasOffset()) ? handler : null;
  }

  Pair multiply(Pair o1, Pair o2) {
    // Assuming the Pair class has a constructor that takes a UcumDecimal and a String
    // and that UcumDecimal has a multiply method.
    try {
      final UcumDecimal resultValue = o1.value.multiply(o2.value);
      final String resultCode = '${o1.unit}.${o2.unit}';
      final Pair result = Pair(value: resultValue, unit: resultCode);
      return getCanonicalForm(result);
    } catch (e) {
      throw UcumException(e.toString());
    }
  }

  bool isValid(ValidatedQuantity validatedQuantity) =>
      resolveCommonUnit(validatedQuantity.unit) != null;

  /// Quantity equality with unit conversion. Because the operands are
  /// [ValidatedQuantity]s (the lenient, FHIR-facing type), common synonyms
  /// are resolved first ('1 inch' == '2.54 cm'); the String-based APIs
  /// ([validate], [convert], [isComparable]) remain spec-strict.
  bool isEqual(ValidatedQuantity value1, ValidatedQuantity value2) {
    final String? u1 = resolveCommonUnit(value1.unit);
    final String? u2 = resolveCommonUnit(value2.unit);
    if (u1 == null || u2 == null || !isComparable(u1, u2)) {
      return false;
    }
    final UcumDecimal converted = convert(value2.value, u2, u1);
    return value1.value.equalsValue(converted);
  }
}
