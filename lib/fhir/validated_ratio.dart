import '../ucum.dart';

class ValidatedRatio {
  ValidatedQuantity numerator;
  ValidatedQuantity denominator;

  ValidatedRatio({required this.numerator, required this.denominator});

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

  bool equivalent(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ValidatedRatio &&
        other.numerator / other.denominator == numerator / denominator;
  }
}
