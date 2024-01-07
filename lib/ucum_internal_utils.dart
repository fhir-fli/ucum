import 'ucum_pkg.dart';

abstract class UcumUtils {
  static bool isNumericString(String? theString) =>
      theString != null && double.tryParse(theString) != null;

  static bool isIntegerUnit(String? str) =>
      str != null && RegExp(r'^\d+$').hasMatch(str);

  static ReturnObject getSynonyms(String? theSyn) {
    UnitTables utab = UnitTables.instance;
    ReturnObject resp = utab.getUnitBySynonym(theSyn);
    if (resp.units?.isEmpty ?? true) {
      return ReturnObject(
        status: ReturnStatus.failed,
        msg: ['No unit found for synonym $theSyn'],
        units: <UcumUnit>[],
      );
    } else {
      return resp.copyWith(status: ReturnStatus.succeeded);
    }
  }
}

class ReturnObject {
  final ReturnStatus status;
  final List<String>? msg;
  final List<String>? retMsg;
  final String? origString;
  final UcumUnit? unit;
  final String? ucumCode;
  final List<Suggestion>? suggestions;
  final List<UcumUnit>? units;

  const ReturnObject({
    required this.status,
    this.msg,
    this.retMsg,
    this.origString,
    this.unit,
    this.ucumCode,
    this.suggestions,
    this.units,
  });

  factory ReturnObject.empty() => ReturnObject(status: ReturnStatus.unknown);

  ReturnObject copyWith({
    ReturnStatus? status,
    List<String>? msg,
    List<String>? retMsg,
    String? origString,
    UcumUnit? unit,
    String? ucumCode,
    List<Suggestion>? suggestions,
    List<UcumUnit>? units,
  }) =>
      ReturnObject(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        retMsg: retMsg ?? this.retMsg,
        origString: origString ?? this.origString,
        unit: unit ?? this.unit,
        ucumCode: ucumCode ?? this.ucumCode,
        suggestions: suggestions ?? this.suggestions,
        units: units ?? this.units,
      );

  @override
  String toString() {
    return 'ReturnObject{status: $status, msg: $msg, retMsg: $retMsg, origString: $origString, unit: $unit, ucumCode: $ucumCode, suggestions: $suggestions, units: $units}';
  }
}

class ConvertObject extends ReturnObject {
  final Number? toVal;
  final UcumUnit? fromUnit;
  final UcumUnit? toUnit;

  const ConvertObject({
    required super.status,
    super.msg,
    super.retMsg,
    super.origString,
    super.unit,
    super.suggestions,
    super.units,
    super.ucumCode,
    this.toVal,
    this.fromUnit,
    this.toUnit,
  });

  factory ConvertObject.empty() => ConvertObject(status: ReturnStatus.unknown);

  ConvertObject copyWith({
    ReturnStatus? status,
    List<String>? msg,
    List<String>? retMsg,
    String? origString,
    UcumUnit? unit,
    List<Suggestion>? suggestions,
    List<UcumUnit>? units,
    String? ucumCode,
    Number? toVal,
    UcumUnit? fromUnit,
    UcumUnit? toUnit,
  }) =>
      ConvertObject(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        retMsg: retMsg ?? this.retMsg,
        origString: origString ?? this.origString,
        unit: unit ?? this.unit,
        suggestions: suggestions ?? this.suggestions,
        units: units ?? this.units,
        ucumCode: ucumCode ?? this.ucumCode,
        toVal: toVal ?? this.toVal,
        fromUnit: fromUnit ?? this.fromUnit,
        toUnit: toUnit ?? this.toUnit,
      );
}

enum ReturnStatus {
  valid,
  invalid,
  error,
  failed,
  succeeded,
  unknown,
}

class Suggestion {
  final List<String> msg;
  final String invalidUnit;
  final List<UcumUnit> units;

  const Suggestion({
    required this.msg,
    required this.invalidUnit,
    required this.units,
  });

  Suggestion copyWith({
    List<String>? msg,
    String? invalidUnit,
    List<UcumUnit>? units,
  }) =>
      Suggestion(
        msg: msg ?? this.msg,
        invalidUnit: invalidUnit ?? this.invalidUnit,
        units: units ?? this.units,
      );
}

class MakeUnit {
  final UcumUnit? unit;
  final String origString;
  MakeUnit(this.unit, this.origString);
}

class UnitEntry {
  final String? mag;
  final UcumUnit? unit;
  const UnitEntry(this.mag, this.unit);

  @override
  String toString() {
    return 'UnitEntry{mag: $mag, unit: $unit}';
  }
}

class AnnotatedText {
  String pStr;
  String? startText;
  String? endText;
  AnnotatedText(this.pStr, this.startText, this.endText);
}

class ParenProcessing {
  String? unitString;
  String origString;
  bool endProcessing;
  List<Uarray>? uArray;

  ParenProcessing({
    this.unitString,
    required this.origString,
    required this.endProcessing,
    this.uArray,
  });

  @override
  String toString() {
    String outputString = 'ParenProcssing: ';
    if (unitString != null) {
      outputString += '\nunitString: $unitString, ';
    }
    outputString += '\norigString: $origString, ';
    outputString += '\nendProcessing: $endProcessing, ';
    for (int i = 0; i < (uArray?.length ?? 0); i++) {
      outputString += '\nuArray[$i]: ${uArray![i].op}, ${uArray![i].un}, ';
    }
    return outputString;
  }
}

class ParensUnit {
  UcumUnit unit;
  bool endProcessing;
  ParensUnit(this.unit, this.endProcessing);
}

class Uarray {
  String? op;
  String? un;
  Uarray(this.op, this.un);
}

// * pStr: <String>
// * beforeAnnotation: <String>
// * afterAnnotation: <String>

// * retMsg_: <String>[]
// * annotations_: <String>[]

// *  <UcumUnit>[]
// *  origString

// *  'status': <ReturnStatus>
// *  'toVal': <num>
// *  'msg': <String>[]
// *  'suggestions':
//     * from: [['msg', 'invalidUnit','units']]
//     * to: [['msg', 'invalidUnit','units']]
// *  'fromUnit': <UcumUnic>
// *  'toUnit': <UcumUnit>

// *  'status': <ReturnStatus>
// *  'msg': <String>[]
// *  'magnitude': magnitude?
// *  'fromUnitIsSpecial': <bool>
// *  'unitToExp': <UcumUnit, exponent>{}

// *  'status': <ReturnStatus>
// *   'unit': UcumUnit
// *   'origString': String
// *   'retMsg': <String>[]
// *   'suggestions': <Suggestion>[]

// * 'unit': UcumUnit
// *  'inString': <String>
// *   'suggestions': <Suggestion>[]

// * [UcumUnit, string]
// * retMsg_: <String>[]
// * parensUnits_: <UcumUnit>[]
// * the this.annotations_ array is referenced by methods called within
// *   this one
// *   'suggestions': <Suggestion>[]

// *  [preString, afterString]
// *  bool

// * [unitString, originString, bool]
// * retMsg_: <String>[]

// * [UcumUnit, bool]
// * retMsg_: <String>[]
// * parensUnits_: <UcumUnit>[]
