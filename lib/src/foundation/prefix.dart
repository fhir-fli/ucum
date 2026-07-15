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

/// An SI multiplier prefix (`k`, `m`, `u`, …) applied to a metric unit,
/// spanning 10^-24 to 10^24. One of the three [UcumConcept] kinds.
class Prefix extends UcumConcept {
  // 1^-24 through to 1^24
  /// Creates a prefix with its scaling [value] and optional display [name].
  Prefix({
    required super.code,
    required super.codeUC,
    required this.value,
    String? name,
    super.printSymbol,
  }) : super(
          kind: ConceptKind.prefix,
          names: name == null ? null : <String>[name],
        );

  /// The scaling factor this prefix represents (e.g. 1000 for kilo).
  UcumDecimal value;

  @override
  String getDescription() {
    return '${super.getDescription()} = $value';
  }

  /// Serializes this prefix to its JSON definition form.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'CODE': codeUC,
        'value': value.toString(),
        'name': names.isEmpty ? null : names.first,
        'printSymbol': printSymbol,
      };
}
