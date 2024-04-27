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
library;

import 'canonical.dart';
import 'component.dart';
import 'factor.dart';
import 'operator.dart';
import 'symbol.dart';
import 'term.dart';

class ExpressionComposer {
  String compose(Term? term) {
    if (term == null) return '1';
    final StringBuffer buffer = StringBuffer();
    composeTerm(buffer, term);
    return buffer.toString();
  }

  void composeTerm(StringBuffer buffer, Term term) {
    if (term.comp != null) {
      composeComp(buffer, term.comp!);
    }
    if (term.op != null) {
      composeOp(buffer, term.op!);
    }
    if (term.term != null) {
      composeTerm(buffer, term.term!);
    }
  }

  void composeComp(StringBuffer buffer, Component comp) {
    if (comp is Factor) {
      composeFactor(buffer, comp);
    } else if (comp is Symbol) {
      composeSymbol(buffer, comp);
    } else if (comp is Term) {
      buffer.write('(');
      composeTerm(buffer, comp);
      buffer.write(')');
    } else {
      buffer.write('?');
    }
  }

  void composeSymbol(StringBuffer buffer, Symbol symbol) {
    if (symbol.prefix != null) {
      buffer.write(symbol.prefix!.code);
    }
    buffer.write(symbol.unit?.code);
    if (symbol.exponent != 1) {
      buffer.write(symbol.exponent);
    }
  }

  void composeFactor(StringBuffer buffer, Factor comp) {
    buffer.write(comp.value);
  }

  void composeOp(StringBuffer buffer, Operator op) {
    buffer.write(op == Operator.division ? '/' : '.');
  }

  String composeCanonical(Canonical can, [bool value = true]) {
    final StringBuffer buffer = StringBuffer();
    if (value) {
      buffer.write(can.value.asUcumDecimal());
    }
    bool first = true;
    for (final CanonicalUnit c in can.units) {
      if (!first) buffer.write('.');
      first = false;
      buffer.write(c.base.code);
      if (c.exponent != 1) {
        buffer.write(c.exponent);
      }
    }
    return buffer.toString();
  }
}
