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

class Value {
  String? unit;
  String? unitUC;
  UcumDecimal? value;
  String? text;

  Value({this.unit, this.unitUC, this.value, this.text});

  String getDescription() {
    return '$value$unit';
  }

  @override
  String toString() =>
      'Value(unit: $unit, unitUC: $unitUC, value: $value, text: $text)';

  Map<String, dynamic> toJson() => <String, dynamic>{
        'unit': unit,
        'UNIT': unitUC,
        'value': value?.asUcumDecimal(),
        'text': text,
      };
  factory Value.fromJson(Map<String, dynamic> json) => Value(
        unit: json['unit'] as String?,
        unitUC: json['UNIT'] as String?,
        value: json['value'] == null
            ? null
            : UcumDecimal.fromString(json['value'].toString()),
        text: json['text'] as String?,
      );
}
