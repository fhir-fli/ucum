import '../ucum.dart';

/// A class for handling Fahrenheit units.
class FahrenheitHandler extends SpecialUnitHandler {
  @override
  String getCode() => '[degF]';

  @override
  String getUnits() => 'K'; // Kelvin

  @override
  UcumDecimal getValue() {
    try {
      return UcumDecimal.fromInt(5).divide(UcumDecimal.fromInt(9));
    } catch (e) {
      // won't happen, but in case of error, return null
      rethrow;
    }
  }

  @override
  // Assuming a constructor that takes a string and precision
  UcumDecimal getOffset() => UcumDecimal.fromString('32', 24);

  @override
  bool hasOffset() => true;
}
