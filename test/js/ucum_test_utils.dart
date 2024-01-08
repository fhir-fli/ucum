import 'package:test/test.dart';
import 'package:ucum/ucum_pkg.dart';

class UcumTestUtils {
  // Constructor in Dart can be empty if it doesn't do anything.
  UcumTestUtils();

  List<String> checkAllDimensions() {
    /// Basic initializations for singletons for:
    ///  UcumJsonDefs, UnitString, and UnitTables
    UcumJsonDefs.instance.loadUcumDefs();
    UnitString uString = UnitString.instance;
    List<UcumUnit> allUnits = UnitTables.instance.allUnitsByDef();
    expect(allUnits.length, equals(772));

    List<String> problems = <String>[];
    ReturnObject? parseResp;
    UcumUnit? parsedUnit;

    for (final UcumUnit curUnit in allUnits) {
      bool skipped = false;
      String whoCalled = '';
      String whoReturned = '';
      if (!curUnit.isBase_) {
        if (curUnit.source_ == 'UCUM') {
          /// Performing checks for non-base units from the UCUM list
          if (curUnit.csUnitString_ != null &&
              curUnit.csUnitString_ != '1' &&
              !curUnit.isArbitrary_ &&
              curUnit.class_ != 'dimless' &&
              curUnit.csCode_ != 'mol' &&
              curUnit.csCode_ != '[car_Au]') {
            whoCalled =
                'parseString called on UCUM unit ${curUnit.csCode_} for string = ${curUnit.csUnitString_}';
            if (curUnit.csUnitString_ != null) {
              parseResp =
                  uString.parseString(curUnit.csUnitString_!, null, null);
              print('parseResp = $parseResp');
              whoReturned = 'parseString returned ';
              if ((parseResp.units?.isNotEmpty ?? false)) {
                whoReturned =
                    'parseString returned ${parseResp.units!.first.csCode_} for string = ${parseResp.units!.first.csUnitString_}';

                parsedUnit = parseResp.units!.first;
              } else {
                whoReturned = 'parseString returned no found units';
              }
              if (parsedUnit != null && curUnit.baseFactorStr_ != null) {
                Number newMag = parsedUnit.magnitude_ * curUnit.baseFactor_!;
                parsedUnit.magnitude_ = newMag;
              }
            }
          } else {
            skipped = true;
          }
        } else {
          // Handling LOINC units
          if (curUnit.csUnitString_ != null &&
              curUnit.csUnitString_ != '1' &&
              !curUnit.isArbitrary_ &&
              curUnit.class_ != 'dimless') {
            whoCalled =
                'parseString called on LOINC unit ${curUnit.csCode_} for string = ${curUnit.csUnitString_}';
            parseResp = uString.parseString(curUnit.csCode_, null, null);
            if (parseResp.units?.isNotEmpty ?? false) {
              whoReturned =
                  'parseString returned ${parseResp.units!.first.csCode_} for string = ${parseResp.units!.first.csUnitString_}';
              parsedUnit = parseResp.units!.first;
            } else {
              whoReturned = 'parseString returned no found units';
            }
          } else {
            skipped = true;
          }
        }

        // Process the parsed unit
        if (!skipped) {
          if (parsedUnit == null) {
            problems.add(
                'Null return for attempt to parse string = ${curUnit.csUnitString_} for ${curUnit.csCode_}');
            // problems.addAll(parseResp[2]);
            problems.add('');
            // Perform dimension checks
            if (curUnit.dim_ == null && parsedUnit?.dim_ != null) {
              problems.add('dim_ null for json unit ${curUnit.csCode_} with '
                  'csUnitString = ${curUnit.csUnitString_} but is '
                  '${parsedUnit!.dim_?.dimVec_} for '
                  'parsed unit ${parsedUnit.csCode_}');
            } else if (curUnit.dim_ != null && parsedUnit?.dim_ == null) {
              problems.add(
                  'dim_ null for parsed unit ${parsedUnit?.csCode_} but is '
                  '${curUnit.dim_!.dimVec_} for json unit '
                  '${curUnit.csCode_} with csUnitString ${curUnit.csUnitString_}');
            } else if (curUnit.dim_ != null && parsedUnit?.dim_ != null) {
              if (!curUnit.dim_!.equals(parsedUnit!.dim_!)) {
                problems.add(whoCalled);
                problems.add(whoReturned);
                problems.add('Dimension mismatch; ${curUnit.source_} curUnit '
                    '${curUnit.csCode_} with csUnitString = '
                    '${curUnit.csUnitString_} has dim = '
                    '${curUnit.dim_!.dimVec_}');
                problems.add('                    ${parsedUnit.source_} '
                    'parsedUnit ${parsedUnit.csCode_} with csString = '
                    '${parsedUnit.csUnitString_} has dim = '
                    '${parsedUnit.dim_!.dimVec_}');
              }
            }
          }
        }
      } else {
        expect(['m', 's', 'g', 'rad', 'K', 'C', 'cd'].contains(curUnit.csCode_),
            equals(true));
      }
    }
    return problems;
  }

  // Dart uses a different type for lists.
  ReturnObject checkOneDimension(String uString) {
    UnitString uStr = UnitString.instance;
    ReturnObject generatedUnit = uStr.parseString(uString, null, null);
    return generatedUnit;
  }
}
