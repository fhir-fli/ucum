import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

void main() {
  group('Ucum Issues #6 & # 7 Tests', () {
    late UcumService ucumService;

    setUpAll(() {
      ucumService = getUcumService();
    });

    test('testDecimalPrecision', () {
      final result =
          ucumService.convert(Decimal.fromString('15'), '/min', '/h');
      expect(result.asDecimal(), '900');
    });

    test('testDecimalEquals', () {
      final dec1 = Decimal.fromInt(42);
      final dec2 = Decimal.fromInt(42);
      expect(dec1, equals(dec2));

      final dec3 = Decimal.fromString('42.00');
      final dec4 = Decimal.fromString('42.00');
      expect(dec3, equals(dec4));

      final dec5 = Decimal.fromString('42.000');
      final dec6 = Decimal.fromString('42.00');
      expect(dec5, isNot(equals(dec6)));
    });
  });
}

UcumService getUcumService() => UcumService.fromJson();
