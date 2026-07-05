import '../ucum.dart';

/// Abstract class for handling special units in UCUM.
abstract class SpecialUnitHandler {
  /// Used to connect this handler with the case sensitive unit.
  String getCode();

  /// The alternate units to convert to.
  String getUnits();

  /// Get the conversion value.
  UcumDecimal getValue();

  /// Return true if the conversion offset value is not equal to 0.
  bool hasOffset();

  /// Get the conversion offset value.
  UcumDecimal getOffset();

  /// Converts [value], expressed on this special unit's own scale, to the
  /// equivalent value in the ratio-scale units returned by [getUnits].
  ///
  /// The default is the linear mapping used by ratio-scale special units.
  /// Affine (offset) units such as `Cel` and `[degF]` MUST override both
  /// this and [fromRatio] — a multiplicative factor cannot express them,
  /// which is also why they cannot participate in canonical forms.
  UcumDecimal toRatio(UcumDecimal value) => value.multiply(getValue());

  /// Inverse of [toRatio]: converts [value] from the ratio-scale units
  /// returned by [getUnits] to this special unit's own scale.
  UcumDecimal fromRatio(UcumDecimal value) => value.divide(getValue());

  /// Returns [value] carried at working precision 24, so multi-step affine
  /// chains don't round intermediates to the input's significant figures
  /// (Converter applies the same rule to canonical conversion factors).
  static UcumDecimal atWorkingPrecision(UcumDecimal value) =>
      value.precision < 24
          ? UcumDecimal.fromString(value.asUcumDecimal(), 24)
          : value;
}
