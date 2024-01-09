import '../ucum.dart';

/// A class for handling Fahrenheit units.
class FahrenheitHandler extends SpecialUnitHandler {
  @override
  String getCode() {
    return '[degF]';
  }

  @override
  String getUnits() {
    return 'K'; // Kelvin
  }

  @override
  Decimal getValue() {
    try {
      return Decimal.fromInt(5).divide(Decimal.fromInt(9));
    } catch (e) {
      // won't happen, but in case of error, return null
      rethrow;
    }
  }

  @override
  Decimal getOffset() {
    // Assuming a constructor that takes a string and precision
    return Decimal.fromString('32', 24);
  }

  @override
  bool hasOffset() {
    return true;
  }
}
