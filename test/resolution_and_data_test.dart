import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

/// Tests for the strict/lenient split introduced in 0.9.0 and for the
/// regenerated essence 2.2 data tables.
///
/// Before 0.9.0, leniency was implemented by display-name fallbacks inside
/// the strict parser plus 462 hand-added shadow DefinedUnits — 186 of which
/// had empty definitions, so 'mcg' canonicalized to unity. Now the model
/// and validate() are spec-strict (Ucum-java parity) and leniency is the
/// explicit UcumService.resolveCommonUnit substitution layer.
void main() {
  final UcumService ucumService = UcumService();

  group('strict validation (Ucum-java parity)', () {
    test('display names and plurals are not valid UCUM', () {
      expect(ucumService.validate('meter'), isNotNull);
      expect(ucumService.validate('seconds'), isNotNull);
      expect(ucumService.validate('hours'), isNotNull);
      expect(ucumService.validate('mcg'), isNotNull);
      expect(ucumService.validate('inch'), isNotNull);
      // Prefix display name + unit ('kilo...' style hybrids).
      expect(ucumService.validate('kseconds'), isNotNull);
    });

    test('real UCUM codes still validate', () {
      expect(ucumService.validate('m'), isNull);
      expect(ucumService.validate('mg/dL'), isNull);
      expect(ucumService.validate('10*3/uL'), isNull);
      expect(ucumService.validate('[in_i]'), isNull);
    });
  });

  group('resolveCommonUnit', () {
    test('valid UCUM passes through unchanged', () {
      expect(ucumService.resolveCommonUnit('mg'), 'mg');
      expect(ucumService.resolveCommonUnit('[in_i]'), '[in_i]');
      // 'mph' is valid UCUM (milli-phot) — never rewritten.
      expect(ucumService.resolveCommonUnit('mph'), 'mph');
    });

    test('known synonyms resolve', () {
      expect(ucumService.resolveCommonUnit('mcg'), 'ug');
      expect(ucumService.resolveCommonUnit('hours'), 'h');
      expect(ucumService.resolveCommonUnit('year'), 'a');
      expect(ucumService.resolveCommonUnit('inch'), '[in_i]');
      expect(ucumService.resolveCommonUnit('meters'), 'm');
    });

    test('synonyms resolve inside compound expressions', () {
      expect(ucumService.resolveCommonUnit('mcg/mL'), 'ug/mL');
      expect(ucumService.resolveCommonUnit('mcg/dL'), 'ug/dL');
    });

    test('unresolvable input returns null', () {
      expect(ucumService.resolveCommonUnit('utterly_bogus'), isNull);
      expect(ucumService.resolveCommonUnit('kseconds'), isNull);
      expect(ucumService.resolveCommonUnit(''), isNull);
    });
  });

  group('mcg regression (was canonicalizing to unity)', () {
    test('5 mcg == 5 ug', () {
      final ValidatedQuantity mcg = ValidatedQuantity.fromString('5 mcg');
      final ValidatedQuantity ug = ValidatedQuantity.fromString('5 ug');
      expect(mcg == ug, isTrue);
      expect(mcg.hashCode, ug.hashCode);
      expect(mcg.isValid(), isTrue);
    });

    test('mcg/mL converts like ug/mL', () {
      final ValidatedQuantity a = ValidatedQuantity.fromString('1 mcg/mL');
      expect(a == ValidatedQuantity.fromString('1 ug/mL'), isTrue);
      expect(a == ValidatedQuantity.fromString('0.1 mg/dL'), isTrue);
    });

    test('lenient duration quantities work', () {
      expect(
          ValidatedQuantity.fromString('4 hours') ==
              ValidatedQuantity.fromString('240 min'),
          isTrue);
      expect(
          ValidatedQuantity.fromString('2.54 cm') ==
              ValidatedQuantity.fromString('1 inch'),
          isTrue);
    });
  });

  group('essence 2.2 data', () {
    test('version is stamped and exposed', () {
      expect(ucumEssenceVersion, '2.2');
      expect(ucumService.model.version, '2.2');
      expect(ucumService.ucumIdentification(), contains('2.2'));
      expect(ucumService.ucumIdentification(), contains('2024-06-17'));
    });

    test('2.2 additions are present', () {
      expect(ucumService.validate('[FNU]'), isNull);
      expect(ucumService.validate('[NTU]'), isNull);
    });

    test('mole uses the 2019 SI Avogadro number', () {
      final UcumDecimal converted =
          ucumService.convert(UcumDecimal.fromString('1'), 'mol', '10*23');
      expect(converted.asUcumDecimal(), startsWith('6.02214076'));
    });

    test('display names match the essence (not invented plurals)', () {
      expect(ucumService.analyse('umol/L'), '(micromole) / (liter)');
      expect(ucumService.analyse('N'), '(newton)');
    });

    test('tables contain exactly the essence units, uncorrupted', () {
      expect(definedUnitsList.length, 305);
      expect(baseUnitsList.length, 7);
      expect(prefixesList.length, 24);
      for (final DefinedUnit unit in definedUnitsList) {
        expect(unit.code.contains('DefinedUnit'), isFalse,
            reason: 'corrupted code: ${unit.code}');
        expect(
            (unit.isSpecial ?? false) ||
                (unit.value.value != null || unit.value.unit != null),
            isTrue,
            reason: 'empty definition: ${unit.code}');
      }
    });
  });
}
