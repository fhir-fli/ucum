import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

/// Regression tests for ValidatedQuantity comparison/equality bugs fixed in
/// 0.9.0: String operands compared raw values without unit conversion,
/// >= / <= dropped the equality case for numeric operands, hashCode was
/// inconsistent with the unit-converting ==, and fromString corrupted units
/// containing digits.
void main() {
  group('fromString', () {
    test('does not delete digits inside the unit', () {
      // replaceAll used to turn '2 m2' into unit 'm' by deleting the '2'.
      final ValidatedQuantity q = ValidatedQuantity.fromString('2 m2');
      expect(q.value.asUcumDecimal(), '2');
      expect(q.unit, 'm2');

      final ValidatedQuantity q2 = ValidatedQuantity.fromString('10 10*3/uL');
      expect(q2.value.asUcumDecimal(), '10');
      expect(q2.unit, '10*3/uL');
    });

    test('quoted units still parse', () {
      final ValidatedQuantity q = ValidatedQuantity.fromString("5 'mg'");
      expect(q.unit, 'mg');
    });
  });

  group('ordering operators convert units', () {
    final ValidatedQuantity oneMeter = ValidatedQuantity.fromString('1 m');

    test('String operand is unit-converted', () {
      // Used to compare 1 against 50 raw and return false.
      expect(oneMeter > '50 cm', isTrue);
      expect(oneMeter < '200 cm', isTrue);
      expect(oneMeter >= '100 cm', isTrue);
      expect(oneMeter <= '100 cm', isTrue);
    });

    test('>= and <= include equality for numeric operands', () {
      // Used to be false: the num branch dropped the equality disjunct.
      final ValidatedQuantity five = ValidatedQuantity.fromNumber(5);
      expect(five >= 5, isTrue);
      expect(five <= 5, isTrue);
      expect(five >= 4, isTrue);
      expect(five <= 6, isTrue);
      expect(five >= 6, isFalse);
    });

    test('incomparable units throw instead of comparing raw values', () {
      expect(() => oneMeter > '1 g', throwsA(isA<UcumException>()));
      expect(() => oneMeter > 5, throwsA(isA<UcumException>()));
    });

    test('temperature ordering across scales', () {
      final ValidatedQuantity bodyTemp = ValidatedQuantity.fromString('37 Cel');
      expect(bodyTemp > '98 [degF]', isTrue);
      expect(bodyTemp < '99 [degF]', isTrue);
      expect(bodyTemp >= '310.15 K', isTrue);
      expect(bodyTemp <= '310.15 K', isTrue);
    });
  });

  group('== and hashCode are consistent', () {
    test('equal quantities in different units hash identically', () {
      final ValidatedQuantity meter = ValidatedQuantity.fromString('1 m');
      final ValidatedQuantity centimeters =
          ValidatedQuantity.fromString('100 cm');
      expect(meter == centimeters, isTrue);
      expect(meter.hashCode, centimeters.hashCode);
      expect(<ValidatedQuantity>{meter}.contains(centimeters), isTrue);
    });

    test('temperatures across scales hash identically', () {
      final ValidatedQuantity celsius = ValidatedQuantity.fromString('37 Cel');
      final ValidatedQuantity kelvin =
          ValidatedQuantity.fromString('310.15 K');
      expect(celsius == kelvin, isTrue);
      expect(celsius.hashCode, kelvin.hashCode);
    });

    test('unequal quantities behave as map keys', () {
      final Map<ValidatedQuantity, String> map = <ValidatedQuantity, String>{
        ValidatedQuantity.fromString('1 m'): 'one meter',
      };
      expect(map[ValidatedQuantity.fromString('100 cm')], 'one meter');
      expect(map[ValidatedQuantity.fromString('2 m')], isNull);
    });
  });

  group('compareTo', () {
    test('sorts across units', () {
      final List<ValidatedQuantity> sorted = <ValidatedQuantity>[
        ValidatedQuantity.fromString('2 m'),
        ValidatedQuantity.fromString('50 cm'),
        ValidatedQuantity.fromString('1000 mm'),
      ]..sort();
      expect(sorted.map((ValidatedQuantity q) => q.unit).toList(),
          <String>['cm', 'mm', 'm']);
    });

    test('incomparable units throw a clear UcumException', () {
      expect(
          () => ValidatedQuantity.fromString('1 m')
              .compareTo(ValidatedQuantity.fromString('1 g')),
          throwsA(isA<UcumException>()));
    });
  });
}
