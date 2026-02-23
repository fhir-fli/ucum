// ignore_for_file: avoid_print

import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

void main() {
  group('UcumDecimal division', () {
    test('10.0 / 4 should equal 2.5', () {
      final UcumDecimal a = UcumDecimal.fromString('10.0');
      final UcumDecimal b = UcumDecimal.fromString('4');
      final UcumDecimal result = a.divide(b);
      print('10.0 / 4 = $result');
      expect(result.comparesTo(UcumDecimal.fromString('2.5')), equals(0));
    });

    test('10 / 4 should equal 2.5', () {
      final UcumDecimal a = UcumDecimal.fromString('10');
      final UcumDecimal b = UcumDecimal.fromString('4');
      final UcumDecimal result = a.divide(b);
      print('10 / 4 = $result');
      expect(result.comparesTo(UcumDecimal.fromString('2.5')), equals(0));
    });

    test('5.0 / 2.0 should equal 2.5', () {
      final UcumDecimal a = UcumDecimal.fromString('5.0');
      final UcumDecimal b = UcumDecimal.fromString('2.0');
      final UcumDecimal result = a.divide(b);
      print('5.0 / 2.0 = $result');
      expect(result.comparesTo(UcumDecimal.fromString('2.5')), equals(0));
    });
  });

  group('UcumDecimal division precision tracking', () {
    test('10 / 3 should have 2 significant digits', () {
      final UcumDecimal a = UcumDecimal.fromString('10');
      final UcumDecimal b = UcumDecimal.fromString('3');
      final UcumDecimal result = a.divide(b);
      print('10 / 3 = $result');
      expect(result.asUcumDecimal(), equals('3.3'));
    });

    test('10.0 / 3 should have 3 significant digits', () {
      final UcumDecimal a = UcumDecimal.fromString('10.0');
      final UcumDecimal b = UcumDecimal.fromString('3');
      final UcumDecimal result = a.divide(b);
      print('10.0 / 3 = $result');
      expect(result.asUcumDecimal(), equals('3.33'));
    });

    test('10.00 / 3 should have 4 significant digits', () {
      final UcumDecimal a = UcumDecimal.fromString('10.00');
      final UcumDecimal b = UcumDecimal.fromString('3');
      final UcumDecimal result = a.divide(b);
      print('10.00 / 3 = $result');
      expect(result.asUcumDecimal(), equals('3.333'));
    });

    test('10.00 / 3.0 should have 2 significant digits', () {
      final UcumDecimal a = UcumDecimal.fromString('10.00');
      final UcumDecimal b = UcumDecimal.fromString('3.0');
      final UcumDecimal result = a.divide(b);
      print('10.00 / 3.0 = $result');
      expect(result.asUcumDecimal(), equals('3.3'));
    });
  });

  group('UcumService division', () {
    late UcumService ucumService;

    setUpAll(() {
      ucumService = UcumService();
    });

    test('divideBy: 10.0 mg / 4 mg should be 2.5', () {
      final Pair o1 =
          Pair(value: UcumDecimal.fromString('10.0'), unit: 'mg');
      final Pair o2 =
          Pair(value: UcumDecimal.fromString('4'), unit: 'mg');
      final Pair result = ucumService.divideBy(o1, o2);
      print('10.0 mg / 4 mg = ${result.value} ${result.unit}');
      expect(result.value.comparesTo(UcumDecimal.fromString('2.5')), equals(0));
    });

    test('convert 10.0 from [in_i] to cm', () {
      final UcumDecimal result =
          ucumService.convert(UcumDecimal.fromString('10.0'), '[in_i]', 'cm');
      print('10.0 [in_i] to cm = $result');
      // 10.0 inches = 25.4 cm
      expect(result.comparesTo(UcumDecimal.fromString('25.4')), equals(0));
    });
  });
}
