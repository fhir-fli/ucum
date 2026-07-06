// ignore_for_file: avoid_print
import 'package:ucum/ucum.dart';

/// Demonstrates the main entry points of package:ucum.
void main() {
  final UcumService ucum = UcumService();

  // Which UCUM data is loaded?
  print(ucum.ucumIdentification()); // UCUM specification 2.2, ...

  // Strict validation: null means valid UCUM.
  print(ucum.validate('mg/dL')); // null (valid)
  print(ucum.validate('mcg')); // error message ('mcg' is not UCUM)

  // Explicit lenient resolution of common non-UCUM spellings.
  print(ucum.resolveCommonUnit('mcg')); // ug
  print(ucum.resolveCommonUnit('mcg/mL')); // ug/mL
  print(ucum.resolveCommonUnit('hours')); // h

  // Conversion (including correct affine temperature handling).
  print(ucum.convert(UcumDecimal.fromString('37'), 'Cel', 'K')); // 310.15
  print(
      ucum.convert(UcumDecimal.fromString('98.6'), '[degF]', 'Cel')); // 37.0000
  print(ucum.convert(UcumDecimal.fromString('15'), '/min', '/h')); // 900

  // Canonical forms and comparability.
  print(ucum.getCanonicalUnits('N')); // g.m.s-2
  print(ucum.isComparable('N', 'kg.m/s2')); // true

  // ValidatedQuantity: the lenient, FHIR/CQL-facing value+unit type.
  final ValidatedQuantity height = ValidatedQuantity.fromString('72 inch');
  final ValidatedQuantity heightCm = ValidatedQuantity.fromString('182.88 cm');
  print(height == heightCm); // true
  print(height.convertTo('cm')); // 182.88 'cm'

  final ValidatedQuantity bodyTemp = ValidatedQuantity.fromString('37 Cel');
  print(bodyTemp == ValidatedQuantity.fromString('310.15 K')); // true
  print(bodyTemp > '98 [degF]'); // true

  // Quantity arithmetic.
  final ValidatedQuantity dose = ValidatedQuantity.fromString('250 mcg');
  print(dose + '0.25 mg'); // 500 'mcg' equivalent, in dose's unit
  print(ValidatedQuantity.fromString('10 mg') /
      ValidatedQuantity.fromString('5 mL')); // canonical g/m3 form
}
