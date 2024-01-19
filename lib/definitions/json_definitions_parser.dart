import '../ucum.dart';

class JsonDefinitionsParser {
  UcumModel parse(Map<String, dynamic> json) {
    try {
      return parseFromJson(json);
    } catch (e) {
      throw UcumException(e.toString());
    }
  }

  DateTime? parseDateFromVersionControlString(String versionControlString) {
    final datePattern =
        RegExp(r'(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2} [+-]\d{4})');

    final match = datePattern.firstMatch(versionControlString);
    if (match != null) {
      final dateString = match.group(1)!;
      final dateComponents = dateString.split(' ');

      final datePart = dateComponents[0];
      final timePart = dateComponents[1];
      final offsetPart = dateComponents[2];

      final dateTimeString = '${datePart}T$timePart$offsetPart';
      return DateTime.parse(dateTimeString);
    } else {
      return null;
      // throw FormatException('Invalid date format in version control string');
    }
  }

  UcumModel parseFromJson(Map<String, dynamic> json) {
    var ucumModel = UcumModel(null, null, null);

    for (final prefix in json['prefixes']) {
      ucumModel.prefixes.add(Prefix(
        code: prefix['code'],
        codeUC: prefix['CODE'],
        name: prefix['name'],
        printSymbol: prefix['printSymbol'],
        value: Decimal.fromString(prefix['value']),
      ));
    }

    for (final baseUnit in json['baseUnits']) {
      ucumModel.baseUnits.add(BaseUnit(
        code: baseUnit['code'],
        codeUC: baseUnit['CODE'],
        name: baseUnit['name'],
        printSymbol: baseUnit['printSymbol'],
        property: baseUnit['property'],
        dim: baseUnit['dim'],
      ));
    }

    for (final definedUnit in json['definedUnit']) {
      ucumModel.definedUnits.add(DefinedUnit(
        code: definedUnit['code'],
        codeUC: definedUnit['CODE'],
        name: definedUnit['name'],
        printSymbol: definedUnit['printSymbol'],
        property: definedUnit['property'],
        metric: definedUnit['isMetric'],
        isSpecial: definedUnit['isSpecial'],
        class_: definedUnit['class'],
        value: Value(
          unit: definedUnit['value']['unit'],
          unitUC: definedUnit['value']['UNIT'],
          value: Decimal.fromString(definedUnit['value']['value']),
          text: definedUnit['value']['text'],
        ),
      ));
    }

    return ucumModel;
  }
}
