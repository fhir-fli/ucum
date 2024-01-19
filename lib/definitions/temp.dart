import 'dart:convert';
import 'dart:io';

import 'package:ucum/definitions/ucum_json_defs.dart';
import 'package:ucum/ucum.dart';

Future<void> main() async {
  final baseUnits = <DefinedUnit>[];
  for (final defs in ucumJsonDefs['units'] as List) {
    if (!defs['isBase']) {
      baseUnits.add(
        DefinedUnit(
          code: defs['csCode'],
          codeUC: defs['ciCode'],
          property: defs['property'],
          metric: defs['isMetric'],
          isSpecial: defs['isSpecial'],
          name: defs['name'],
          class_: defs['intcust'],
          synonyms: defs['synonyms'] != null
              ? (defs['synonyms'] as String)
                  .split(';')
                  .map((e) => e.trim())
                  .toList()
              : null,
          printSymbol: defs['printSymbol'],
          value: Value(
            unit: defs['csUnitString'],
            unitUC: defs['ciUnitString'],
            value: defs['baseFactorStr'] != null
                ? Decimal.fromString(defs['baseFactorStr'].toString())
                : null,
            text: defs['baseFactorStr'].toString(),
          ),
        ),
      );
    }
  }
  File('defined_units.json')
      .writeAsString(jsonEncode(baseUnits.map((e) => e.toJson()).toList()));
}
    
        // "value": {
        //     "unit": "[yd_i]2",
        //     "UNIT": "[YD_I]2",
        //     "value": "1",
        //     "text": "1"
        // }
    
    