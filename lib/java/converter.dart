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
    // Implementation of convert method
    // Removed try-catch block as Dart does not support checked exceptions
    return normalise("  ", term);
  }

  Canonical normalise(String indent, Term term) {
    // Implementation of normalise method
    // Similar changes as in convert method
    // Dart's exception handling will be used if necessary
  }

  Canonical convert(Term term) {
    // Implementation of convert method
    return normalise("  ", term);
  }

  Canonical normalise(String indent, Term term) {
    Canonical result = Canonical(Decimal("1.000000000000000000000000000000"));
    // ... Rest of the normalise method implementation for Term
  }

  Canonical normaliseSymbol(String indent, Symbol sym) {
    Canonical result = Canonical(Decimal("1.000000000000000000000000000000"));

    // Implementation of normalise for Symbol
    // Adjustments for Dart syntax and exception handling
  }

  Canonical expandDefinedUnit(String indent, DefinedUnit unit) {
    String u = unit.value.unit;
    Decimal v = unit.value.value;

    if (unit.isSpecial) {
      if (!handlers.exists(unit.code)) {
        throw UcumException("Not handled yet (special unit)");
      } else {
        u = handlers.get(unit.code).units;
        v = handlers.get(unit.code).value;
        if (handlers.get(unit.code).hasOffset) {
          // Handling for special case with offset
          throw UcumException(
              "Not handled yet (special unit with offset from 0 at intersect)");
        }
      }
    }

    Term t = ExpressionParser(model).parse(u);
    debug(indent, "now handle", t);
    Canonical result = normalise(indent + "  ", t);
    result.multiplyValue(v);
    return result;
  }

  void debug(String indent, String state, Term unit) {
    print(indent + state + ": " + ExpressionComposer().compose(unit));
  }

  void debug(String indent, String state, Canonical can) {
    print(indent + state + ": " + ExpressionComposer().compose(can));
  }
}
