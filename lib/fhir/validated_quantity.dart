// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes
// ignore_for_file: unrelated_type_equality_checks

import '../ucum.dart';

class ValidatedQuantity extends Pair implements Comparable<ValidatedQuantity> {
  ValidatedQuantity({required super.value, String? unit})
      : super(unit: (unit?.isNotEmpty ?? false) ? unit! : '1');

  factory ValidatedQuantity.fromString(String string) {
    final RegExpMatch? matches = valueRegex.firstMatch(string);
    if (matches?.namedGroup('value') == null) {
      throw Exception('Quantity must have a number, but was passed $string');
    }
    // Cut at the match boundary — replaceAll would also delete digits that
    // happen to appear inside the unit (e.g. the '2' of 'm2' for '2 m2').
    string = string.substring(matches!.end).trim();
    if (string.startsWith("'")) {
      string = string.substring(1);
    }
    if (string.endsWith("'")) {
      string = string.substring(0, string.length - 1);
    }
    return ValidatedQuantity(
        value: UcumDecimal.fromString(matches.namedGroup('value')),
        unit: string.isEmpty ? '1' : string);
  }

  factory ValidatedQuantity.fromNumber(num number, {String? unit}) =>
      ValidatedQuantity(
          value: UcumDecimal.fromString(number.toString()), unit: unit);

  factory ValidatedQuantity.fromBigInt(BigInt number, {String? unit}) =>
      ValidatedQuantity(value: UcumDecimal.fromBigInt(number), unit: unit);

  ValidatedQuantity.fromPair(Pair pair)
      : super(value: pair.value, unit: pair.unit.isNotEmpty ? pair.unit : '1');

  ValidatedQuantity copyWith({UcumDecimal? value, String? unit}) =>
      ValidatedQuantity(value: value ?? this.value, unit: unit ?? this.unit);

  Map<String, dynamic> toJson() {
    final num? numberValue = num.tryParse(value.asUcumDecimal());
    if (numberValue != null) {
      return <String, dynamic>{
        'value': numberValue,
        'code': unit,
      };
    } else {
      final BigInt? bigIntValue = BigInt.tryParse(value.asUcumDecimal());
      if (bigIntValue != null) {
        return <String, dynamic>{
          'value': bigIntValue,
          'code': unit,
        };
      }
    }
    return <String, dynamic>{
      'value': value,
      'code': unit,
    };
  }

  ValidatedQuantity abs() =>
      ValidatedQuantity(value: value.absolute(), unit: unit);

  bool isValid() =>
      num.tryParse(value.asUcumDecimal()) != null &&
      UcumService().validate(unit) == null;

  static RegExp valueRegex = RegExp(r'^(?<value>(\+|-)?\d+(\.\d+)?)\s*');

  /// Coerces [other] into a quantity for comparison/equality: quantities
  /// pass through, numbers and [UcumDecimal]s become dimensionless
  /// quantities (unit `'1'`, matching CQL/FHIRPath integer→Quantity
  /// promotion), and strings are parsed (`'50 cm'`). Returns null when
  /// [other] is not an accepted type or fails unit validation.
  static ValidatedQuantity? _coerceOperand(Object other) {
    if (other is ValidatedQuantity) {
      return other;
    }
    if (other is UcumDecimal) {
      return ValidatedQuantity(value: other);
    }
    if (other is num || other is BigInt) {
      return ValidatedQuantity(
          value: UcumDecimal.fromString(other.toString()));
    }
    if (other is String) {
      final ValidatedQuantity parsed = ValidatedQuantity.fromString(other);
      return parsed.isValid() ? parsed : null;
    }
    return null;
  }

  @override
  bool operator ==(Object other) {
    if (other is ValidatedQuantity) {
      return UcumService().isEqual(this, other);
    }
    final ValidatedQuantity? that = _coerceOperand(other);
    if (that == null || !UcumService().isEqual(this, that)) {
      return false;
    }
    // FHIRPath: a definite duration ('a', 'mo'...) never equals a calendar
    // duration ('year', 'month'...) even when the values align.
    return definiteDurationUnits.contains(unit) ==
        definiteDurationUnits.contains(that.unit);
  }

  bool equivalent(Object other) {
    final ValidatedQuantity? that = _coerceOperand(other);
    return that != null && UcumService().isEqual(this, that);
  }

  /// Consistent with the unit-converting [operator ==]: equal quantities in
  /// different units (1 m, 100 cm) must produce identical hash codes, so we
  /// hash the canonical form. Falls back to the raw value/unit when no
  /// canonical form exists (e.g. an invalid unit).
  @override
  int get hashCode {
    try {
      final Pair canonical =
          UcumService().getCanonicalForm(Pair(value: value, unit: unit));
      return Object.hash(_normalizedNumber(canonical.value), canonical.unit);
    } on Exception {
      return Object.hash(_normalizedNumber(value), unit);
    }
  }

  /// Strips presentation-precision artifacts ('1.00' vs '1', '-0') so that
  /// numerically equal decimals hash identically.
  static String _normalizedNumber(UcumDecimal value) {
    String s = value.asUcumDecimal();
    if (s.contains('.')) {
      s = s.replaceAll(RegExp(r'0+$'), '');
      if (s.endsWith('.')) {
        s = s.substring(0, s.length - 1);
      }
    }
    return s == '-0' ? '0' : s;
  }

  ValidatedQuantity? operator +(Object other) {
    if (other is UcumDecimal) {
      return copyWith(value: value.add(other));
    } else if (other is ValidatedQuantity) {
      if (UcumService().isComparable(unit, other.unit)) {
        final UcumDecimal convertedValue =
            UcumService().convert(other.value, other.unit, unit);
        return copyWith(value: value.add(convertedValue));
      } else {
        return null;
      }
    } else if (other is num || other is BigInt) {
      return copyWith(
          value: value.add(UcumDecimal.fromString(other.toString())));
    } else if (other is String) {
      final ValidatedQuantity newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        if (UcumService().isComparable(unit, newQuantity.unit)) {
          final UcumDecimal convertedValue =
              UcumService().convert(newQuantity.value, newQuantity.unit, unit);
          return copyWith(value: value.add(convertedValue));
        } else {
          return null;
        }
      } else {
        throw UcumException('$this could not be added to $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$this could not be added to $other '
          '(reason: it is not an accepted type)');
    }
  }

  ValidatedQuantity? operator -(Object other) {
    if (other is UcumDecimal) {
      return copyWith(value: value.subtract(other));
    } else if (other is ValidatedQuantity) {
      if (UcumService().isComparable(unit, other.unit)) {
        final UcumDecimal convertedValue =
            UcumService().convert(other.value, other.unit, unit);
        return copyWith(value: value.subtract(convertedValue));
      } else {
        return null;
      }
    } else if (other is num || other is BigInt) {
      return copyWith(
          value: value.subtract(UcumDecimal.fromString(other.toString())));
    } else if (other is String) {
      final ValidatedQuantity newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        if (UcumService().isComparable(unit, newQuantity.unit)) {
          final UcumDecimal convertedValue =
              UcumService().convert(newQuantity.value, newQuantity.unit, unit);
          return copyWith(value: value.subtract(convertedValue));
        } else {
          return null;
        }
      } else {
        throw UcumException('$other could not be subtracted from $this '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$other could not be subtracted from $this '
          '(reason: it is not an accepted type)');
    }
  }

  ValidatedQuantity operator *(Object other) {
    if (other is UcumDecimal) {
      return ValidatedQuantity.fromPair(
          UcumService().multiply(this, ValidatedQuantity(value: other)));
    } else if (other is ValidatedQuantity) {
      return ValidatedQuantity.fromPair(UcumService().multiply(this, other));
    } else if (other is num || other is BigInt) {
      return ValidatedQuantity.fromPair(UcumService().multiply(this,
          ValidatedQuantity(value: UcumDecimal.fromString(other.toString()))));
    } else if (other is String) {
      final ValidatedQuantity newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        return ValidatedQuantity.fromPair(
            UcumService().multiply(this, newQuantity));
      } else {
        throw UcumException('$this could not be mulitplied with $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$this could not be mulitplied with $other '
          '(reason: it is not an accepted type)');
    }
  }

  ValidatedQuantity operator /(Object other) {
    if (other is UcumDecimal) {
      return ValidatedQuantity.fromPair(
          UcumService().divideBy(this, ValidatedQuantity(value: other)));
    } else if (other is ValidatedQuantity) {
      return ValidatedQuantity.fromPair(UcumService().divideBy(this, other));
    } else if (other is num || other is BigInt) {
      return ValidatedQuantity.fromPair(UcumService().divideBy(this,
          ValidatedQuantity(value: UcumDecimal.fromString(other.toString()))));
    } else if (other is String) {
      final ValidatedQuantity newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        return ValidatedQuantity.fromPair(
            UcumService().divideBy(this, newQuantity));
      } else {
        throw UcumException('$this could not be dvided by $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$this could not be divided by $other '
          '(reason: it is not an accepted type)');
    }
  }

  ValidatedQuantity operator ~/(Object other) {
    if (other is UcumDecimal) {
      final ValidatedQuantity validatedQuantity = ValidatedQuantity.fromPair(
          UcumService().divideBy(this, ValidatedQuantity(value: other)));
      return validatedQuantity.copyWith(value: validatedQuantity.value.trunc());
    } else if (other is ValidatedQuantity) {
      final ValidatedQuantity validatedQuantity =
          ValidatedQuantity.fromPair(UcumService().divideBy(this, other));
      return validatedQuantity.copyWith(value: validatedQuantity.value.trunc());
    } else if (other is num || other is BigInt) {
      final ValidatedQuantity validatedQuantity = ValidatedQuantity.fromPair(
          UcumService().divideBy(
              this,
              ValidatedQuantity(
                  value: UcumDecimal.fromString(other.toString()))));
      return validatedQuantity.copyWith(value: validatedQuantity.value.trunc());
    } else if (other is String) {
      final ValidatedQuantity newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        final ValidatedQuantity validatedQuantity = ValidatedQuantity.fromPair(
            UcumService().divideBy(this, newQuantity));
        return validatedQuantity.copyWith(
            value: validatedQuantity.value.trunc());
      } else {
        throw UcumException('$this could not be trunc divided by $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$this could not be trunc divided by $other '
          '(reason: it is not an accepted type)');
    }
  }

  ValidatedQuantity operator %(Object other) {
    if (other is UcumDecimal) {
      return copyWith(value: value.modulo(other));
    } else if (other is ValidatedQuantity) {
      if (UcumService().isComparable(unit, other.unit)) {
        final UcumDecimal convertedValue =
            UcumService().convert(other.value, other.unit, unit);
        return copyWith(value: value.modulo(convertedValue));
      } else {
        throw UcumException('$this could not be moduloed with $other '
            '(reason: units are not comparable)');
      }
    } else if (other is num || other is BigInt) {
      return copyWith(
          value: value.modulo(UcumDecimal.fromString(other.toString())));
    } else if (other is String) {
      final ValidatedQuantity newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        if (UcumService().isComparable(unit, newQuantity.unit)) {
          final UcumDecimal convertedValue =
              UcumService().convert(newQuantity.value, newQuantity.unit, unit);
          return copyWith(value: value.modulo(convertedValue));
        } else {
          throw UcumException('$this could not be moduloed with $other '
              '(reason: units are not comparable)');
        }
      } else {
        throw UcumException('$this could not be moduloed with $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$this could not be moduloed with $other '
          '(reason: it is not an accepted type)');
    }
  }

  /// Shared comparison for the ordering operators: coerces [other] (see
  /// [_coerceOperand]), converts it into this quantity's unit, and returns
  /// the [UcumDecimal.comparesTo] result. Throws [UcumException] when
  /// [other] is not an accepted type or the units are not comparable — the
  /// old per-operator bodies drifted apart (the String branches compared
  /// raw values without unit conversion; the num branches of >= and <=
  /// dropped the equality case).
  int _compareWith(String op, Object other) {
    final ValidatedQuantity? that = _coerceOperand(other);
    if (that == null) {
      throw UcumException('$op could not be performed on $this and $other '
          '(reason: it is not an accepted type)');
    }
    if (!UcumService().isComparable(unit, that.unit)) {
      throw UcumException('$op could not be performed on $this and $other '
          "(reason: units '$unit' and '${that.unit}' are not comparable)");
    }
    return value
        .comparesTo(UcumService().convert(that.value, that.unit, unit));
  }

  bool operator >(Object other) => _compareWith('>', other) > 0;

  bool operator <(Object other) => _compareWith('<', other) < 0;

  bool operator >=(Object other) => _compareWith('>=', other) >= 0;

  bool operator <=(Object other) => _compareWith('<=', other) <= 0;

  bool get isDuration => isTimeQuantity || isDefiniteDuration;

  bool get isTimeQuantity => timeValuedQuantities.contains(unit);

  bool get isDefiniteDuration => definiteDurationUnits.contains(unit);

  num? get years =>
      isDuration && isYears(unit) ? num.parse(value.asUcumDecimal()) : null;

  num? get months =>
      isDuration && isMonths(unit) ? num.parse(value.asUcumDecimal()) : null;

  num? get weeks =>
      isDuration && isWeeks(unit) ? num.parse(value.asUcumDecimal()) : null;

  num? get days =>
      isDuration && isDays(unit) ? num.parse(value.asUcumDecimal()) : null;

  num? get hours =>
      isDuration && isHours(unit) ? num.parse(value.asUcumDecimal()) : null;

  num? get minutes =>
      isDuration && isMinutes(unit) ? num.parse(value.asUcumDecimal()) : null;

  num? get seconds =>
      isDuration && isSeconds(unit) ? num.parse(value.asUcumDecimal()) : null;

  num? get milliseconds => isDuration && isMilliseconds(unit)
      ? num.parse(value.asUcumDecimal())
      : null;

  @override
  String toString() => isTimeQuantity ? '$value $unit' : "$value '$unit'";

  static bool isValidatedQuantity(Object other) {
    if (other is ValidatedQuantity) {
      return other.isValid();
    } else if (other is UcumDecimal) {
      return ValidatedQuantity(value: other).isValid();
    } else if (other is num || other is BigInt) {
      return ValidatedQuantity.fromString(other.toString()).isValid();
    } else if (other is String) {
      return ValidatedQuantity.fromString(other).isValid();
    } else if (other is Map<String, dynamic>) {
      return ValidatedQuantity(
              value: UcumDecimal.fromString(other['value']?.toString()),
              unit: other['code']?.toString() ?? other['value']?.toString())
          .isValid();
    } else {
      return false;
    }
  }

  ValidatedQuantity convertTo(String newCode) {
    if (UcumService().isComparable(unit, newCode)) {
      final UcumDecimal value =
          UcumService().convert(this.value, unit, newCode);
      return ValidatedQuantity(value: value, unit: newCode);
    } else {
      throw UcumException('Cannot convert $this to $newCode');
    }
  }

  @override
  int compareTo(ValidatedQuantity other) => _compareWith('compareTo', other);
}
