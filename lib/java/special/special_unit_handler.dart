import '../ucum.dart';

/// Abstract class for handling special units in UCUM.
abstract class SpecialUnitHandler {
  /// Used to connect this handler with the case sensitive unit.
  String getCode();

  /// The alternate units to convert to.
  String getUnits();

  /// Get the conversion value.
  Decimal getValue();

  /// Return true if the conversion offset value is not equal to 0.
  bool hasOffset();

  /// Get the conversion offset value.
  Decimal getOffset();
}
