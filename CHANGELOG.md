## 0.9.0

Correctness release with breaking changes. All 660+ tests pass, including
the full official UCUM functional suite and the downstream fhirpath (1069)
and cql (595) suites.

**Critical fixes**
- Affine temperature conversions were silently wrong: `convert(37, 'Cel',
  'K')` returned **-10069.55** because the converter folded the affine
  offset into the multiplicative factor. Conversions now route through the
  ratio scale via `SpecialUnitHandler.toRatio`/`fromRatio` (ucum-lhc's
  functional-converter model): `37 Cel -> 310.15 K`, `98.6 [degF] -> 37
  Cel`. Unit-level canonicalization of affine units throws, as Ucum-java
  does; `getCanonicalForm(Pair)` converts through K (the measurement value
  is available at the Pair level); compound/prefixed affine units (`Cel/s`,
  `mCel`) throw instead of mis-converting.
- The lexer hung forever on an unterminated annotation (`'{...'`); it now
  throws `unterminated annotation`.
- The unit data tables were unreproducible, stale (pre-2.2 essence, old
  Avogadro number), and contained 462 non-essence shadow units — 186 with
  empty definitions ('mcg' canonicalized to unity) and several corrupted
  codes. Data is now generated from ucum-essence 2.2 (2024-06-17) by the
  checked-in `tool/generate_definitions.dart`; `[FNU]`/`[NTU]` added; the
  essence version is exposed via `ucumIdentification()` and
  `UcumModel.version`.

**Breaking: strict validation vs explicit resolution**
- `validate()` and the parser are now spec-strict (Ucum-java parity):
  display names and plurals ('meter', 'seconds', 'mcg', 'inch') no longer
  validate. The new explicit `UcumService.resolveCommonUnit` +
  `commonUnitSynonyms` map provide the lenient path ('mcg' -> 'ug',
  including inside compounds: 'mcg/mL' -> 'ug/mL'). `ValidatedQuantity`
  resolves automatically, so `'2.54 cm' == '1 inch'` still works.
- `ValidatedQuantity` fixes: `>`/`<` with String operands now unit-convert
  (`1 m > '50 cm'` was false); `>=`/`<=` include equality for numeric
  operands (`VQ(5) >= 5` was false); `hashCode` is canonical-form based and
  consistent with the unit-converting `==`; numeric operands uniformly mean
  dimensionless `'1'` (CQL promotion rule); `fromString` no longer deletes
  digits inside units (`'2 m2'`); `compareTo` throws a clear
  `UcumException` for incomparable units.
- `UcumDecimal`: negative zero is normalized (`-0` compared less than `0`).
- Package layout: implementation moved under `lib/src/` with a curated
  `package:ucum/ucum.dart` barrel — the lexer/parser/converter internals
  are no longer exported. Import the barrel only.
- Web/WASM support restored: the test-only `dart:io` XML helper left
  `lib/`, and `xml` is now a dev dependency.
- SDK floor raised to `^3.5.0`; added pub.dev topics; rewrote README and
  example against the real API.

## 0.8.0

- Fix +, -, % operators to convert units before arithmetic

## 0.7.0

- Fixed 6 unit definition data bugs (Bd, Oe, [S], [diop], [mesh_i], [mu_0])
- Fixed converter precision to use 24 significant digits consistently
- Removed deprecated lints from analysis_options.yaml
- Updated dependencies (xml ^6.6.1, lints ^6.1.0, test ^1.29.0)

## 0.6.0

- Added asDouble getter to UcumDecimal

## 0.5.0

- Fixed errors with doAdd in UcumDecimal

## 0.4.0

- More lints

## 0.3.0

- Just more linting updates

## 0.2.0

- Updates for linting errors
- I want my pub points

## 0.1.0

- First publication of this package for Dart
- Based on Java-ucum package
