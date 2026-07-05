import '../internal.dart';

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

  /// K = ([degF] + 459.67) * 5/9
  @override
  UcumDecimal toRatio(UcumDecimal value) =>
      SpecialUnitHandler.atWorkingPrecision(value)
          .add(UcumDecimal.fromString('459.67', 24))
          .multiplyInt(5)
          .divideInt(9);

  /// [degF] = K * 9/5 - 459.67
  @override
  UcumDecimal fromRatio(UcumDecimal value) =>
      SpecialUnitHandler.atWorkingPrecision(value)
          .multiplyInt(9)
          .divideInt(5)
          .subtract(UcumDecimal.fromString('459.67', 24));
}
