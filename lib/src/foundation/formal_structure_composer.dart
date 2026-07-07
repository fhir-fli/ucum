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

/// Renders a parsed [Term] tree into an expanded, human-readable form that
/// spells out unit names and operators (e.g. `(milli gram) / (deci liter)`),
/// unlike the compact codes produced by [ExpressionComposer].
class FormalStructureComposer {
  /// Composes [term] into its formal, spelled-out string representation.
  String compose(Term term) {
    final buffer = StringBuffer();
    composeTerm(buffer, term);
    return buffer.toString();
  }

  /// Writes [term]'s component, operator and continuation into [buffer].
  void composeTerm(StringBuffer buffer, Term term) {
    if (term.comp != null) {
      composeComp(buffer, term.comp!);
    }
    if (term.op != null) {
      composeOp(buffer, term.op!);
    }
    if (term.term != null) {
      // buffer.write('(');
      composeTerm(buffer, term.term!);
      // buffer.write(')');
    }
  }

  /// Writes a component [comp] into [buffer].
  void composeComp(StringBuffer buffer, Component comp) {
    if (comp is Factor) {
      composeFactor(buffer, comp);
    } else if (comp is Symbol) {
      composeSymbol(buffer, comp);
    } else if (comp is Term) {
      composeTerm(buffer, comp);
    } else {
      buffer.write('?');
    }
  }

  /// Writes a [symbol] into [buffer] in parenthesised, name-spelled form:
  /// prefix name, unit name, and `^ exponent` when the exponent is not 1.
  void composeSymbol(StringBuffer buffer, Symbol symbol) {
    buffer.write('(');
    if (symbol.prefix != null) {
      buffer.write(symbol.prefix?.names.first);
    }
    buffer.write(symbol.unit?.names.first);
    if (symbol.exponent != 1) {
      buffer
        ..write(' ^ ')
        ..write(symbol.exponent);
    }
    buffer.write(')');
  }

  /// Writes the integer factor [comp] into [buffer].
  void composeFactor(StringBuffer buffer, Factor comp) {
    buffer.write(comp.value);
  }

  /// Writes [op] into [buffer] as ` / ` for division or ` * ` for
  /// multiplication.
  void composeOp(StringBuffer buffer, Operator op) {
    if (op == Operator.division) {
      buffer.write(' / ');
    } else {
      buffer.write(' * ');
    }
  }
}
