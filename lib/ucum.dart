/// UCUM (Unified Code for Units of Measure) for Dart: unit validation,
/// canonicalization, conversion, and quantity arithmetic. A port of the
/// reference Ucum-java library.
///
/// Start with [UcumService] (validate/convert/canonicalize, plus the
/// explicit lenient [UcumService.resolveCommonUnit]) or with
/// [ValidatedQuantity], the lenient value+unit type used by the FHIRPath
/// and CQL engines.
///
/// The public surface is: the service facade, the quantity types and
/// decimal engine, the synonym-resolution layer, [Pair]/[UcumException],
/// the UCUM terminology model (reachable through [UcumModel], `search`,
/// `getDefinedForms`), and the generated essence data tables with their
/// version stamp. The lexer/parser/converter pipeline, the special-unit
/// handler registry, and the validator are implementation details and are
/// deliberately not exported.
library;

export 'src/fhir/common_unit_synonyms.dart';
export 'src/fhir/time_valued_quantities.dart';
export 'src/fhir/ucum_decimal.dart';
export 'src/fhir/ucum_service.dart';
export 'src/fhir/ucum_unit_codes.dart';
export 'src/fhir/validated_quantity.dart';
export 'src/fhir/validated_ratio.dart';
export 'src/foundation/base_unit.dart';
export 'src/foundation/concept_kind.dart';
export 'src/foundation/defined_unit.dart';
export 'src/foundation/pair.dart';
export 'src/foundation/prefix.dart';
export 'src/foundation/ucum_concept.dart';
export 'src/foundation/ucum_exception.dart';
export 'src/foundation/ucum_model.dart';
export 'src/foundation/ucum_unit.dart';
export 'src/foundation/value.dart';
export 'src/resources/resources.dart';
