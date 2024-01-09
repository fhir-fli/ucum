import 'dart:io';

import 'ucum.dart'; // Import for File operations

// UcumEssenceService implements the UcumService interface
class UcumEssenceService implements UcumService {
  static const String ucumOid = '2.16.840.1.113883.6.8';

  late UcumModel model;
  Registry handlers = Registry();

  // Private constructor
  UcumEssenceService._();

  // Constructor with Stream
  UcumEssenceService.fromStream(Stream<List<int>> stream) {
    try {
      // Dart doesn't have direct support for parsing Streams synchronously,
      // so this may need to be handled asynchronously in your actual implementation.
    } catch (e) {
      throw UcumException(e.toString());
    }
  }

  static Future<UcumEssenceService> fromFile(String filename) async {
    var file = File(filename);
    if (!file.existsSync()) {
      throw UcumException('File does not exist');
    }
    try {
      var parser = XmlDefinitionsParser();
      var model = await parser.parse(file.readAsStringSync());
      return UcumEssenceService._()..model = model;
    } catch (e) {
      throw UcumException(e.toString());
    }
  }

  String paramError(String method, String param, String msg) {
    return '${this.runtimeType}.$method.$param is not acceptable: $msg';
  }

  @override
  UcumVersionDetails ucumIdentification() {
    return UcumVersionDetails(model.revisionDate, model.version);
  }

  @override
  UcumModel getModel() {
    return model;
  }

  @override
  List<UcumConcept> search(ConceptKind kind, String text, bool isRegex) {
    assert(text.isNotEmpty,
        paramError('search', 'text', 'must not be null or empty'));
    return Search().doSearch(model, kind, text, isRegex);
  }

  @override
  List<String> validateUCUM() {
    return UcumValidator(model: model, handlers: handlers).validate();
  }

  @override
  Set<String> getProperties() {
    Set<String> result = <String>{};
    for (var unit in model.definedUnits) {
      result.add(unit.property);
    }
    return result;
  }

  @override
  String validate(String unit) {
    assert(unit.isNotEmpty,
        paramError('validate', 'unit', 'must not be null or empty'));
    try {
      new ExpressionParser(model).parse(unit);
      return '';
    } catch (e) {
      return e.toString();
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
      Term term = ExpressionParser(model).parse(unit);
      Canonical can = Converter(model, handlers).convert(term);
      String cu = ExpressionComposer().composeCanonical(can, false);
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
      Term term = ExpressionParser(model).parse(unit);
      Canonical can = Converter(model, handlers).convert(term);
      String cu = ExpressionComposer().composeCanonical(can, false);
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
      return "(unity)";
    }
    assert(checkStringParam(unit),
        paramError('analyse', 'unit', 'must not be null or empty'));
    Term term = ExpressionParser(model).parse(unit);
    return FormalStructureComposer().compose(term);
  }

// Dart translation of the `getCanonicalUnits` method
  String getCanonicalUnits(String unit) {
    assert(checkStringParam(unit),
        paramError('getCanonicalUnits', 'unit', 'must not be null or empty'));
    try {
      Term term = ExpressionParser(model).parse(unit);
      return ExpressionComposer()
          .composeCanonical(Converter(model, handlers).convert(term), false);
    } catch (e) {
      throw UcumException('Error processing $unit: ${e.toString()}');
    }
  }

// Dart translation of the `getDefinedForms` method
  List<DefinedUnit> getDefinedForms(String code) {
    assert(checkStringParam(code),
        paramError('getDefinedForms', 'code', 'must not be null or empty'));
    List<DefinedUnit> result = [];
    for (DefinedUnit unit in model.definedUnits) {
      if (!unit.isSpecial && code == getCanonicalUnits(unit.code)) {
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
        checkStringParam(value.code),
        paramError(
            'getCanonicalForm', 'value.code', 'must not be null or empty'));

    Term term = ExpressionParser(model).parse(value.code);
    Canonical c = Converter(model, handlers).convert(term);
    Pair p;
    p = Pair(value.value.multiply(c.value),
        ExpressionComposer().composeCanonical(c, false));
    if (value.value.isWholeNumber()) {
      p.value.checkForCouldBeWholeNumber();
    }
    return p;
  }

  @override
  Decimal convert(Decimal value, String sourceUnit, String destUnit) {
    assert(checkStringParam(sourceUnit),
        paramError("convert", "sourceUnit", "must not be null or empty"));
    assert(checkStringParam(destUnit),
        paramError("convert", "destUnit", "must not be null or empty"));

    if (sourceUnit == destUnit) {
      return value;
    }

    Canonical src = Converter(model, handlers)
        .convert(ExpressionParser(model).parse(sourceUnit));
    Canonical dst = Converter(model, handlers)
        .convert(ExpressionParser(model).parse(destUnit));
    String s = ExpressionComposer().composeCanonical(src, false);
    String d = ExpressionComposer().composeCanonical(dst, false);

    if (s != d) {
      throw UcumException(
          "Unable to convert between units $sourceUnit and $destUnit as they do not have matching canonical forms ($s and $d respectively)");
    }

    Decimal canValue = value.multiply(src.value);
    Decimal res = canValue.divide(dst.value);

    if (value.isWholeNumber()) {
      res.checkForCouldBeWholeNumber();
    }

    return res;
  }

  @override
  Pair divideBy(Pair dividend, Pair divisor) {
    String code = (dividend.code.contains("/") || dividend.code.contains("*")
            ? "(${dividend.code})"
            : dividend.code) +
        "/" +
        (divisor.code.contains("/") || divisor.code.contains("*")
            ? "(${divisor.code})"
            : divisor.code);
    Pair res = Pair(dividend.value.divide(divisor.value), code);
    return getCanonicalForm(res);
  }

  @override
  String getCommonDisplay(String code) {
    return code.replaceAll("[", "").replaceAll("]", "");
  }

  @override
  bool isComparable(String units1, String units2) {
    String u1 = getCanonicalUnits(units1);
    String u2 = getCanonicalUnits(units2);
    return u1 == u2;
  }

  @override
  Pair multiply(Pair o1, Pair o2) {
    // Assuming the Pair class has a constructor that takes a Decimal and a String
    // and that Decimal has a multiply method.
    try {
      var resultValue = o1.value.multiply(o2.value);
      var resultCode = '${o1.code}.${o2.code}';
      Pair result = Pair(resultValue, resultCode);
      return getCanonicalForm(result);
    } catch (e) {
      throw UcumException(e.toString());
    }
  }
}
