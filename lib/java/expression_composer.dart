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

import 'canonical.dart';
import 'term.dart';
import 'component.dart';
import 'factor.dart';
import 'symbol.dart';
import 'operator.dart';

class ExpressionComposer {
  String compose(Term? term) {
    if (term == null) return '1';
    var buffer = StringBuffer();
    composeTerm(buffer, term);
    return buffer.toString();
  }

  void composeTerm(StringBuffer buffer, Term term) {
    if (term.getComp() != null) {
      composeComp(buffer, term.getComp()!);
    }
    if (term.getOp() != null) {
      composeOp(buffer, term.getOp()!);
    }
    if (term.getTerm() != null) {
      composeTerm(buffer, term.getTerm()!);
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
    if (symbol.getPrefix() != null) {
      buffer.write(symbol.getPrefix()!.code);
    }
    buffer.write(symbol.unit?.code);
    if (symbol.getExponent() != 1) {
      buffer.write(symbol.getExponent());
    }
  }

  void composeFactor(StringBuffer buffer, Factor comp) {
    buffer.write(comp.value);
  }

  void composeOp(StringBuffer buffer, Operator op) {
    buffer.write(op == Operator.division ? '/' : '.');
  }

  String composeCanonical(Canonical can, [bool value = true]) {
    var buffer = StringBuffer();
    if (value) {
      buffer.write(can.value.asDecimal());
    }
    bool first = true;
    for (var c in can.units) {
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
