import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

void main() {
  group('Ucum Issues #6 & # 7 Tests', () {
    late UcumService ucumService;

    setUpAll(() {
      ucumService = getUcumService();
    });

    test('testUcumDecimalPrecision', () {
      final UcumDecimal result =
          ucumService.convert(UcumDecimal.fromString('15'), '/min', '/h');
      expect(result.asUcumDecimal(), '900');
    });

    test('testUcumDecimalEquals', () {
      final UcumDecimal dec1 = UcumDecimal.fromInt(42);
      final UcumDecimal dec2 = UcumDecimal.fromInt(42);
      expect(dec1, equals(dec2));

      final UcumDecimal dec3 = UcumDecimal.fromString('42.00');
      final UcumDecimal dec4 = UcumDecimal.fromString('42.00');
      expect(dec3, equals(dec4));

      final UcumDecimal dec5 = UcumDecimal.fromString('42.000');
      final UcumDecimal dec6 = UcumDecimal.fromString('42.00');
      expect(dec5, isNot(equals(dec6)));
    });
  });
}

UcumService getUcumService() => UcumService();
