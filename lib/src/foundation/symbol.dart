import 'package:ucum/src/internal.dart';

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

/// A single unit occurrence within a parsed expression: a [unit] optionally
/// carrying an SI [prefix] and raised to an [exponent].
///
/// For example `km2` parses to a [Symbol] with unit `m`, prefix `k`, and
/// exponent `2`. It is one of the two kinds of [Component] a [Term] can hold.
class Symbol extends Component {
  /// Creates a symbol from an optional [unit], [prefix], and [exponent].
  Symbol({this.unit, this.prefix, this.exponent});

  /// The unit this symbol refers to; either a [BaseUnit] or a [DefinedUnit].
  UcumUnit? unit; // may be Base UcumUnit or DefinedUcumUnit

  /// The SI prefix applied to [unit], present only when the unit is metric.
  Prefix? prefix; // only if UcumUnit is metric

  /// The power the unit is raised to (may be negative for inverse units).
  int? exponent;

  /// Whether an SI [prefix] has been applied to this symbol.
  bool hasPrefix() {
    return prefix != null;
  }

  /// Negates [exponent] in place, converting the symbol to its reciprocal
  /// power (used when moving a factor across a division operator).
  void invertExponent() {
    if (exponent != null) {
      exponent = -exponent!;
    }
  }

  @override
  String toString() =>
      'Symbol(Unit: $unit, Prefix: $prefix, Exponent: $exponent)';
}
