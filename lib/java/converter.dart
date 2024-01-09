import 'ucum.dart';

/// BSD 3-Clause License
/// Copyright (c) 2006+, Health Intersections Pty Ltd
/// All rights reserved.
///
/// Redistribution and use in source and binary forms, with or without
/// modification, are permitted provided that the following conditions are met:
///
/// * Redistributions of source code must retain the above copyright notice, this
///   list of conditions and the following disclaimer.
///
/// * Redistributions in binary form must reproduce the above copyright notice,
///   this list of conditions and the following disclaimer in the documentation
///   and/or other materials provided with the distribution.
///
/// * Neither the name of the copyright holder nor the names of its
///   contributors may be used to endorse or promote products derived from
///   this software without specific prior written permission.
///
/// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
/// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
/// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
/// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
/// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
/// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
/// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
/// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
/// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
/// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

class Converter {
  UcumModel model;
  Registry handlers;

  Converter(this.model, this.handlers);

  Canonical convert(Term term) {
    return normalise("  ", term);
  }

  Canonical normalise(String indent, Term term) {
    Canonical result =
        Canonical(Decimal.fromString("1.000000000000000000000000000000"));

    debugTerm(indent, "canonicalise", term);
    bool div = false;
    Term? t = term;
    while (t != null) {
      if (t.comp is Term) {
        Canonical temp = normalise(indent + "  ", t.comp as Term);
        if (div) {
          result.value = result.value.divide(temp.value);
          for (var c in temp.units) {
            c.exponent = -c.exponent;
          }
        } else {
          result.value = result.value.multiply(temp.value);
        }
        result.units.addAll(temp.units);
      } else if (t.comp is Factor) {
        if (div) {
          result.value = result.value.divideInt((t.comp as Factor).value);
        } else {
          result.value = result.value.multiplyInt((t.comp as Factor).value);
        }
      } else if (t.comp is Symbol) {
        Symbol o = t.comp as Symbol;
        Canonical temp = normaliseSymbol(indent, o);
        if (div) {
          result.value = result.value.divide(temp.value);
          for (var c in temp.units) {
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

    debugCanonical(indent, "collate", result);

    for (int i = result.units.length - 1; i >= 0; i--) {
      CanonicalUnit sf = result.units[i];
      for (int j = i - 1; j >= 0; j--) {
        CanonicalUnit st = result.units[j];
        if (st.base == sf.base) {
          st.exponent = sf.exponent + st.exponent;
          result.units.removeAt(i);
          break;
        }
      }
    }

    for (int i = result.units.length - 1; i >= 0; i--) {
      if (result.units[i].exponent == 0) {
        result.units.removeAt(i);
      }
    }

    debugCanonical(indent, "sort", result);
    result.units.sort((CanonicalUnit lhs, CanonicalUnit rhs) =>
        lhs.base.code.compareTo(rhs.base.code));
    debugCanonical(indent, "done", result);

    return result;
  }

  Canonical normaliseSymbol(String indent, Symbol sym) {
    Canonical result =
        Canonical(Decimal.fromString("1.000000000000000000000000000000"));

    if (sym.exponent != null) {
      if (sym.unit is BaseUnit) {
        result.units.add(CanonicalUnit(sym.unit as BaseUnit, sym.exponent!));
      } else {
        Canonical can = expandDefinedUnit(indent, sym.unit as DefinedUnit);
        for (var c in can.units) {
          c.exponent = c.exponent * sym.exponent!;
        }
        result.units.addAll(can.units);
        if (sym.exponent! > 0) {
          for (int i = 0; i < sym.exponent!; i++) {
            result.value = result.value.multiply(can.value);
          }
        } else {
          for (int i = 0; i > sym.exponent!; i--) {
            result.value = result.value.divide(can.value);
          }
        }
      }
      if (sym.prefix != null) {
        if (sym.exponent! > 0) {
          for (int i = 0; i < sym.exponent!; i++) {
            result.value = sym.prefix?.value == null
                ? result.value
                : result.value.multiply(sym.prefix!.value);
          }
        } else {
          for (int i = 0; i > sym.exponent!; i--) {
            result.value = sym.prefix?.value == null
                ? result.value
                : result.value.divide(sym.prefix!.value);
          }
        }
      }
    }
    return result;
  }

  Canonical expandDefinedUnit(String indent, DefinedUnit unit) {
    String? u = unit.value.unit;
    Decimal? v = unit.value.value;

    if (unit.isSpecial ?? false) {
      if (!handlers.exists(unit.code)) {
        throw UcumException("Not handled yet (special unit)");
      } else {
        u = handlers.get(unit.code)?.getUnits();
        v = handlers.get(unit.code)?.getValue();
        if (handlers.get(unit.code)?.hasOffset() ?? false) {
          // Handling for special case with offset
          throw UcumException(
              "Not handled yet (special unit with offset from 0 at intersect)");
        }
      }
    }

    Term t = u == null ? Term() : ExpressionParser(model).parse(u);
    debugTerm(indent, "now handle", t);
    Canonical result = normalise(indent + "  ", t);
    if (v != null) {
      result.value = result.value.multiply(v);
    }
    return result;
  }

  void debugTerm(String indent, String state, Term unit) {
    print(indent + state + ": " + ExpressionComposer().compose(unit));
  }

  void debugCanonical(String indent, String state, Canonical can) {
    print(indent + state + ": " + ExpressionComposer().composeCanonical(can));
  }
}
