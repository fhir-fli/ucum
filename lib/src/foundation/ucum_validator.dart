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

/// Self-checks the integrity of a [UcumModel]: every unit code must parse,
/// round-trip through the composer, and canonicalise, and every special unit
/// must have a registered handler. Returns a list of human-readable problems.
class UcumValidator {
  /// Creates a validator over [model], using [handlers] to check that special
  /// units are handled.
  UcumValidator({required this.model, required this.handlers})
      : result = <String>[];

  /// The unit model being validated.
  UcumModel model;

  /// Accumulated validation messages; empty means the model is internally
  /// consistent.
  List<String> result;

  /// Registry of special-unit handlers, checked for coverage.
  Registry handlers;

  /// Runs every check and returns the collected problem messages.
  List<String> validate() {
    result = <String>[];
    checkCodes();
    checkUnits();
    return result;
  }

  /// Validates that every base and defined unit code parses and round-trips.
  void checkCodes() {
    for (final unit in model.baseUnits) {
      checkUnitCode(unit.code, true);
    }
    for (final unit in model.definedUnits) {
      checkUnitCode(unit.code, true);
    }
  }

  /// Validates each defined unit's definition string, and reports any special
  /// unit that lacks a registered handler.
  void checkUnits() {
    for (final unit in model.definedUnits) {
      if (!(unit.isSpecial ?? false)) {
        checkUnitCode(unit.value.unit ?? '', false);
      } else if (!handlers.exists(unit.code)) {
        result.add('No Handler for ${unit.code}');
      }
    }
  }

  /// Parses [code], checks it composes back to itself and canonicalises
  /// without error, appending any failure to [result]. When [primary] is true,
  /// also enforces bracket balancing and rejects codes with digits outside
  /// `[...]` (which would be ambiguous).
  void checkUnitCode(String code, bool primary) {
    try {
      final term = ExpressionParser(model).parse(code);
      final c = ExpressionComposer().compose(term);
      if (c != code) {
        result.add('Round trip failed: $code -> $c');
      }
      Converter(model, handlers).convert(term);
    } catch (e) {
      result.add('$code: $e');
    }

    if (primary) {
      try {
        // Additional checks for primary codes
        var inBrack = false;
        var nonDigits = false;
        for (var i = 0; i < code.length; i++) {
          final ch = code[i];
          if (ch == '[') {
            if (inBrack) {
              throw Exception('nested [');
            } else {
              inBrack = true;
            }
          }
          if (ch == ']') {
            if (!inBrack) {
              throw Exception('] without [');
            } else {
              inBrack = false;
            }
          }
          nonDigits =
              nonDigits || !(ch.compareTo('0') >= 0 && ch.compareTo('9') <= 0);
          if (ch.compareTo('0') >= 0 &&
              ch.compareTo('9') <= 0 &&
              !inBrack &&
              nonDigits) {
            throw Exception(
                'code $code is ambiguous because it has digits outside []',);
          }
        }
      } catch (e) {
        result.add(e.toString());
      }
    }
  }
}
