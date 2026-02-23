# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Dart implementation of the UCUM (Unified Code for Units of Measure) library, translated from the official Java version. Provides unit validation, conversion, comparison, and arithmetic for healthcare and scientific measurements. Part of the [fhir-fli](https://github.com/fhir-fli) ecosystem.

## Commands

```bash
# Install dependencies
dart pub get

# Run all tests
dart test

# Run a single test file
dart test test/ucum_functional_test.dart

# Analyze (lint)
dart analyze lib/

# Format
dart format lib/
```

## Architecture

### Processing Pipeline

UCUM unit strings flow through a four-stage pipeline:

1. **Lexer** (`foundation/lexer.dart`) — tokenizes unit strings like `"mg/dL"` into typed tokens
2. **ExpressionParser** (`foundation/expression_parser.dart`) — recursive descent parser producing a `Term` tree
3. **Converter** (`foundation/converter.dart`) — transforms `Term` trees into `Canonical` form (base units + multiplier)
4. **ExpressionComposer** (`foundation/expression_composer.dart`) — renders `Term` trees back to human-readable strings

### Key Classes

- **`UcumService`** (`fhir/ucum_service.dart`) — main public API (singleton). Entry point for validate, convert, isComparable, isEqual, multiply, divideBy, analyse, search.
- **`UcumDecimal`** (`fhir/ucum_decimal.dart`) — arbitrary-precision decimal arithmetic engine. Handles scientific notation and maintains precision through operations. This is where numeric bugs are most likely to originate.
- **`UcumModel`** (`foundation/ucum_model.dart`) — holds all prefixes, base units, and defined units in memory.
- **`ValidatedQuantity`** (`fhir/validated_quantity.dart`) — value+unit pair with validation and cross-unit equality.
- **`Term`** (`foundation/term.dart`) — recursive parse tree node: `comp` (Symbol or Factor) + `op` (multiply/divide) + `term` (next).
- **`Canonical`** (`foundation/canonical.dart`) — normalized representation: a `UcumDecimal` value and list of `CanonicalUnit`s.

### Concept Hierarchy

```
UcumConcept (abstract)
├── UcumUnit (abstract)
│   ├── BaseUnit     — 7 SI base units (meter, kilogram, second, etc.)
│   └── DefinedUnit  — 2000+ derived units
└── Prefix           — 20 SI prefixes (kilo, milli, micro, etc.)
```

### Special Unit Handlers

Temperature (Celsius, Fahrenheit) and other non-linear units use handler classes registered in `special/registry.dart`. Each handler implements `SpecialUnitHandler` for custom conversion logic with offsets.

### Module Layout

| Directory | Purpose |
|-----------|---------|
| `lib/fhir/` | Public API, decimal engine, FHIR-compatible types |
| `lib/foundation/` | Parsing, conversion, model, validation |
| `lib/resources/` | Unit/prefix definitions (generated data, ~350KB) |
| `lib/special/` | Handlers for non-linear unit conversions |

Each module has a barrel export file (e.g., `foundation/foundation.dart`).

## Testing

Tests are in `test/` and use the standard `package:test` framework:

- **`ucum_functional_test.dart`** — parses `resources/UcumFunctionalTests.xml` (official UCUM test suite): validation, conversion, display, multiplication, division
- **`ucum_decimal_test.dart`** — precision arithmetic tests for `UcumDecimal`
- **`ucum_common_unit_test.dart`** — common healthcare unit conversions
- **`ucum_issue_*.dart`** — regression tests for specific GitHub issues
- **`useful_boring_test.dart`** — basic functionality smoke tests

**Always run the full test suite after any change** — this is a precision arithmetic library where small changes can cascade.

## Code Style

Uses Flutter-style analysis with strict casts, strict inference, and strict raw types enabled. See `analysis_options.yaml` for the full lint rule set. Key points:
- `always_specify_types` is enabled
- `prefer_single_quotes` is enabled
- `prefer_final_locals` and `prefer_final_fields` are enabled

## Cautions

- **`lib/resources/defined_units.dart`** is ~334KB of generated unit definitions — avoid reading it in full
- **`test/resources/UcumFunctionalTests.xml`** is the official test XML — large, don't read unnecessarily
- `UcumDecimal` is the most complex and bug-prone file; changes require careful testing
