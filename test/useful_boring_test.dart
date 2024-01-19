import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

void main() {
  group("grey's tests", () {
    late UcumEssenceService ucumService;

    setUpAll(() async {
      ucumService = await getUcumEssenceService() as UcumEssenceService;
    });

    test('make units', () {
      final prefixes =
          ucumService.model.definedUnits.map((e) => e.toJson()).toList();
      File('defined_units.json').writeAsString(jsonEncode(prefixes));
      final ValidatedQuantity quantity1 =
          ValidatedQuantity.fromString('4 hours');
      expect(quantity1.value.asDecimal(), '4');
      expect(quantity1.code, 'hours');
      final ValidatedQuantity quantity2 =
          ValidatedQuantity.fromString('16.5559988 mph');
      expect(ucumService.validate(quantity2.code), isNull);
    });

    test('Equal', () {
      final ValidatedQuantity quantity3 = ValidatedQuantity.fromString('4 m');
      final ValidatedQuantity quantity4 =
          ValidatedQuantity.fromString('400 cm');
      expect(ucumService.isEqual(quantity3, quantity4), true);
      final ValidatedQuantity quantity5 =
          ValidatedQuantity.fromString('2.54 cm');
      final ValidatedQuantity quantity6 =
          ValidatedQuantity.fromString('1 inch');
      expect(ucumService.isEqual(quantity5, quantity6), true);
    });
  });
}

Future<UcumService> getUcumEssenceService() async {
  final fileName = 'lib/resources/ucum-essence.xml';
  final ucumService = await UcumEssenceService.fromFile(fileName);
  return ucumService;
}
