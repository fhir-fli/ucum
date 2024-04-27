import '../ucum.dart'; // Import for File operations

// UcumService implements the UcumService interface
class UcumService {
  // Private constructor
  UcumService._();

  factory UcumService() => _ucumService;

  static final UcumService _ucumService = UcumService._();

  static const String ucumOid = '2.16.840.1.113883.6.8';

  final UcumModel model = UcumModel();
  Registry handlers = Registry();

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

    final Canonical src = Converter(model, handlers)
        .convert(ExpressionParser(model).parse(sourceUnit));
    final Canonical dst = Converter(model, handlers)
        .convert(ExpressionParser(model).parse(destUnit));
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
    final String u1 = getCanonicalUnits(units1);
    final String u2 = getCanonicalUnits(units2);
    return u1 == u2;
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
      validate(validatedQuantity.unit) == null;

  bool isEqual(ValidatedQuantity value1, ValidatedQuantity value2) {
    if (isComparable(value1.unit, value2.unit)) {
      final UcumDecimal value2UcumDecimal =
          convert(value2.value, value2.unit, value1.unit);
      value2 = ValidatedQuantity(value: value2UcumDecimal, unit: value1.unit);
      return value1.value.equalsValue(value2.value);
    } else {
      return false;
    }
  }
}
