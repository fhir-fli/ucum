import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

void main() {
  group("grey's tests", () {
    late UcumService ucumService;

    setUpAll(() {
      ucumService = getUcumService();
    });

    test('make units', () {
      final ValidatedQuantity quantity1 =
          ValidatedQuantity.fromString(ucumService, '4 hours');
      expect(quantity1.value.asDecimal(), '4');
      expect(quantity1.code, 'hours');
      final ValidatedQuantity quantity2 =
          ValidatedQuantity.fromString(ucumService, '16.5559988 mph');
      expect(ucumService.validate(quantity2.code), isNull);
    });

    test('Equal', () {
      final ValidatedQuantity quantity3 =
          ValidatedQuantity.fromString(ucumService, '4 m');
      final ValidatedQuantity quantity4 =
          ValidatedQuantity.fromString(ucumService, '400 cm');
      expect(ucumService.isEqual(quantity3, quantity4), true);
      final ValidatedQuantity quantity5 =
          ValidatedQuantity.fromString(ucumService, '2.54 cm');
      final ValidatedQuantity quantity6 =
          ValidatedQuantity.fromString(ucumService, '1 inch');
      expect(ucumService.isEqual(quantity5, quantity6), false);
      expect(ucumService.isEqual(quantity6, quantity5), true);
    });
  });
}

UcumService getUcumService() => UcumService.fromJson();
