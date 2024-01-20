import '../ucum.dart';

class ValidatedQuantity extends Pair {
  ValidatedQuantity({required super.value, String? code})
      : super(code: code ?? '1');

  factory ValidatedQuantity.fromString(String string) {
    final matches = valueRegex.firstMatch(string);
    if (matches?.namedGroup('value') == null) {
      throw 'Quantity must have a number';
    }
    string = string.replaceAll(matches!.namedGroup('value')!, '').trim();
    return ValidatedQuantity(
        value: Decimal.fromString(matches.namedGroup('value')), code: string);
  }

  ValidatedQuantity copyWith({Decimal? value, String? code}) =>
      ValidatedQuantity(value: value ?? this.value, code: code ?? this.code);

  bool isValid() => UcumService().validate(code) == null;

  static RegExp valueRegex = RegExp(r"^(?<value>(\+|-)?\d+(\.\d+)?)\s*");

  @override
  operator ==(Object other) {
    if (other is ValidatedQuantity) {
      return UcumService().isEqual(this, other);
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
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
  int get hashCode => super.hashCode;

  ValidatedQuantity operator +(Object other) {
    if (other is Decimal) {
      copyWith(value: this.value.add(other));
    } else if (other is ValidatedQuantity) {
      copyWith(value: this.value.add(other.value));
    } else if (other is num || other is BigInt) {
      copyWith(value: this.value.add(Decimal.fromString(other.toString())));
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        copyWith(value: this.value.add(newQuantity.value));
      } else {
        throw UcumException('$this could not be mulitplied with $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$this could not be mulitplied with $other '
          '(reason: it is not an accepted type)');
    }
    throw UcumException('$this could not be mulitplied with $other '
        '(reason: there was an unknown error)');
  }

  ValidatedQuantity operator -(Object other) {
    if (other is Decimal) {
      copyWith(value: this.value.subtract(other));
    } else if (other is ValidatedQuantity) {
      copyWith(value: this.value.subtract(other.value));
    } else if (other is num || other is BigInt) {
      copyWith(
          value: this.value.subtract(Decimal.fromString(other.toString())));
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        copyWith(value: this.value.subtract(newQuantity.value));
      } else {
        throw UcumException('$this could not be mulitplied with $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$this could not be mulitplied with $other '
          '(reason: it is not an accepted type)');
    }
    throw UcumException('$this could not be mulitplied with $other '
        '(reason: there was an unknown error)');
  }

  ValidatedQuantity operator *(Object other) {
    if (other is Decimal) {
      copyWith(value: this.value.multiply(other));
    } else if (other is ValidatedQuantity) {
      copyWith(value: this.value.multiply(other.value));
    } else if (other is num || other is BigInt) {
      copyWith(
          value: this.value.multiply(Decimal.fromString(other.toString())));
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        copyWith(value: this.value.multiply(newQuantity.value));
      } else {
        throw UcumException('$this could not be mulitplied with $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$this could not be mulitplied with $other '
          '(reason: it is not an accepted type)');
    }
    throw UcumException('$this could not be mulitplied with $other '
        '(reason: there was an unknown error)');
  }

  ValidatedQuantity operator /(Object other) {
    if (other is Decimal) {
      copyWith(value: this.value.divide(other));
    } else if (other is ValidatedQuantity) {
      copyWith(value: this.value.divide(other.value));
    } else if (other is num || other is BigInt) {
      copyWith(value: this.value.divide(Decimal.fromString(other.toString())));
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        copyWith(value: this.value.divide(newQuantity.value));
      } else {
        throw UcumException('$this could not be divided with $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$this could not be divided with $other '
          '(reason: it is not an accepted type)');
    }
    throw UcumException('$this could not be divided with $other '
        '(reason: there was an unknown error)');
  }

  ValidatedQuantity operator %(Object other) {
    if (other is Decimal) {
      copyWith(value: this.value.modulo(other));
    } else if (other is ValidatedQuantity) {
      copyWith(value: this.value.modulo(other.value));
    } else if (other is num || other is BigInt) {
      copyWith(value: this.value.modulo(Decimal.fromString(other.toString())));
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        copyWith(value: this.value.modulo(newQuantity.value));
      } else {
        throw UcumException('$this could not be moduloed with $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$this could not be moduloed with $other '
          '(reason: it is not an accepted type)');
    }
    throw UcumException('$this could not be moduloed with $other '
        '(reason: there was an unknown error)');
  }

  bool equivalent(Object other) {
    return this == other;
  }

  @override
  String toString() => _timeQuantitiesUnits.contains(code)
      ? '${value.toString()} $code'
      : "${value.toString()} '$code'";

// http://hl7.org/fhirpath/#time-valued-quantities
  static const _timeQuantitiesUnits = {
    'milliseconds',
    'millisecond',
    'seconds',
    'second',
    'minutes',
    'minute',
    'hours',
    'hour',
    'days',
    'day',
    'weeks',
    'week',
    'months',
    'month',
    'years',
    'year',
  };
}

bool isValidatedQuantity(Object other) {
  if (other is ValidatedQuantity) {
    return other.isValid();
  } else if (other is Decimal) {
    return ValidatedQuantity(value: other).isValid();
  } else if (other is num || other is BigInt) {
    return ValidatedQuantity.fromString(other.toString()).isValid();
  } else if (other is String) {
    return ValidatedQuantity.fromString(other).isValid();
  } else {
    return false;
  }
}
