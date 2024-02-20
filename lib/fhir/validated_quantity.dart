import '../ucum.dart';

class ValidatedQuantity extends Pair {
  ValidatedQuantity({required super.value, String? code})
      : super(code: (code?.isNotEmpty ?? false) ? code! : '1');

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
        code: string.isEmpty ? '1' : string);
  }

  factory ValidatedQuantity.fromNumber(num number, {String? code}) =>
      ValidatedQuantity(
          value: UcumDecimal.fromString(number.toString()), code: code);

  factory ValidatedQuantity.fromBigInt(BigInt number, {String? code}) =>
      ValidatedQuantity(value: UcumDecimal.fromBigInt(number), code: code);

  ValidatedQuantity.fromPair(Pair pair)
      : super(value: pair.value, code: pair.code.isNotEmpty ? pair.code : '1');

  ValidatedQuantity copyWith({UcumDecimal? value, String? code}) =>
      ValidatedQuantity(value: value ?? this.value, code: code ?? this.code);

  ValidatedQuantity abs() =>
      ValidatedQuantity(value: value.absolute(), code: code);

  bool isValid() =>
      num.tryParse(value.asUcumDecimal()) != null &&
      UcumService().validate(code) == null;

  static RegExp valueRegex = RegExp(r"^(?<value>(\+|-)?\d+(\.\d+)?)\s*");

  @override
  operator ==(Object other) {
    if (other is ValidatedQuantity) {
      final shouldBeEqual = UcumService().isEqual(this, other);
      if (shouldBeEqual) {
        if (definiteDurationUnits.contains(code) &&
            !definiteDurationUnits.contains(other.code)) {
          return false;
        } else if (!definiteDurationUnits.contains(code) &&
            definiteDurationUnits.contains(other.code)) {
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        final shouldBeEqual = UcumService().isEqual(this, newQuantity);
        if (shouldBeEqual) {
          if (definiteDurationUnits.contains(code) &&
              !definiteDurationUnits.contains(newQuantity.code)) {
            return false;
          } else if (!definiteDurationUnits.contains(code) &&
              definiteDurationUnits.contains(newQuantity.code)) {
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
          if (definiteDurationUnits.contains(code) &&
              !definiteDurationUnits.contains(newQuantity.code)) {
            return false;
          } else if (!definiteDurationUnits.contains(code) &&
              definiteDurationUnits.contains(newQuantity.code)) {
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
  int get hashCode => value.hashCode ^ code.hashCode;

  ValidatedQuantity? operator +(Object other) {
    if (other is UcumDecimal) {
      return copyWith(value: this.value.add(other));
    } else if (other is ValidatedQuantity) {
      if (UcumService().isComparable(this.code, other.code)) {
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
      if (UcumService().isComparable(this.code, other.code)) {
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
          UcumService().convert(other.value, other.code, code);
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
          UcumService().convert(other.value, other.code, code);
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
          UcumService().convert(other.value, other.code, code);
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
          UcumService().convert(other.value, other.code, code);
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

  bool get isTimeQuantity => timeValuedQuantities.contains(code);

  bool get isDefiniteDuration => definiteDurationUnits.contains(code);

  num? get years =>
      isDuration && isYears(code) ? num.parse(value.asUcumDecimal()) : null;

  num? get months =>
      isDuration && isMonths(code) ? num.parse(value.asUcumDecimal()) : null;

  num? get days =>
      isDuration && isDays(code) ? num.parse(value.asUcumDecimal()) : null;

  num? get hours =>
      isDuration && isHours(code) ? num.parse(value.asUcumDecimal()) : null;

  num? get minutes =>
      isDuration && isMinutes(code) ? num.parse(value.asUcumDecimal()) : null;

  num? get seconds =>
      isDuration && isSeconds(code) ? num.parse(value.asUcumDecimal()) : null;

  num? get milliseconds => isDuration && isMilliseconds(code)
      ? num.parse(value.asUcumDecimal())
      : null;

  @override
  String toString() => isTimeQuantity
      ? '${value.toString()} $code'
      : "${value.toString()} '$code'";

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
              code: other['code']?.toString())
          .isValid();
    } else {
      return false;
    }
  }

  ValidatedQuantity convertTo(String newCode) {
    if (UcumService().isComparable(code, newCode)) {
      final value = UcumService().convert(this.value, this.code, newCode);
      return ValidatedQuantity(value: value, code: newCode);
    } else {
      throw UcumException('Cannot convert $this to $newCode');
    }
  }
}
