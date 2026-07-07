// ***************************************************************************
// BSD 3-Clause License
// Copyright (c) 2006+, Health Intersections Pty Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
//
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// * Neither the name of the copyright holder nor the names of its
//   contributors may be used to endorse or promote products derived from
//   this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import 'package:ucum/src/internal.dart';

/// Normalized ("canonical") form of a unit expression: a scalar multiplier
/// paired with the list of base units (each raised to an exponent) that the
/// original expression reduces to. Produced by [Converter].
class Canonical {
  /// Creates a canonical form with the given scalar [value] and an initially
  /// empty list of base [units].
  Canonical(this.value);

  /// The accumulated scalar multiplier that scales the base-unit product back
  /// to the original expression's magnitude.
  UcumDecimal value;

  /// The base units this expression reduces to, each with its exponent.
  List<CanonicalUnit> units = <CanonicalUnit>[];

  /// Multiplies [value] by the decimal [multiplicand] in place.
  void multiplyValueDecimal(UcumDecimal multiplicand) {
    value = value * multiplicand;
  }

  /// Multiplies [value] by the integer [multiplicand] in place.
  void multiplyValueInt(int multiplicand) {
    value = value * UcumDecimal.fromInt(multiplicand);
  }

  /// Divides [value] by the decimal [divisor] in place.
  void divideValueDecimal(UcumDecimal divisor) {
    value = value / divisor;
  }

  /// Divides [value] by the integer [divisor] in place.
  void divideValueInt(int divisor) {
    value = value / UcumDecimal.fromInt(divisor);
  }

  @override
  String toString() => 'Canonical(value: $value, units: $units)';
}

/// A single base unit in a [Canonical] form, raised to an integer exponent
/// (e.g. `m2` or `s-1`).
class CanonicalUnit {
  /// Creates a canonical unit for [base] raised to [exponent].
  CanonicalUnit(this.base, this.exponent);

  /// The SI base unit this factor refers to.
  BaseUnit base;

  /// The power [base] is raised to; may be negative for denominators.
  int exponent;

  @override
  String toString() => 'CanonicalUnit(base: $base, exponent: $exponent)';
}
