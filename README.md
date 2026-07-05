# ucum

UCUM ([Unified Code for Units of Measure](https://unitsofmeasure.org)) for
Dart: unit validation, canonicalization, conversion, and quantity arithmetic
for healthcare and scientific measurements. A port of the reference
[Ucum-java](https://github.com/FHIR/Ucum-java) library by Grahame Grieve /
Health Intersections, used across the [fhir-fli](https://github.com/fhir-fli)
ecosystem (FHIRPath, CQL).

The full official UCUM functional test suite (575 cases) runs in CI, and the
unit data is generated from **ucum-essence 2.2** (2024-06-17) by a checked-in
generator (`tool/generate_definitions.dart`) — no runtime XML parsing, no
assets, works on every platform including web.

## Usage

```dart
import 'package:ucum/ucum.dart';

final ucum = UcumService();

// Which UCUM data is loaded?
print(ucum.ucumIdentification()); // UCUM specification 2.2, ... (2024-06-17)

// Strict validation: null means valid UCUM.
print(ucum.validate('mg/dL')); // null (valid)
print(ucum.validate('mcg'));   // error message — 'mcg' is not UCUM

// Explicit lenient resolution of common non-UCUM spellings.
print(ucum.resolveCommonUnit('mcg'));    // ug
print(ucum.resolveCommonUnit('mcg/mL')); // ug/mL
print(ucum.resolveCommonUnit('hours'));  // h

// Conversion — including correct affine temperature handling.
print(ucum.convert(UcumDecimal.fromString('37'), 'Cel', 'K'));        // 310.15
print(ucum.convert(UcumDecimal.fromString('98.6'), '[degF]', 'Cel')); // 37
print(ucum.convert(UcumDecimal.fromString('15'), '/min', '/h'));      // 900

// Canonical forms and comparability.
print(ucum.getCanonicalUnits('N'));       // g.m.s-2
print(ucum.isComparable('N', 'kg.m/s2')); // true
```

### ValidatedQuantity

`ValidatedQuantity` is the lenient, FHIR/CQL-facing value+unit type: it
resolves common spellings through `resolveCommonUnit` for every comparison
and arithmetic operation, while keeping the original unit string for display
and FHIRPath calendar-duration semantics.

```dart
final height = ValidatedQuantity.fromString('72 inch');
print(height == ValidatedQuantity.fromString('182.88 cm')); // true
print(height.convertTo('cm'));                              // 182.88 'cm'

final temp = ValidatedQuantity.fromString('37 Cel');
print(temp == ValidatedQuantity.fromString('310.15 K'));    // true
print(temp > '98 [degF]');                                  // true

final dose = ValidatedQuantity.fromString('250 mcg');
print(dose + '0.25 mg'); // 500 (in dose's resolved unit, ug)
```

### Strict vs lenient, by design

- `validate`, `convert`, `isComparable`, `getCanonicalUnits` are
  **spec-strict**: only real UCUM is accepted, matching Ucum-java.
- `resolveCommonUnit` is the **explicit** leniency layer (the approach used
  by NLM's [ucum-lhc](https://github.com/lhncbc/ucum-lhc)): known synonym
  tokens are substituted and the corrected code is returned. Valid codes are
  never rewritten — `mph` stays milli-phot, because it *is* valid UCUM.
- `ValidatedQuantity` uses the lenient layer automatically.

### Affine temperatures

Celsius and Fahrenheit are affine scales — they have no multiplicative
canonical form, so unit-level canonicalization (`getCanonicalUnits('Cel')`)
throws, exactly like Ucum-java. Conversions and quantity comparisons work
correctly (`convert`, `getCanonicalForm(Pair)`, `ValidatedQuantity`) by
routing through the Kelvin ratio scale, the approach used by ucum-lhc.
Compound or prefixed affine units (`Cel/s`, `mCel`) throw rather than
silently mis-convert.

## Regenerating the unit data

```bash
dart run tool/generate_definitions.dart   # reads tool/ucum-essence.xml
dart format lib/src/resources
```

## Credits and license

- Ported from [Ucum-java](https://github.com/FHIR/Ucum-java) (BSD-3-Clause,
  © Health Intersections Pty Ltd) — the original copyright headers are
  retained in the ported source files.
- UCUM and the ucum-essence data are © Regenstrief Institute, Inc., used
  under the [UCUM license](https://unitsofmeasure.org/license).
- This package: BSD-3-Clause, © 2023+ Grey Faulkenberry / FHIR-FLI.
