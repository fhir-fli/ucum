// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'package:ucum/src/internal.dart';

/// A ratio of two [ValidatedQuantity]s (e.g. a dose rate like `5 mg/2 h`),
/// the FHIR `Ratio` counterpart in the UCUM pipeline. Equality is exact on
/// value and unit; [equivalent] compares by dividing the two ratios.
class ValidatedRatio {
  /// Creates a ratio from its [numerator] and [denominator] quantities.
  const ValidatedRatio({required this.numerator, required this.denominator});

  /// The quantity above the division bar.
  final ValidatedQuantity numerator;

  /// The quantity below the division bar.
  final ValidatedQuantity denominator;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ValidatedRatio &&
        other.numerator.value == numerator.value &&
        other.denominator.value == denominator.value &&
        other.numerator.unit == numerator.unit &&
        other.denominator.unit == denominator.unit;
  }

  @override
  int get hashCode => numerator.hashCode ^ denominator.hashCode;

  /// Whether [other] is a ratio with an equal value after reduction:
  /// unlike [operator ==] this divides numerator by denominator on both
  /// sides, so `2 mg/1 mL` is equivalent to `4 mg/2 mL`.
  bool equivalent(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ValidatedRatio &&
        other.numerator / other.denominator == numerator / denominator;
  }
}
