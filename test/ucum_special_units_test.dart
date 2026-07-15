import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

/// Regression tests for affine (offset) special units and the lexer.
///
/// The official UcumFunctionalTests.xml contains NO Cel/[degF] conversion
/// cases, so these conversions must be covered here. Before 0.9.0 the
/// converter folded the affine offset into the multiplicative factor and
/// `convert(37, 'Cel', 'K')` returned -10069.55.
void main() {
  final ucumService = UcumService();

  UcumDecimal convert(String value, String from, String to) =>
      ucumService.convert(UcumDecimal.fromString(value), from, to);

  void expectValue(UcumDecimal actual, String expected) {
    expect(
      actual.equalsValue(UcumDecimal.fromString(expected)),
      isTrue,
      reason: 'expected $expected, got ${actual.asUcumDecimal()}',
    );
  }

  group('affine temperature conversions', () {
    test('Cel -> K', () {
      expectValue(convert('37', 'Cel', 'K'), '310.15');
      expectValue(convert('100', 'Cel', 'K'), '373.15');
      expectValue(convert('0', 'Cel', 'K'), '273.15');
      expectValue(convert('-273.15', 'Cel', 'K'), '0');
    });

    test('K -> Cel', () {
      expectValue(convert('310.15', 'K', 'Cel'), '37');
      expectValue(convert('273.15', 'K', 'Cel'), '0');
    });

    test('[degF] -> Cel', () {
      expectValue(convert('98.6', '[degF]', 'Cel'), '37');
      expectValue(convert('32', '[degF]', 'Cel'), '0');
      expectValue(convert('212', '[degF]', 'Cel'), '100');
    });

    test('Cel -> [degF]', () {
      expectValue(convert('37', 'Cel', '[degF]'), '98.6');
      expectValue(convert('0', 'Cel', '[degF]'), '32');
      expectValue(convert('100', 'Cel', '[degF]'), '212');
    });

    test('[degF] -> K', () {
      expectValue(convert('32', '[degF]', 'K'), '273.15');
      // 0 degF = 459.67 * 5/9 K = 255.37222... (non-terminating)
      final zeroF = convert('0', '[degF]', 'K');
      expect(zeroF.asUcumDecimal(), startsWith('255.3722'));
    });

    test('round trip preserves value', () {
      final roundTripped =
          ucumService.convert(convert('37', 'Cel', '[degF]'), '[degF]', 'Cel');
      expectValue(roundTripped, '37');
    });
  });

  group('affine units are loud, never silently wrong', () {
    test('unit-level canonicalization of an affine unit throws', () {
      // A multiplicative canonical form cannot represent an affine scale;
      // Ucum-java throws here too.
      expect(
        () => ucumService.getCanonicalUnits('Cel'),
        throwsA(isA<UcumException>()),
      );
    });

    test('getCanonicalForm of a measurement Pair converts through K', () {
      // A Pair carries the value, so the affine conversion IS possible at
      // the measurement level (unlike the unit level above).
      final canonical = ucumService.getCanonicalForm(
        Pair(value: UcumDecimal.fromString('37'), unit: 'Cel'),
      );
      expect(canonical.unit, 'K');
      expect(
        canonical.value.equalsValue(UcumDecimal.fromString('310.15')),
        isTrue,
      );
    });

    test('compound expressions containing an affine unit throw', () {
      expect(() => convert('1', 'Cel/s', 'K/s'), throwsA(isA<UcumException>()));
      expect(() => convert('1', 'Cel2', 'K2'), throwsA(isA<UcumException>()));
    });

    test('prefixed affine units throw', () {
      expect(() => convert('1', 'mCel', 'K'), throwsA(isA<UcumException>()));
    });

    test('affine to incommensurable unit throws', () {
      expect(() => convert('1', 'Cel', 'g'), throwsA(isA<UcumException>()));
    });
  });

  group('comparability and equality across temperature scales', () {
    test('isComparable resolves affine units through their ratio scale', () {
      expect(ucumService.isComparable('Cel', 'K'), isTrue);
      expect(ucumService.isComparable('Cel', '[degF]'), isTrue);
      expect(ucumService.isComparable('[degF]', 'K'), isTrue);
      expect(ucumService.isComparable('Cel', 'g'), isFalse);
    });

    test('isEqual across scales', () {
      expect(
        ucumService.isEqual(
          ValidatedQuantity.fromString('37 Cel'),
          ValidatedQuantity.fromString('310.15 K'),
        ),
        isTrue,
      );
      expect(
        ucumService.isEqual(
          ValidatedQuantity.fromString('32 [degF]'),
          ValidatedQuantity.fromString('0 Cel'),
        ),
        isTrue,
      );
      expect(
        ucumService.isEqual(
          ValidatedQuantity.fromString('37 Cel'),
          ValidatedQuantity.fromString('311 K'),
        ),
        isFalse,
      );
    });
  });

  group('negative zero', () {
    test('subtraction producing zero is not negative', () {
      final zero = convert('32', '[degF]', 'Cel');
      expect(zero.isZero(), isTrue);
      expect(zero.negative, isFalse);
      expect(zero.comparesTo(UcumDecimal.fromString('0')), 0);
      expect(zero.asUcumDecimal(), isNot(startsWith('-')));
    });
  });

  group('lexer', () {
    test('unterminated annotation errors instead of hanging', () {
      // Before 0.9.0 this spun forever: nextChar() returns null at end of
      // input, which never matched the loop's exit conditions.
      expect(ucumService.validate('{unterminated'), isNotNull);
      expect(ucumService.validate('{'), isNotNull);
      expect(ucumService.validate('mg{'), isNotNull);
    });

    test('valid annotations still parse', () {
      expect(ucumService.validate('{annotation}'), isNull);
      expect(ucumService.validate('mg{total}'), isNull);
      expect(ucumService.validate('{RBC}/uL'), isNull);
    });
  });

  group('linear special units unchanged', () {
    test('holding handlers still canonicalize linearly', () {
      expect(ucumService.getCanonicalUnits('B[V]'), 'C-1.g.m2.s-2');
      expect(ucumService.isComparable('B[V]', 'V'), isTrue);
    });
  });
}
