import '../ucum.dart';

/// A class for handling special units.
///
/// This is a placeholder implementation. If you want to actually use one of these
/// units, then you'll have to figure out how to implement them.
class HoldingHandler extends SpecialUnitHandler {
  String _code;
  String _units;
  Decimal _value;

  /// Constructor for the handler with a specified code and unit.
  HoldingHandler(String code, String units)
      : _code = code,
        _units = units,
        _value = Decimal.one();

  /// Constructor with a specified value.
  HoldingHandler.withValue(String code, String units, Decimal value)
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
  Decimal getValue() {
    return _value;
  }

  @override
  Decimal getOffset() {
    return Decimal.fromString('0', 24); // Assuming Decimal.fromString exists
  }

  @override
  bool hasOffset() {
    return false;
  }
}
