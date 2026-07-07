import 'package:ucum/src/internal.dart';

/// A class for handling Celsius units.
class CelsiusHandler extends SpecialUnitHandler {
  @override
  String getCode() {
    return 'Cel';
  }

  @override
  String getUnits() {
    return 'K'; // Kelvin
  }

  @override
  UcumDecimal getValue() {
    return UcumDecimal.one();
  }

  @override
  UcumDecimal getOffset() {
    // Assuming a constructor that takes a string and precision
    return UcumDecimal.fromString('-273.15', 24);
  }

  @override
  bool hasOffset() {
    return true;
  }

  /// K = Cel + 273.15
  @override
  UcumDecimal toRatio(UcumDecimal value) =>
      SpecialUnitHandler.atWorkingPrecision(value)
          .add(UcumDecimal.fromString('273.15', 24));

  /// Cel = K - 273.15
  @override
  UcumDecimal fromRatio(UcumDecimal value) =>
      SpecialUnitHandler.atWorkingPrecision(value)
          .subtract(UcumDecimal.fromString('273.15', 24));
}
