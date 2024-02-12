import '../ucum.dart';

/// A class for handling special units.
///
/// This is a placeholder implementation. If you want to actually use one of these
/// units, then you'll have to figure out how to implement them.
class HoldingHandler extends SpecialUnitHandler {
  String _code;
  String _units;
  UcumDecimal _value;

  /// Constructor for the handler with a specified code and unit.
  HoldingHandler(String code, String units)
      : _code = code,
        _units = units,
        _value = UcumDecimal.one();

  /// Constructor with a specified value.
  HoldingHandler.withValue(String code, String units, UcumDecimal value)
      : _code = code,
        _units = units,
        _value = value;

  @override
  String getCode() {
    return _code;
  }

  @override
  String getUnits() {
    return _units;
  }

  @override
  UcumDecimal getValue() {
    return _value;
  }

  @override
  UcumDecimal getOffset() {
    return UcumDecimal.fromString(
        '0', 24); // Assuming UcumDecimal.fromString exists
  }

  @override
  bool hasOffset() {
    return false;
  }
}
