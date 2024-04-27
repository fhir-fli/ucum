import '../ucum.dart';

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
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

class DefinedUnit extends UcumUnit {
  bool? isSpecial;
  String? class_;
  Value value;

  DefinedUnit({
    required super.code,
    required super.codeUC,
    required super.property,
    required super.isMetric,
    required this.isSpecial,
    this.class_,
    required this.value,
    super.names,
    super.printSymbol,
  }) : super(kind: ConceptKind.unit);

  @override
  String getDescription() {
    return '${super.getDescription()} = ${value.getDescription()}';
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'CODE': codeUC,
        'value': value.toJson(),
        'property': property,
        'isMetric': isMetric,
        'isSpecial': isSpecial,
        'class': class_,
        'names': names,
        'printSymbol': printSymbol,
      };

  factory DefinedUnit.fromJson(Map<String, dynamic> json) {
    return DefinedUnit(
      code: json['code'] as String,
      codeUC: json['CODE'] as String?,
      property: json['property'] as String,
      isMetric: json['isMetric'] as bool?,
      isSpecial: json['isSpecial'] as bool?,
      value: json['value'] == null
          ? Value()
          : Value.fromJson(json['value']! as Map<String, dynamic>),
      class_: json['class'] as String,
      names: json['name'] is List<dynamic>
          ? (json['name'] as List<dynamic>)
              .map((dynamic e) => e.toString())
              .toList()
          : null,
      printSymbol: json['printSymbol'] as String?,
    );
  }
}
