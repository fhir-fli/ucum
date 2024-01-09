import 'dart:io';
import 'package:xml/xml.dart';
import '../ucum.dart';

class XmlDefinitionsParser implements DefinitionsProvider {
  Future<UcumModel> parse(String filename) async {
    try {
      var file = File(filename);
      var contents = await file.readAsString();
      return parseFromString(contents);
    } catch (e) {
      throw UcumException(e.toString());
    }
  }

  UcumModel parseFromString(String contents) {
    var document = XmlDocument.parse(contents);
    var rootElement = document.findElements('root').first;

    // Parse attributes
    var version = rootElement.getAttribute('version') ?? '';
    var revision = rootElement.getAttribute('revision') ?? '';
    var revisionDateAttribute = rootElement.getAttribute('revision-date');
    DateTime? revisionDate;

    if (revisionDateAttribute != null) {
      revisionDate = DateTime.parse(revisionDateAttribute);
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
      codeUC: element.getAttribute('CODE')!,
      property: '', // You may need to provide a default value for property
      metric: element.getAttribute('isMetric') == 'yes',
      isSpecial: element.getAttribute('isSpecial') == 'yes',
      class_: element.getAttribute('class'),
      value: value,
    );

    unit.metric = element.getAttribute('isMetric') == 'yes';
    unit.isSpecial = element.getAttribute('isSpecial') == 'yes';
    unit.class_ = element.getAttribute('class');

    // Parse names
    var names = element.findElements('name');
    for (var name in names) {
      unit.names.add(name.text);
    }

    // Parse printSymbol and property
    var printSymbol = element.findElements('printSymbol').first.text;
    var property = element.findElements('property').first.text;
    unit.printSymbol = printSymbol;
    unit.property = property;

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
      unitUC: x.getAttribute('UNIT')!,
      value: val!,
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

  @override
  Future<UcumModel> parseFromStream(Stream<List<int>> stream) {
    // TODO: implement parseFromStream
    throw UnimplementedError();
  }
}
