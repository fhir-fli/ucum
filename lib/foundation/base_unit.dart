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
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

library org.fhir.ucum;

import '../ucum.dart';

class BaseUnit extends UcumUnit {
  /// Abbreviation for property.
  String dim;

  /// Constructor for BaseUnit.
  BaseUnit({
    required super.code,
    required super.codeUC,
    required super.property,
    required this.dim,
    super.metric,
    String? name,
    List<String>? synonyms,
    super.printSymbol,
  }) : super(
            kind: ConceptKind.baseUnit,
            names: name != null || (synonyms != null && synonyms.isNotEmpty)
                ? [
                    if (name != null) name,
                    if (synonyms != null && synonyms.isNotEmpty) ...synonyms
                  ]
                : null);

  @override
  String toString() => 'BaseUnit(dim: $dim, ${super.toString()})';

  Map<String, dynamic> toJson() => {
        'code': code,
        'CODE': codeUC,
        'property': property,
        'dim': dim,
        'name': names.isEmpty ? null : names.first,
        'printSymbol': printSymbol,
      };
}
