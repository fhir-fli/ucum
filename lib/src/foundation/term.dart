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

/// A node in the recursive parse tree produced by the expression parser.
///
/// A [Term] chains a single component ([comp], a [Symbol] or [Factor]) to the
/// rest of the expression ([term]) via an [op] ([Operator.multiplication] or
/// [Operator.division]); e.g. `mg/dL` becomes a `mg` term divided by a `dL`
/// term. The converter and composer walk this linked structure.
class Term extends Component {
  /// Creates an empty term with no component, operator, or successor set.
  Term();

  /// The component at this node: a [Symbol] (prefixed unit with exponent) or a
  /// [Factor] (plain integer), or null while the tree is being built.
  Component? comp;

  /// The operator joining this node's [comp] to the following [term], or null
  /// when there is no successor.
  Operator? op;

  /// The next node in the expression, or null if this is the final term.
  Term? term;

  /// Whether a [comp] has been assigned to this node.
  bool hasComp() {
    return comp != null;
  }

  /// Whether an [op] joining this node to a successor has been assigned.
  bool hasOp() {
    return op != null;
  }

  /// Whether a successor [term] has been assigned.
  bool hasTerm() {
    return term != null;
  }

  /// Sets the successor [term], clearing [op] when the successor is null so no
  /// dangling operator is left without an operand.
  void setTermCheckOp(Term? term) {
    this.term = term;
    if (term == null) {
      op = null;
    }
  }

  @override
  String toString() => 'Term(Component: $comp, Operator: $op, Term: $term)';
}
