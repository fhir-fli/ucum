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

/// Abstract base of the UCUM concept hierarchy: any named entry in the model,
/// namely a [Prefix], [BaseUnit], or [DefinedUnit].
///
/// Holds the identity common to all of them: the [kind], the case-sensitive
/// and case-insensitive codes, a print symbol, and human-readable names.
class UcumConcept {
  /// Creates a concept; [names] defaults to an empty, mutable list when null.
  UcumConcept({
    required this.kind,
    required this.code,
    this.codeUC,
    this.printSymbol,
    List<String>? names,
  }) : names = names ?? <String>[];

  /// Which kind of concept this is (prefix, base unit, or defined unit).
  ConceptKind kind;

  /// Case sensitive code for this concept.
  String code;

  /// Case insensitive code for this concept.
  String? codeUC;

  /// Print symbol for this code.
  String? printSymbol;

  /// Names for the concept.
  List<String> names;

  /// A short human-readable description combining the kind, code, and first
  /// name, e.g. `unit L ('liter')`. Subclasses extend this with their extra
  /// detail.
  String getDescription() {
    final firstName = names.isNotEmpty ? names.first : '';
    return "${kind.toString().toLowerCase()} $code ('$firstName')";
  }

  @override
  String toString() {
    return '$code = ${getDescription()}';
  }
}
