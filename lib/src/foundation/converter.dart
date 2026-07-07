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

/// Reduces a parsed [Term] tree to its [Canonical] form — the product of SI
/// base units with an accumulated scalar multiplier — by recursively expanding
/// defined units, applying prefixes, and collating repeated base units.
class Converter {
  /// Creates a converter backed by [model] (for unit/prefix lookups) and
  /// [handlers] (for special, non-linear units).
  Converter(this.model, this.handlers);

  /// The unit model providing base units, defined units and prefixes.
  UcumModel model;

  /// Registry of special-unit handlers for non-linear conversions.
  Registry handlers;

  /// Reduces [term] to canonical base-unit form.
  Canonical convert(Term term) {
    return normaliseTerm('  ', term);
  }

  /// Recursively canonicalises [term], multiplying or dividing sub-results
  /// according to each node's operator, then collating and sorting the
  /// resulting base units. [indent] is used only for debug tracing.
  Canonical normaliseTerm(String indent, Term term) {
    final result =
        Canonical(UcumDecimal.fromString('1.00000000000000000000000'));

    debugTerm(indent, 'canonicalise', term);
    var div = false;
    Term? t = term;
    while (t != null) {
      if (t.comp is Term) {
        final temp = normaliseTerm('$indent  ', t.comp! as Term);
        if (div) {
          result.value = result.value.divide(temp.value);
          for (final c in temp.units) {
            c.exponent = -c.exponent;
          }
        } else {
          result.value = result.value.multiply(temp.value);
        }
        result.units.addAll(temp.units);
      } else if (t.comp is Factor) {
        if (div) {
          result.value = result.value.divideInt((t.comp! as Factor).value);
        } else {
          result.value = result.value.multiplyInt((t.comp! as Factor).value);
        }
      } else if (t.comp is Symbol) {
        final o = t.comp! as Symbol;
        final temp = normaliseSymbol(indent, o);
        if (div) {
          result.value = result.value.divide(temp.value);
          for (final c in temp.units) {
            c.exponent = -c.exponent;
          }
        } else {
          result.value = result.value.multiply(temp.value);
        }
        result.units.addAll(temp.units);
      }
      div = t.op == Operator.division;
      t = t.term;
    }

    debugCanonical(indent, 'collate', result);

    for (var i = result.units.length - 1; i >= 0; i--) {
      final sf = result.units[i];
      for (var j = i - 1; j >= 0; j--) {
        final st = result.units[j];
        if (st.base == sf.base) {
          st.exponent = sf.exponent + st.exponent;
          result.units.removeAt(i);
          break;
        }
      }
    }

    for (var i = result.units.length - 1; i >= 0; i--) {
      if (result.units[i].exponent == 0) {
        result.units.removeAt(i);
      }
    }

    debugCanonical(indent, 'sort', result);
    result.units.sort((lhs, rhs) =>
        lhs.base.code.compareTo(rhs.base.code),);
    debugCanonical(indent, 'done', result);

    return result;
  }

  /// Canonicalises a single [sym] (unit + optional prefix + exponent): for a
  /// base unit it emits one [CanonicalUnit]; for a defined unit it expands the
  /// definition, then applies the exponent and prefix value to the scalar.
  Canonical normaliseSymbol(String indent, Symbol sym) {
    final result =
        Canonical(UcumDecimal.fromString('1.00000000000000000000000'));

    if (sym.exponent != null) {
      if (sym.unit is BaseUnit) {
        result.units.add(CanonicalUnit(sym.unit! as BaseUnit, sym.exponent!));
      } else {
        final can =
            expandDefinedUnit(indent, sym.unit! as DefinedUnit);
        for (final c in can.units) {
          c.exponent = c.exponent * sym.exponent!;
        }
        result.units.addAll(can.units);
        if (sym.exponent! > 0) {
          for (var i = 0; i < sym.exponent!; i++) {
            result.value = result.value.multiply(can.value);
          }
        } else {
          for (var i = 0; i > sym.exponent!; i--) {
            result.value = result.value.divide(can.value);
          }
        }
      }
      if (sym.prefix != null) {
        if (sym.exponent! > 0) {
          for (var i = 0; i < sym.exponent!; i++) {
            result.value = sym.prefix?.value == null
                ? result.value
                : result.value.multiply(sym.prefix!.value);
          }
        } else {
          for (var i = 0; i > sym.exponent!; i--) {
            result.value = sym.prefix?.value == null
                ? result.value
                : result.value.divide(sym.prefix!.value);
          }
        }
      }
    }
    return result;
  }

  /// Expands a [DefinedUnit] into canonical form by parsing and normalising
  /// its definition string, applying its scaling value. Special units are
  /// resolved through [handlers]; affine (offset) units cannot be expressed
  /// multiplicatively and throw.
  Canonical expandDefinedUnit(String indent, DefinedUnit unit) {
    var u = unit.value.unit;
    var v = unit.value.value;

    if (unit.isSpecial ?? false) {
      if (!handlers.exists(unit.code)) {
        throw UcumException('Not handled yet (special unit)');
      } else {
        u = handlers.get(unit.code)?.getUnits();
        v = handlers.get(unit.code)?.getValue();
        if (handlers.get(unit.code)?.hasOffset() ?? false) {
          // An affine scale (Cel, [degF]) has no multiplicative canonical
          // form: folding the offset into the factor silently corrupts every
          // conversion (37 Cel became -10069.55 K). Ucum-java throws here for
          // the same reason; absolute conversions are handled separately in
          // UcumService.convert via SpecialUnitHandler.toRatio/fromRatio.
          throw UcumException(
              'Not handled yet (special unit with offset from 0 at '
              'intersect)',);
        }
      }
    }

    final t = u == null ? Term() : ExpressionParser(model).parse(u);
    debugTerm(indent, 'now handle', t);
    final result = normaliseTerm('$indent  ', t);
    if (v != null) {
      // Ensure unit conversion constants don't limit canonical precision
      // (similar to how prefix values have precision=24)
      final vAdj =
          v.precision < 24 ? UcumDecimal.fromString(v.asUcumDecimal(), 24) : v;
      result.value = result.value.multiply(vAdj);
    }
    return result;
  }

  /// Trace hook for a [Term] at a pipeline [state]; a no-op unless the debug
  /// print is enabled. [indent] reflects recursion depth.
  void debugTerm(String indent, String state, Term unit) {
    // print(indent + state + ": " + ExpressionComposer().compose(unit));
  }

  /// Trace hook for a [Canonical] result at a pipeline [state]; a no-op unless
  /// the debug print is enabled. [indent] reflects recursion depth.
  void debugCanonical(String indent, String state, Canonical can) {
    // print(indent + state + ": "
    //     + ExpressionComposer().composeCanonical(can));
  }
}
