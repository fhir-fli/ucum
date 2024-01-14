import 'package:test/test.dart';
import 'package:ucum/java.dart';

void main() {
  group('UcumIssue6_7Tests', () {
    late UcumService ucumService;

    setUpAll(() async {
      ucumService = await getUcumEssenceService();
    });

    test('testDecimalPrecision', () async {
      final result =
          await ucumService.convert(Decimal.fromString('15'), '/min', '/h');
      expect(result.asDecimal(), '900');
    });

    // test('testDecimalEquals', () async {
    //   final dec1 = Decimal.fromInt(42);
    //   final dec2 = Decimal.fromInt(42);
    //   expect(dec1, equals(dec2));

    //   final dec3 = Decimal.fromString('42.00');
    //   final dec4 = Decimal.fromString('42.00');
    //   expect(dec3, equals(dec4));

    //   final dec5 = Decimal.fromString('42.000');
    //   final dec6 = Decimal.fromString('42.00');
    //   expect(dec5, isNot(equals(dec6)));
    // });
  });
}

Future<UcumService> getUcumEssenceService() async {
  final fileName = 'lib/java/resources/ucum-essence.xml';
  final ucumService = await UcumEssenceService.fromFile(fileName);
  return ucumService;
}
