import 'dart:io';
import 'package:xml/xml.dart';
import '../ucum.dart';

class XmlDefinitionsParser {
  Future<UcumModel> parse(String filename) async {
    try {
      File file = File(filename);
      String contents = await file.readAsString();
      return parseFromString(contents);
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

  UcumModel parseFromString(String contents) {
    var document = XmlDocument.parse(contents);
    var rootElement = document.findElements('root').first;

    // Parse attributes
    String version = rootElement.getAttribute('version') ?? '';
    String revision = rootElement.getAttribute('revision') ?? '';
    String? revisionDateAttribute = rootElement.getAttribute('revision-date');
    DateTime? revisionDate;

    if (revisionDateAttribute != null) {
      DateTime? revisionDate =
          parseDateFromVersionControlString(revisionDateAttribute);
      if (revisionDate == null) {
        revisionDate = DateTime.parse(revisionDateAttribute);
      }
    }

    var ucumModel = UcumModel(version, revision, revisionDate);

    for (var element in rootElement.children) {
      if (element is XmlElement) {
        switch (element.name.local) {
          case 'prefix':
            ucumModel.prefixes.add(parsePrefix(element));
            break;
          case 'base-unit':
            ucumModel.baseUnits.add(parseBaseUnit(element));
            break;
          case 'unit':
            ucumModel.definedUnits.add(parseUnit(element));
            break;
          default:
            throw UcumException('Unknown element name ${element.name.local}');
        }
      }
    }
    return ucumModel;
  }

  DefinedUnit parseUnit(XmlElement element) {
    // Parse value
    var valueElement = element.findElements('value').first;
    var value =
        parseValue(valueElement, 'unit ${element.getAttribute('Code')}');

    var unit = DefinedUnit(
      code: element.getAttribute('Code')!,
      codeUC: element.getAttribute('CODE'),
      property: '',
      isMetric: element.getAttribute('isMetric') == 'yes',
      isSpecial: element.getAttribute('isSpecial') == 'yes',
      class_: element.getAttribute('class'),
      value: value,
    );

    unit.isMetric = element.getAttribute('isMetric') == 'yes';
    unit.isSpecial = element.getAttribute('isSpecial') == 'yes';
    unit.class_ = element.getAttribute('class');

    // Parse names
    var names = element.findElements('name');
    for (var name in names) {
      unit.names.add(name.text);
    }

    // Parse printSymbol and propert
    final printSymbolList = element.findElements('printSymbol');
    final propertyList = element.findElements('property');
    var printSymbol =
        printSymbolList.isEmpty ? null : printSymbolList.first.text;
    var property = propertyList.isEmpty ? null : propertyList.first.text;

    unit.printSymbol = printSymbol;
    if (property != null) {
      unit.property = property;
    }

    return unit;
  }

  Value parseValue(XmlElement x, String context) {
    Decimal? val;
    if (x.getAttribute('value') != null) {
      try {
        if (x.getAttribute('value')!.contains('.')) {
          val = Decimal.fromString(
              x.getAttribute('value')!, 24); // unlimited precision for these
        } else {
          val = Decimal.fromString(x.getAttribute('value')!);
        }
      } catch (e) {
        throw UcumException('Error reading $context: ${e.toString()}');
      }
    }

    final value = Value(
      unit: x.getAttribute('Unit')!,
      unitUC: x.getAttribute('UNIT'),
      value: val,
      text: x.text,
    );

    value.text = x.text;

    return value;
  }

  BaseUnit parseBaseUnit(XmlElement element) {
    var base = BaseUnit(
      code: element.getAttribute('Code')!,
      codeUC: element.getAttribute('CODE')!,
      property: '', // You may need to provide a default value for property
      dim: element.getAttribute('dim')!,
    );

    base.dim = element.getAttribute('dim') ?? '';

    // Parse names
    var names = element.findElements('name');
    for (var name in names) {
      base.names.add(name.text);
    }

    // Parse printSymbol and property
    var printSymbol = element.findElements('printSymbol').first.text;
    var property = element.findElements('property').first.text;
    base.printSymbol = printSymbol;
    base.property = property;

    return base;
  }

  Prefix parsePrefix(XmlElement element) {
    var prefix = Prefix(
      code: element.getAttribute('Code')!,
      codeUC: element.getAttribute('CODE')!,
      value: Decimal.fromString(
          element.findElements('value').first.getAttribute('value')),
    );

    // Parse names
    var names = element.findElements('name');
    for (var name in names) {
      prefix.names.add(name.text);
    }

    // Parse printSymbol
    var printSymbol = element.findElements('printSymbol').first.text;
    prefix.printSymbol = printSymbol;

    // Parse value
    var valueElement = element.findElements('value').first;
    var value = Decimal.fromString(valueElement.getAttribute('value'));
    prefix.value = value;

    return prefix;
  }
}
