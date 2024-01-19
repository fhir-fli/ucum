import 'dart:convert';
import 'dart:io';

import '../ucum.dart';
import 'ucum_unit.dart';

Future<void> main() async {
  final tempString = await File('new1.json').readAsString();
  final definedString = await File('new2.json').readAsString();
  final tempMap = jsonDecode(tempString);
  final definedMap = jsonDecode(definedString);
  final tempList = <DefinedUnit>[];
  final definedList = <DefinedUnit>[];
  for (final entry in tempMap) {
    if (entry['value'] != null) {
      tempList.add(DefinedUnit.fromJson(entry));
    }
  }
  for (final entry in definedMap) {
    if (entry['value'] != null) {
      definedList.add(DefinedUnit.fromJson(entry));
    }
  }
  final finalList = <DefinedUnit>[];
  for (final entry in tempList) {
    final index =
        definedList.indexWhere((element) => element.code == entry.code);
    if (index != -1) {
      final defined = definedList[index];
      if (entry.code != defined.code) {
        throw 'Codes do not match: ${entry.code} - ${defined.code}';
      }
      if (entry.codeUC != defined.codeUC) {
        throw 'UC do not match: ${entry.codeUC} - ${defined.codeUC}';
      }
      if (entry.property != defined.property) {
        throw 'Properties do not match: ${entry.codeUC} - ${defined.codeUC}';
      }
      if (entry.isMetric != null &&
          defined.isMetric != null &&
          entry.isMetric != defined.isMetric) {
        throw 'IsMetric does not match: ${entry.isMetric} - ${defined.isMetric}';
      }
      if (entry.isSpecial != defined.isSpecial) {
        throw 'IsSpecial does not match: ${entry.isSpecial} - ${defined.isSpecial}';
      }
      if (entry.class_ != null &&
          defined.class_ != null &&
          entry.class_ != defined.class_) {
        throw 'Class does not match: ${entry.class_} - ${defined.class_}';
      }
      if (entry.printSymbol != defined.printSymbol) {
        throw 'PrintSymbol does not match: ${entry.printSymbol} - ${defined.printSymbol}';
      }

      final names = <String>[];
      names.addAll(entry.names);
      names.addAll(defined.names);

      if (entry.value.unit != defined.value.unit) {
        throw 'Units do not match: ${entry.value.unit} - ${defined.value.unit}';
      }

      final unitUc = entry.value.unitUC == null || entry.value.unitUC == 'null'
          ? defined.value.unitUC
          : entry.value.unitUC;

      final value = entry.value.value == null || entry.value.value == 'null'
          ? defined.value.value
          : entry.value.value;

      final text = entry.value.text == null || entry.value.text == 'null'
          ? defined.value.text
          : entry.value.text;

      finalList.add(
        DefinedUnit(
          code: entry.code,
          codeUC: entry.codeUC,
          property: entry.property,
          isMetric: entry.isMetric ?? defined.isMetric,
          isSpecial: entry.isSpecial,
          class_: entry.class_ ?? defined.class_,
          printSymbol: entry.printSymbol,
          names: names.toSet().toList(),
          value: Value(
            unit: entry.value.unit,
            unitUC: unitUc,
            value: value == null ? null : Decimal.fromString(value.toString()),
            text: text,
          ),
        ),
      );
    }
  }

  for (final entry in definedList) {
    final lastIndex =
        finalList.indexWhere((element) => element.code == entry.code);
    if (lastIndex == -1) {
      final index =
          tempList.indexWhere((element) => element.code == entry.code);
      if (index != -1) {
        final temp = tempList[index];
        if (entry.code != temp.code) {
          throw 'Codes do not match: ${entry.code} - ${temp.code}';
        }
        if (entry.codeUC != temp.codeUC) {
          throw 'Codes do not match: ${entry.codeUC} - ${temp.codeUC}';
        }
        if (entry.property != temp.property) {
          throw 'Properties do not match: ${entry.codeUC} - ${temp.codeUC}';
        }
        if (entry.isMetric != null &&
            temp.isMetric != null &&
            entry.isMetric != temp.isMetric) {
          throw 'IsMetric does not match: ${entry.isMetric} - ${temp.isMetric}';
        }
        if (entry.isSpecial != temp.isSpecial) {
          throw 'IsSpecial does not match: ${entry.isSpecial} - ${temp.isSpecial}';
        }
        if (entry.class_ != null &&
            temp.class_ != null &&
            entry.class_ != temp.class_) {
          throw 'Class does not match: ${entry.class_} - ${temp.class_}';
        }
        if (entry.printSymbol != temp.printSymbol) {
          throw 'PrintSymbol does not match: ${entry.printSymbol} - ${temp.printSymbol}';
        }

        final names = <String>[];
        names.addAll(entry.names);
        names.addAll(temp.names);

        if (entry.value.unit != temp.value.unit) {
          throw 'Units do not match: ${entry.value.unit} - ${temp.value.unit}';
        }

        final unitUc =
            entry.value.unitUC == null || entry.value.unitUC == 'null'
                ? temp.value.unitUC
                : entry.value.unitUC;

        final value = entry.value.value == null || entry.value.value == 'null'
            ? temp.value.value
            : entry.value.value;

        final text = entry.value.text == null || entry.value.text == 'null'
            ? temp.value.text
            : entry.value.text;

        finalList.add(
          DefinedUnit(
            code: entry.code,
            codeUC: entry.codeUC,
            property: entry.property,
            isMetric: entry.isMetric ?? temp.isMetric,
            isSpecial: entry.isSpecial,
            class_: entry.class_ ?? temp.class_,
            printSymbol: entry.printSymbol,
            names: names.toSet().toList(),
            value: Value(
              unit: entry.value.unit,
              unitUC: unitUc,
              value:
                  value == null ? null : Decimal.fromString(value.toString()),
              text: text,
            ),
          ),
        );
      }
    }
  }

  finalList.sort(((a, b) => a.code.compareTo(b.code)));
  await File('final.json')
      .writeAsString(jsonEncode(finalList.map((e) => e.toJson()).toList()));

  // await File('new1.json')
  //     .writeAsString(jsonEncode(tempList.map((e) => e.toJson()).toList()));
  // await File('new2.json')
  //     .writeAsString(jsonEncode(definedList.map((e) => e.toJson()).toList()));
  // final definedUnits = <DefinedUnit>[];
  // for (final unit in unitsData) {
  //   definedUnits.add(DefinedUnit(
  //     code: unit.csCode_,
  //     codeUC: unit.ciCode_,
  //     property: unit.property_,
  //     isMetric: unit.isMetric_,
  //     isSpecial: unit.isSpecial_,
  //     value: Value(
  //       unit: unit.csUnitString_,
  //       unitUC: unit.ciUnitString_,
  //       value: unit.baseFactorStr_ == null && unit.baseFactor_ == null
  //           ? null
  //           : Decimal.fromString(
  //               unit.baseFactorStr_ ?? unit.baseFactor_.toString()),
  //       text: unit.baseFactorStr_ ?? unit.baseFactor_.toString(),
  //     ),
  //     class_: unit.class_,
  //     synonyms: unit.synonyms_?.map((e) => e.trim()).toList(),
  //     printSymbol: unit.printSymbol_,
  //   ));
  // }
  // File('temp.json')
  //     .writeAsString(jsonEncode(definedUnits.map((e) => e.toJson()).toList()));
}
