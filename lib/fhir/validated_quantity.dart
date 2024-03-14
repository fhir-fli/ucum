import '../ucum.dart';

class ValidatedQuantity extends Pair {
  ValidatedQuantity({required super.value, String? unit})
      : super(unit: (unit?.isNotEmpty ?? false) ? unit! : '1');

  factory ValidatedQuantity.fromString(String string) {
    final matches = valueRegex.firstMatch(string);
    if (matches?.namedGroup('value') == null) {
      throw 'Quantity must have a number, but was passed $string';
    }
    string = string.replaceAll(matches!.namedGroup('value')!, '').trim();
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
      return {
        'value': numberValue,
        'code': unit,
      };
    } else {
      final BigInt? bigIntValue = BigInt.tryParse(value.asUcumDecimal());
      if (bigIntValue != null) {
        return {
          'value': bigIntValue,
          'code': unit,
        };
      }
    }
    return {
      'value': value,
      'code': unit,
    };
  }

  ValidatedQuantity abs() =>
      ValidatedQuantity(value: value.absolute(), unit: unit);

  bool isValid() =>
      num.tryParse(value.asUcumDecimal()) != null &&
      UcumService().validate(unit) == null;

  static RegExp valueRegex = RegExp(r"^(?<value>(\+|-)?\d+(\.\d+)?)\s*");

  @override
  operator ==(Object other) {
    if (other is ValidatedQuantity) {
      return UcumService().isEqual(this, other);
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        final shouldBeEqual = UcumService().isEqual(this, newQuantity);
        if (shouldBeEqual) {
          if (definiteDurationUnits.contains(unit) &&
              !definiteDurationUnits.contains(newQuantity.unit)) {
            return false;
          } else if (!definiteDurationUnits.contains(unit) &&
              definiteDurationUnits.contains(newQuantity.unit)) {
            return false;
          } else {
            return true;
          }
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else if (other is num || other is BigInt) {
      final newQuantity = ValidatedQuantity.fromString(other.toString());
      if (newQuantity.isValid()) {
        final shouldBeEqual = UcumService().isEqual(this, newQuantity);
        if (shouldBeEqual) {
          if (definiteDurationUnits.contains(unit) &&
              !definiteDurationUnits.contains(newQuantity.unit)) {
            return false;
          } else if (!definiteDurationUnits.contains(unit) &&
              definiteDurationUnits.contains(newQuantity.unit)) {
            return false;
          } else {
            return true;
          }
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool equivalent(Object other) {
    if (other is ValidatedQuantity) {
      return UcumService().isEqual(this, other);
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        return UcumService().isEqual(this, newQuantity);
      } else {
        return false;
      }
    } else if (other is num || other is BigInt) {
      final newQuantity = ValidatedQuantity.fromString(other.toString());
      if (newQuantity.isValid()) {
        return UcumService().isEqual(this, newQuantity);
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  int get hashCode => value.hashCode ^ unit.hashCode;

  ValidatedQuantity? operator +(Object other) {
    if (other is UcumDecimal) {
      return copyWith(value: this.value.add(other));
    } else if (other is ValidatedQuantity) {
      if (UcumService().isComparable(this.unit, other.unit)) {
        return copyWith(value: this.value.add(other.value));
      } else {
        return null;
      }
    } else if (other is num || other is BigInt) {
      return copyWith(
          value: this.value.add(UcumDecimal.fromString(other.toString())));
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        return copyWith(value: this.value.add(newQuantity.value));
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
      return copyWith(value: this.value.subtract(other));
    } else if (other is ValidatedQuantity) {
      if (UcumService().isComparable(this.unit, other.unit)) {
        return copyWith(value: this.value.subtract(other.value));
      } else {
        return null;
      }
    } else if (other is num || other is BigInt) {
      return copyWith(
          value: this.value.subtract(UcumDecimal.fromString(other.toString())));
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        return copyWith(value: this.value.subtract(newQuantity.value));
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
      final newQuantity = ValidatedQuantity.fromString(other);
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
      final newQuantity = ValidatedQuantity.fromString(other);
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
      final validatedQuantity = ValidatedQuantity.fromPair(
          UcumService().divideBy(this, ValidatedQuantity(value: other)));
      return validatedQuantity.copyWith(value: validatedQuantity.value.trunc());
    } else if (other is ValidatedQuantity) {
      final validatedQuantity =
          ValidatedQuantity.fromPair(UcumService().divideBy(this, other));
      return validatedQuantity.copyWith(value: validatedQuantity.value.trunc());
    } else if (other is num || other is BigInt) {
      final validatedQuantity = ValidatedQuantity.fromPair(UcumService()
          .divideBy(
              this,
              ValidatedQuantity(
                  value: UcumDecimal.fromString(other.toString()))));
      return validatedQuantity.copyWith(value: validatedQuantity.value.trunc());
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        final validatedQuantity = ValidatedQuantity.fromPair(
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
      return copyWith(value: this.value.modulo(other));
    } else if (other is ValidatedQuantity) {
      return copyWith(value: this.value.modulo(other.value));
    } else if (other is num || other is BigInt) {
      return copyWith(
          value: this.value.modulo(UcumDecimal.fromString(other.toString())));
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        return copyWith(value: this.value.modulo(newQuantity.value));
      } else {
        throw UcumException('$this could not be moduloed with $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$this could not be moduloed with $other '
          '(reason: it is not an accepted type)');
    }
  }

  bool operator >(Object other) {
    if (other is UcumDecimal) {
      return this.value.comparesTo(other) > 0;
    } else if (other is ValidatedQuantity) {
      final UcumDecimal compareValue =
          UcumService().convert(other.value, other.unit, unit);
      return this.value.comparesTo(compareValue) > 0;
    } else if (other is num || other is BigInt) {
      return this.value.comparesTo(UcumDecimal.fromString(other.toString())) >
          0;
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        return this.value.comparesTo(newQuantity.value) > 0;
      } else {
        throw UcumException('> could not be performed on $this and $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('> could not be performed on $this and $other '
          '(reason: it is not an accepted type)');
    }
  }

  bool operator <(Object other) {
    if (other is UcumDecimal) {
      return this.value.comparesTo(other) < 0;
    } else if (other is ValidatedQuantity) {
      final UcumDecimal compareValue =
          UcumService().convert(other.value, other.unit, unit);
      return this.value.comparesTo(compareValue) < 0;
    } else if (other is num || other is BigInt) {
      return this.value.comparesTo(UcumDecimal.fromString(other.toString())) <
          0;
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        return this.value.comparesTo(newQuantity.value) < 0;
      } else {
        throw UcumException('> could not be performed on $this and $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('> could not be performed on $this and $other '
          '(reason: it is not an accepted type)');
    }
  }

  bool operator >=(Object other) {
    if (other is UcumDecimal) {
      return this == other || this.value.comparesTo(other) > 0;
    } else if (other is ValidatedQuantity) {
      final UcumDecimal compareValue =
          UcumService().convert(other.value, other.unit, unit);
      return this == other || this.value.comparesTo(compareValue) > 0;
    } else if (other is num || other is BigInt) {
      return this.value.comparesTo(UcumDecimal.fromString(other.toString())) >
          0;
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        return this == newQuantity ||
            this.value.comparesTo(newQuantity.value) > 0;
      } else {
        throw UcumException('> could not be performed on $this and $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('> could not be performed on $this and $other '
          '(reason: it is not an accepted type)');
    }
  }

  bool operator <=(Object other) {
    if (other is UcumDecimal) {
      return this == other || this.value.comparesTo(other) < 0;
    } else if (other is ValidatedQuantity) {
      final UcumDecimal compareValue =
          UcumService().convert(other.value, other.unit, unit);
      return this == other || this.value.comparesTo(compareValue) < 0;
    } else if (other is num || other is BigInt) {
      return this.value.comparesTo(UcumDecimal.fromString(other.toString())) <
          0;
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        return this == newQuantity ||
            this.value.comparesTo(newQuantity.value) < 0;
      } else {
        throw UcumException('> could not be performed on $this and $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('> could not be performed on $this and $other '
          '(reason: it is not an accepted type)');
    }
  }

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
  String toString() => isTimeQuantity
      ? '${value.toString()} $unit'
      : "${value.toString()} '$unit'";

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
      final value = UcumService().convert(this.value, this.unit, newCode);
      return ValidatedQuantity(value: value, unit: newCode);
    } else {
      throw UcumException('Cannot convert $this to $newCode');
    }
  }
}
