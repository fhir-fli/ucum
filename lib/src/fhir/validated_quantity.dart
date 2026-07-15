// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'package:ucum/src/internal.dart';

/// A value + unit measurement, the FHIR-facing quantity type of the UCUM
/// pipeline. Extends [Pair] with unit validation, lenient common-unit
/// resolution, cross-unit arithmetic and comparison, and FHIRPath/CQL
/// calendar-vs-definite duration semantics. An empty unit is normalized to
/// the dimensionless UCUM unit `'1'`.
class ValidatedQuantity extends Pair implements Comparable<ValidatedQuantity> {
  /// Creates a quantity from a decimal [value] and optional [unit]; an
  /// empty/absent unit becomes the dimensionless `'1'`.
  ValidatedQuantity({required super.value, String? unit})
      : super(unit: (unit?.isNotEmpty ?? false) ? unit! : '1');

  /// Parses a `"<number> <unit>"` string (e.g. `'50 cm'`, `"5 'mg'"`) into a
  /// quantity. The leading number is required; the remaining unit text is
  /// trimmed and unquoted, defaulting to the dimensionless unit `'1'` when
  /// absent. Throws when no leading number is present.
  factory ValidatedQuantity.fromString(String string) {
    var s = string;
    final matches = valueRegex.firstMatch(s);
    if (matches?.namedGroup('value') == null) {
      throw Exception('Quantity must have a number, but was passed $string');
    }
    // Cut at the match boundary — replaceAll would also delete digits that
    // happen to appear inside the unit (e.g. the '2' of 'm2' for '2 m2').
    s = s.substring(matches!.end).trim();
    if (s.startsWith("'")) {
      s = s.substring(1);
    }
    if (s.endsWith("'")) {
      s = s.substring(0, s.length - 1);
    }
    return ValidatedQuantity(
      value: UcumDecimal.fromString(matches.namedGroup('value')),
      unit: s.isEmpty ? '1' : s,
    );
  }

  /// Creates a quantity from a [num] [number] and optional [unit].
  factory ValidatedQuantity.fromNumber(num number, {String? unit}) =>
      ValidatedQuantity(
        value: UcumDecimal.fromString(number.toString()),
        unit: unit,
      );

  /// Creates a quantity from a [BigInt] [number] and optional [unit].
  factory ValidatedQuantity.fromBigInt(BigInt number, {String? unit}) =>
      ValidatedQuantity(value: UcumDecimal.fromBigInt(number), unit: unit);

  /// Promotes a plain value+unit [Pair] into a [ValidatedQuantity],
  /// normalizing an empty unit to the dimensionless `'1'`.
  ValidatedQuantity.fromPair(Pair pair)
      : super(value: pair.value, unit: pair.unit.isNotEmpty ? pair.unit : '1');

  /// Returns a copy with [value] and/or [unit] replaced, keeping the
  /// existing field where an argument is null.
  ValidatedQuantity copyWith({UcumDecimal? value, String? unit}) =>
      ValidatedQuantity(value: value ?? this.value, unit: unit ?? this.unit);

  /// Serializes to a FHIR `Quantity`-shaped map with `value` (a `num` or
  /// `BigInt` when the decimal fits one, otherwise the raw [UcumDecimal]) and
  /// `code` (the unit).
  Map<String, dynamic> toJson() {
    final numberValue = num.tryParse(value.asUcumDecimal());
    if (numberValue != null) {
      return <String, dynamic>{
        'value': numberValue,
        'code': unit,
      };
    } else {
      final bigIntValue = BigInt.tryParse(value.asUcumDecimal());
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

  /// Returns a copy with the absolute (non-negative) value, same unit.
  ValidatedQuantity abs() =>
      ValidatedQuantity(value: value.absolute(), unit: unit);

  /// The strict UCUM form of [unit]: [unit] itself when already valid UCUM,
  /// otherwise its resolution through [UcumService.resolveCommonUnit]
  /// ('mcg' -> 'ug', 'hours' -> 'h', 'inch' -> '[in_i]'). Null when the
  /// unit cannot be resolved to valid UCUM. [unit] always keeps the
  /// original spelling — FHIRPath's calendar-vs-definite duration
  /// semantics and display both depend on it.
  String? get ucumUnit => UcumService().resolveCommonUnit(unit);

  /// Whether the value parses as a number and the unit resolves to valid
  /// UCUM (via [ucumUnit]).
  bool isValid() =>
      num.tryParse(value.asUcumDecimal()) != null && ucumUnit != null;

  /// A copy whose unit is strict UCUM, for handing to the strict
  /// [UcumService] String-based APIs. Throws when the unit is unresolvable.
  ValidatedQuantity _strictCopy(String op) {
    final resolved = ucumUnit;
    if (resolved == null) {
      throw UcumException('$op could not be performed on $this '
          "(reason: unit '$unit' is not valid UCUM and has no known "
          'resolution)');
    }
    return resolved == unit ? this : copyWith(unit: resolved);
  }

  /// Converts [that]'s value into this quantity's (resolved) unit, or null
  /// when either unit is unresolvable or the two are not comparable.
  UcumDecimal? _convertedValueOf(ValidatedQuantity that) {
    final u1 = ucumUnit;
    final u2 = that.ucumUnit;
    if (u1 == null || u2 == null || !UcumService().isComparable(u1, u2)) {
      return null;
    }
    return UcumService().convert(that.value, u2, u1);
  }

  /// Matches the leading signed decimal number (named group `value`) and any
  /// trailing whitespace of a quantity string, leaving the unit as the
  /// remainder. Used by [ValidatedQuantity.fromString].
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
      return ValidatedQuantity(value: UcumDecimal.fromString(other.toString()));
    }
    if (other is String) {
      final parsed = ValidatedQuantity.fromString(other);
      return parsed.isValid() ? parsed : null;
    }
    return null;
  }

  @override
  bool operator ==(Object other) {
    if (other is ValidatedQuantity) {
      return UcumService().isEqual(this, other);
    }
    final that = _coerceOperand(other);
    if (that == null || !UcumService().isEqual(this, that)) {
      return false;
    }
    // FHIRPath: a definite duration ('a', 'mo'...) never equals a calendar
    // duration ('year', 'month'...) even when the values align.
    return definiteDurationUnits.contains(unit) ==
        definiteDurationUnits.contains(that.unit);
  }

  /// Like [operator ==] but ignores the calendar-vs-definite duration
  /// distinction: purely a unit-converting numeric equality after coercing
  /// [other] (returns false when [other] cannot be coerced).
  bool equivalent(Object other) {
    final that = _coerceOperand(other);
    return that != null && UcumService().isEqual(this, that);
  }

  /// Consistent with the unit-converting [operator ==]: equal quantities in
  /// different units (1 m, 100 cm) must produce identical hash codes, so we
  /// hash the canonical form. Falls back to the raw value/unit when no
  /// canonical form exists (e.g. an invalid unit).
  @override
  int get hashCode {
    try {
      final canonical = UcumService()
          .getCanonicalForm(Pair(value: value, unit: ucumUnit ?? unit));
      return Object.hash(_normalizedNumber(canonical.value), canonical.unit);
    } on Exception {
      return Object.hash(_normalizedNumber(value), unit);
    }
  }

  /// Strips presentation-precision artifacts ('1.00' vs '1', '-0') so that
  /// numerically equal decimals hash identically.
  static String _normalizedNumber(UcumDecimal value) {
    var s = value.asUcumDecimal();
    if (s.contains('.')) {
      s = s.replaceAll(RegExp(r'0+$'), '');
      if (s.endsWith('.')) {
        s = s.substring(0, s.length - 1);
      }
    }
    return s == '-0' ? '0' : s;
  }

  /// Adds [other] (a quantity, number, [UcumDecimal], or quantity string)
  /// after converting it into this unit. Returns null when the units are not
  /// comparable; throws [UcumException] for unaccepted types.
  ValidatedQuantity? operator +(Object other) {
    if (other is UcumDecimal) {
      return copyWith(value: value.add(other));
    } else if (other is ValidatedQuantity) {
      final convertedValue = _convertedValueOf(other);
      return convertedValue == null
          ? null
          : copyWith(value: value.add(convertedValue));
    } else if (other is num || other is BigInt) {
      return copyWith(
        value: value.add(UcumDecimal.fromString(other.toString())),
      );
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        final convertedValue = _convertedValueOf(newQuantity);
        return convertedValue == null
            ? null
            : copyWith(value: value.add(convertedValue));
      } else {
        throw UcumException('$this could not be added to $other '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$this could not be added to $other '
          '(reason: it is not an accepted type)');
    }
  }

  /// Subtracts [other] (a quantity, number, [UcumDecimal], or quantity
  /// string) after converting it into this unit. Returns null when the units
  /// are not comparable; throws [UcumException] for unaccepted types.
  ValidatedQuantity? operator -(Object other) {
    if (other is UcumDecimal) {
      return copyWith(value: value.subtract(other));
    } else if (other is ValidatedQuantity) {
      final convertedValue = _convertedValueOf(other);
      return convertedValue == null
          ? null
          : copyWith(value: value.subtract(convertedValue));
    } else if (other is num || other is BigInt) {
      return copyWith(
        value: value.subtract(UcumDecimal.fromString(other.toString())),
      );
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        final convertedValue = _convertedValueOf(newQuantity);
        return convertedValue == null
            ? null
            : copyWith(value: value.subtract(convertedValue));
      } else {
        throw UcumException('$other could not be subtracted from $this '
            '(reason: it is not an accepted type)');
      }
    } else {
      throw UcumException('$other could not be subtracted from $this '
          '(reason: it is not an accepted type)');
    }
  }

  /// Multiplies this quantity by [other], producing a quantity in the
  /// combined (canonicalized) unit. Throws [UcumException] for unaccepted
  /// types or unresolvable units.
  ValidatedQuantity operator *(Object other) {
    final that = _coerceOperand(other);
    if (that == null) {
      throw UcumException('$this could not be multiplied with $other '
          '(reason: it is not an accepted type)');
    }
    return ValidatedQuantity.fromPair(
      UcumService().multiply(_strictCopy('*'), that._strictCopy('*')),
    );
  }

  /// Divides this quantity by [other], producing a quantity in the combined
  /// (canonicalized) unit. Throws [UcumException] for unaccepted types or
  /// unresolvable units.
  ValidatedQuantity operator /(Object other) {
    final that = _coerceOperand(other);
    if (that == null) {
      throw UcumException('$this could not be divided by $other '
          '(reason: it is not an accepted type)');
    }
    return ValidatedQuantity.fromPair(
      UcumService().divideBy(_strictCopy('/'), that._strictCopy('/')),
    );
  }

  /// Truncating division: divides by [other] and truncates the result value
  /// toward zero. Throws [UcumException] for unaccepted types or unresolvable
  /// units.
  ValidatedQuantity operator ~/(Object other) {
    final that = _coerceOperand(other);
    if (that == null) {
      throw UcumException('$this could not be trunc divided by $other '
          '(reason: it is not an accepted type)');
    }
    final divided = ValidatedQuantity.fromPair(
      UcumService().divideBy(_strictCopy('~/'), that._strictCopy('~/')),
    );
    return divided.copyWith(value: divided.value.trunc());
  }

  /// Modulo: the remainder after dividing this quantity's value by [other]'s
  /// value (converted into this unit). Throws [UcumException] when the units
  /// are not comparable or [other] is an unaccepted type.
  ValidatedQuantity operator %(Object other) {
    if (other is UcumDecimal) {
      return copyWith(value: value.modulo(other));
    } else if (other is ValidatedQuantity) {
      final convertedValue = _convertedValueOf(other);
      if (convertedValue == null) {
        throw UcumException('$this could not be moduloed with $other '
            '(reason: units are not comparable)');
      }
      return copyWith(value: value.modulo(convertedValue));
    } else if (other is num || other is BigInt) {
      return copyWith(
        value: value.modulo(UcumDecimal.fromString(other.toString())),
      );
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        final convertedValue = _convertedValueOf(newQuantity);
        if (convertedValue == null) {
          throw UcumException('$this could not be moduloed with $other '
              '(reason: units are not comparable)');
        }
        return copyWith(value: value.modulo(convertedValue));
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
    final that = _coerceOperand(other);
    if (that == null) {
      throw UcumException('$op could not be performed on $this and $other '
          '(reason: it is not an accepted type)');
    }
    final converted = _convertedValueOf(that);
    if (converted == null) {
      throw UcumException('$op could not be performed on $this and $other '
          "(reason: units '$unit' and '${that.unit}' are not comparable)");
    }
    return value.comparesTo(converted);
  }

  /// Whether this quantity is greater than [other] after unit conversion.
  bool operator >(Object other) => _compareWith('>', other) > 0;

  /// Whether this quantity is less than [other] after unit conversion.
  bool operator <(Object other) => _compareWith('<', other) < 0;

  /// Whether this quantity is greater than or equal to [other] after unit
  /// conversion.
  bool operator >=(Object other) => _compareWith('>=', other) >= 0;

  /// Whether this quantity is less than or equal to [other] after unit
  /// conversion.
  bool operator <=(Object other) => _compareWith('<=', other) <= 0;

  /// Whether the unit is any duration — a calendar time word or a definite
  /// UCUM duration code.
  bool get isDuration => isTimeQuantity || isDefiniteDuration;

  /// Whether the unit is a FHIRPath calendar time word ('days', 'months'...).
  bool get isTimeQuantity => timeValuedQuantities.contains(unit);

  /// Whether the unit is a definite-duration UCUM code ('d', 'mo'...).
  bool get isDefiniteDuration => definiteDurationUnits.contains(unit);

  /// The value as a number when this is a year duration, else null.
  num? get years =>
      isDuration && isYears(unit) ? num.parse(value.asUcumDecimal()) : null;

  /// The value as a number when this is a month duration, else null.
  num? get months =>
      isDuration && isMonths(unit) ? num.parse(value.asUcumDecimal()) : null;

  /// The value as a number when this is a week duration, else null.
  num? get weeks =>
      isDuration && isWeeks(unit) ? num.parse(value.asUcumDecimal()) : null;

  /// The value as a number when this is a day duration, else null.
  num? get days =>
      isDuration && isDays(unit) ? num.parse(value.asUcumDecimal()) : null;

  /// The value as a number when this is an hour duration, else null.
  num? get hours =>
      isDuration && isHours(unit) ? num.parse(value.asUcumDecimal()) : null;

  /// The value as a number when this is a minute duration, else null.
  num? get minutes =>
      isDuration && isMinutes(unit) ? num.parse(value.asUcumDecimal()) : null;

  /// The value as a number when this is a second duration, else null.
  num? get seconds =>
      isDuration && isSeconds(unit) ? num.parse(value.asUcumDecimal()) : null;

  /// The value as a number when this is a millisecond duration, else null.
  num? get milliseconds => isDuration && isMilliseconds(unit)
      ? num.parse(value.asUcumDecimal())
      : null;

  @override
  String toString() => isTimeQuantity ? '$value $unit' : "$value '$unit'";

  /// Whether [other] can be interpreted as a valid quantity — accepts a
  /// [ValidatedQuantity], [UcumDecimal], number, quantity string, or a
  /// FHIR `Quantity`-shaped map — validating value and unit.
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
        unit: other['code']?.toString() ?? other['value']?.toString(),
      ).isValid();
    } else {
      return false;
    }
  }

  /// Converts this quantity into [newCode], returning a new quantity whose
  /// unit is [newCode] (keeping its original spelling). Throws [UcumException]
  /// when either unit is unresolvable or the two are not comparable.
  ValidatedQuantity convertTo(String newCode) {
    final u1 = ucumUnit;
    final u2 = UcumService().resolveCommonUnit(newCode);
    if (u1 == null || u2 == null || !UcumService().isComparable(u1, u2)) {
      throw UcumException('Cannot convert $this to $newCode');
    }
    return ValidatedQuantity(
      value: UcumService().convert(value, u1, u2),
      unit: newCode,
    );
  }

  @override
  int compareTo(ValidatedQuantity other) => _compareWith('compareTo', other);
}
