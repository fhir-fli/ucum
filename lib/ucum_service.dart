import 'ucum.dart';

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

abstract class UcumService {
  UcumModel getModel();

  UcumVersionDetails ucumIdentification();

  List<String> validateUCUM();

  List<UcumConcept> search(ConceptKind kind, String text, bool isRegex);

  Set<String> getProperties();

  /**
	 * validate whether a unit code are valid UCUM units
	 *  
	 * @param unit - the unit code to check
	 * @return nil if valid, or an error message describing the problem
	 */

  String? validate(String unit);

  String analyse(String unit);

  String validateInProperty(String unit, String property);

  String validateCanonicalUnits(String unit, String canonical);

  String getCanonicalUnits(String unit);

  bool isComparable(String units1, String units2);

  List<DefinedUnit> getDefinedForms(String code);

  Pair getCanonicalForm(Pair value);

  Decimal convert(Decimal value, String sourceUnit, String destUnit);

  Pair multiply(Pair o1, Pair o2);

  Pair divideBy(Pair dividend, Pair divisor);

  String getCommonDisplay(String code);
}

class UcumVersionDetails {
  DateTime? releaseDate;
  String? version;

  UcumVersionDetails(this.releaseDate, this.version);
}
