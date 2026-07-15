// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'dart:math' as math;

import 'package:ucum/src/foundation/ucum_exception.dart';
import 'package:ucum/src/foundation/utilities.dart';

/// Arbitrary-precision decimal number used throughout the UCUM engine for
/// unit conversion and comparison.
///
/// Unlike [double], it preserves the number of significant figures and never
/// loses precision to binary rounding. A value is held as a string of
/// significant [digits], an integer [decimal] marking where the decimal point
/// sits within those digits, a [precision] (count of significant figures), a
/// [negative] sign flag, and a [scientific] flag recording whether the value
/// was parsed from scientific notation. Arithmetic (add/subtract/multiply/
/// divide) is implemented digit-by-digit so results stay exact to the tracked
/// precision.
class UcumDecimal {
  /// Creates the value zero with zero precision.
  UcumDecimal()
      : precision = 0,
        scientific = false,
        negative = false,
        digits = '',
        decimal = 0;

  /// Parses [value] into a decimal, accepting either plain (`12.34`) or
  /// scientific (`1.2e3`) notation; a `null` [value] yields the default zero.
  ///
  /// The parse is case-insensitive (the exponent marker may be `e` or `E`).
  /// When [precision] is supplied it overrides the significant-figure count
  /// inferred from the text.
  UcumDecimal.fromString(String? value, [int? precision]) {
    if (value != null) {
      final v = value.toLowerCase();
      if (v.contains('e')) {
        setValueScientific(v);
      } else {
        setValueUcumDecimal(v);
      }
    }
    if (precision != null) {
      this.precision = precision;
    }
  }

  /// Creates a decimal from a [num], taking its string form as the source
  /// value (and therefore its apparent precision).
  UcumDecimal.fromNum(num i) {
    setValueUcumDecimal(i.toString());
  }

  /// Creates a decimal from an [int]; the value is treated as a whole number.
  UcumDecimal.fromInt(int i) {
    setValueUcumDecimal(i.toString());
  }

  /// Creates a decimal from a [double] via its string representation.
  UcumDecimal.fromDouble(double d) {
    setValueUcumDecimal(d.toString());
  }

  /// Creates a decimal from an arbitrarily large [BigInt].
  UcumDecimal.fromBigInt(BigInt i) {
    setValueUcumDecimal(i.toString());
  }

  /// The constant zero.
  factory UcumDecimal.zero() => UcumDecimal.fromString('0');

  /// The constant one.
  factory UcumDecimal.one() => UcumDecimal.fromString('1');

  /// Number of significant figures carried by this value.
  late int precision;

  /// Whether the value originated from (and prefers rendering as) scientific
  /// notation.
  late bool scientific;

  /// Whether the value is negative.
  late bool negative;

  /// The significant digits with no decimal point or sign, e.g. `"1234"`.
  late String digits;

  /// Position of the decimal point measured from the left of [digits]; may be
  /// negative or exceed the digit count to represent leading/trailing zeros.
  late int decimal;
  static const int _int32MinValue = -2147483647;
  static const int _int32MaxValue = 2147483647;

  /// This value as a binary [double] (may lose precision).
  double get asDouble => double.parse(asUcumDecimal());

  /// Parses a plain (non-scientific) decimal string into this object's
  /// [digits]/[decimal]/[precision]/[negative] fields.
  ///
  /// Strips a leading sign and redundant leading zeros, locates the decimal
  /// point, infers the significant-figure count, and throws a [UcumException]
  /// if the text is not a valid decimal (e.g. a trailing `.`).
  void setValueUcumDecimal(String value) {
    var v = value;
    scientific = false;
    negative = v.startsWith('-');
    if (negative) {
      v = v.substring(1);
    }

    while (v.startsWith('0') && v.length > 1) {
      v = v.substring(1);
    }

    final dec = v.indexOf('.');
    if (dec == -1) {
      precision = v.length;
      decimal = v.length;
      digits = v;
    } else if (dec == v.length - 1) {
      throw UcumException("'$v' is not a valid decimal");
    } else {
      decimal = dec;
      if (allZeros(v, 1)) {
        precision = v.length - 1;
      } else {
        precision = countSignificants(v);
      }
      digits = delete(v, decimal, 1);
      if (allZeros(digits)) {
        precision = precision + 1;
      }
      while (digits.startsWith('0')) {
        digits = digits.substring(1);
        decimal--;
      }
    }
  }

  /// Returns whether every character of [s] from index [start] onward is `'0'`
  /// (a `null` string is treated as not all-zero).
  bool allZeros(String? s, [int start = 0]) {
    if (s == null) {
      return false;
    } else {
      for (var i = start; i < s.length; i++) {
        if (s[i] != '0') {
          return false;
        }
      }
      return true;
    }
  }

  /// The number of significant figures in this value: the tracked [precision]
  /// for plain decimals, or the counted significant digits when [scientific].
  int significantFigures() {
    if (scientific) {
      return countSignificants(digits);
    } else {
      return precision;
    }
  }

  /// Counts the significant digits in [value] by removing any decimal point
  /// and leading zeros and returning the remaining length.
  int countSignificants(String value) {
    var v = value;
    final i = v.indexOf('.');
    if (i > -1) {
      v = delete(v, i, 1);
    }
    while (v.isNotEmpty && v[0] == '0') {
      v = v.substring(1);
    }
    return v.length;
  }

  /// Returns [value] with [length] characters removed starting at [offset].
  String delete(String value, int offset, int length) {
    return value.substring(0, offset) + value.substring(offset + length);
  }

  /// Parses a scientific-notation string (mantissa `e` exponent) into this
  /// object, validating both parts and shifting [decimal] by the exponent.
  ///
  /// Throws a [UcumException] when either the mantissa or the exponent is
  /// missing or malformed.
  void setValueScientific(String value) {
    final i = value.indexOf('e');
    final s = value.substring(0, i);
    final e = value.substring(i + 1);

    if (Utilities.noString(s) ||
        s == '-' ||
        !Utilities.isDecimal(s) ||
        Utilities.noString(e) ||
        e == '-' ||
        !Utilities.isInteger(e)) {
      throw UcumException("'$value' is not a valid decimal");
    }

    setValueUcumDecimal(s);
    scientific = true;

    // Adjust for exponent
    final exp = int.parse(e);
    decimal = decimal + exp;
  }

  /// Returns [char] repeated [count] times (used to build runs of `'0'`).
  String stringMultiply(String char, int count) =>
      Utilities.padLeft('', char, count);

  /// Returns [value] with [ins] inserted at [offset].
  String insert(String ins, String value, int offset) => offset == 0
      ? ins + value
      : value.substring(0, offset) + ins + value.substring(offset);

  @override
  String toString() => asUcumDecimal();

  /// Returns an independent copy of this value.
  UcumDecimal copy() => UcumDecimal.fromString(asUcumDecimal());

  /// Whether this value equals zero (all digits are `'0'`).
  bool isZero() => allZeros(digits);

  /// Whether this value equals one.
  bool isOne() {
    final one = UcumDecimal.one();
    return comparesTo(one) == 0;
  }

  /// Whether [other] is a [UcumDecimal] with the same canonical string form.
  bool equals(Object other) {
    if (other is UcumDecimal) {
      return asUcumDecimal() == other.asUcumDecimal();
    }
    return false;
  }

  /// Whether [other] is a [UcumDecimal] whose numeric value is equal, comparing
  /// as parsed numbers rather than by string form.
  bool equalsValue(Object other) {
    if (other is UcumDecimal) {
      final thisValue = num.tryParse(asUcumDecimal());
      final otherValue = num.tryParse(other.asUcumDecimal());
      if (thisValue == null) {
        return false;
      } else {
        return thisValue == otherValue;
      }
    } else {
      return false;
    }
  }

  /// Compares this value with [other], returning -1, 0, or 1.
  ///
  /// Digit strings are aligned on the decimal point (zero-padded to equal
  /// length) and compared lexically; signs are honoured, and negative zero is
  /// treated as equal to zero. A `null` [other] compares as equal.
  int comparesTo(UcumDecimal? other) {
    if (other == null) {
      return 0;
    } else {
      // Negative zero must compare equal to zero: without this, the sign
      // short-circuit below reports -0 < 0. (Ucum-java has the same latent
      // flaw, but its subtraction paths can't produce -0 through any
      // reachable route; our affine temperature conversions can.)
      if (isZero() && other.isZero()) {
        return 0;
      }
      if (negative && !other.negative) {
        return -1;
      } else if (!negative && other.negative) {
        return 1;
      } else {
        final int maxUcumDecimal = math.max(decimal, other.decimal);
        var s1 = ('0' * (maxUcumDecimal - decimal + 1)) + digits;
        var s2 = ('0' * (maxUcumDecimal - other.decimal + 1)) + other.digits;
        if (s1.length < s2.length) {
          s1 = s1 + stringMultiply('0', s2.length - s1.length);
        } else if (s2.length < s1.length) {
          s2 = s2 + stringMultiply('0', s1.length - s2.length);
        }
        var result = s1.compareTo(s2);
        if (negative) {
          result = -result;
        }
        return result;
      }
    }
  }

  /// Whether this value has no fractional part.
  bool isWholeNumber() {
    return !asUcumDecimal().contains('.');
  }

  /// Renders this value as a plain decimal string, inserting the decimal point
  /// and any required leading/trailing zeros and sign.
  String asUcumDecimal() {
    var result = digits;
    if (decimal != digits.length) {
      if (decimal < 0) {
        result = '0.${'0' * (0 - decimal)}$digits';
      } else if (decimal < result.length) {
        if (decimal == 0) {
          result = '0.$result';
        } else {
          result =
              '${result.substring(0, decimal)}.${result.substring(decimal)}';
        }
      } else {
        result = result + '0' * (decimal - result.length);
      }
    }
    if (negative && result != '0') {
      result = '-$result';
    }
    return result;
  }

  /// Returns this value as an [int], throwing a [UcumException] if it is not a
  /// whole number or falls outside the signed 32-bit range.
  int asInteger() {
    if (!isWholeNumber()) {
      throw UcumException('Unable to represent $this as an integer');
    }
    if (comparesTo(UcumDecimal.fromString(_int32MinValue.toString())) < 0) {
      throw UcumException(
        'Unable to represent $this as a signed 32-bit integer',
      );
    }
    if (comparesTo(UcumDecimal.fromString(_int32MaxValue.toString())) > 0) {
      throw UcumException(
        'Unable to represent $this as a signed 32-bit integer',
      );
    }
    return int.parse(asUcumDecimal());
  }

  /// Renders this value in scientific notation (mantissa `e` exponent),
  /// preserving the tracked precision for zero values.
  String asScientific() {
    var result = digits;
    final zero = allZeros(result);
    if (zero) {
      result = precision < 2 ? '0e0' : "0.${'0' * (precision - 1)}e0";
    } else {
      if (digits.length > 1) {
        result = insert('.', result, 1);
      }
      result += 'e${decimal - 1}';
    }
    if (negative && !zero) {
      result = '-$result';
    }
    return result;
  }

  /// Returns this value truncated toward zero (fractional digits dropped).
  UcumDecimal trunc() {
    if (isZero() || decimal <= 0) {
      return UcumDecimal.zero();
    }

    final result = copy();

    if (result.digits.length >= result.decimal) {
      result.digits = result.digits.substring(0, result.decimal);
    }
    if (Utilities.noString(result.digits)) {
      result
        ..digits = '0'
        ..decimal = 1
        ..negative = false;
    }
    return result;
  }

  /// Returns the sum of this value and [other].
  ///
  /// Dispatches to [doAdd] for like signs and [doSubtract] for unlike signs,
  /// then normalizes any negative-zero result to positive zero.
  UcumDecimal add(UcumDecimal other) {
    if (negative == other.negative) {
      final result = doAdd(other)..negative = negative;
      return _normalizeZeroSign(result);
    } else if (negative) {
      return _normalizeZeroSign(other.doSubtract(this));
    } else {
      return _normalizeZeroSign(doSubtract(other));
    }
  }

  /// Returns the difference of this value minus [other], handling all sign
  /// combinations and normalizing negative zero to positive zero.
  UcumDecimal subtract(UcumDecimal other) {
    UcumDecimal result;
    if (negative && !other.negative) {
      result = doAdd(other)..negative = true;
    } else if (!negative && other.negative) {
      result = doAdd(other);
    } else if (negative && other.negative) {
      result = doSubtract(other);
      result.negative = !result.negative;
    } else {
      result = other.doSubtract(this);
      result.negative = !result.negative;
    }
    return _normalizeZeroSign(result);
  }

  /// A zero result must never carry a negative sign, or comparison and
  /// string output report -0.
  static UcumDecimal _normalizeZeroSign(UcumDecimal result) {
    if (result.negative && result.isZero()) {
      result.negative = false;
    }
    return result;
  }

  /// Adds the magnitudes of this value and [other] ignoring sign.
  ///
  /// Both digit strings are aligned to a common scale and summed right-to-left
  /// with carry propagation; callers ([add]/[subtract]) set the result sign.
  UcumDecimal doAdd(UcumDecimal other) {
    // Compute total number of decimal places for both numbers
    final thisScale = digits.length - decimal;
    final otherScale = other.digits.length - other.decimal;

    // Normalize numbers to have the same number of decimal places
    final normalizedThisDigits = digits + '0' * (otherScale - thisScale);
    final normalizedOtherDigits = other.digits + '0' * (thisScale - otherScale);

    // Prepare to sum the digits
    final int maxLength =
        math.max(normalizedThisDigits.length, normalizedOtherDigits.length);
    final paddedThisDigits = normalizedThisDigits.padLeft(maxLength, '0');
    final paddedOtherDigits = normalizedOtherDigits.padLeft(maxLength, '0');

    var resultDigits = '';
    var carry = 0;
    // Perform addition from right to left
    for (var i = maxLength - 1; i >= 0; i--) {
      final sum = int.parse(paddedThisDigits[i]) +
          int.parse(paddedOtherDigits[i]) +
          carry;
      carry = sum ~/ 10;
      resultDigits = (sum % 10).toString() + resultDigits;
    }

    // Handle any remaining carry
    if (carry > 0) {
      resultDigits = carry.toString() + resultDigits;
    }

    // Calculate where the decimal should be placed
    final resultDecimal =
        resultDigits.length - (thisScale > otherScale ? thisScale : otherScale);

    // Final construction of result UcumDecimal
    final result = UcumDecimal()
      ..digits = resultDigits
      ..decimal = resultDecimal
      ..precision = math.min(precision, other.precision)
      ..scientific = scientific || other.scientific
      ..negative =
          negative; // Assuming addition of two positive numbers for simplicity

    return result;
  }

  /// Converts a single digit character [c] (`'0'`–`'9'`) to its int value.
  int dig(String c) => c.codeUnitAt(0) - '0'.codeUnitAt(0);

  /// Converts a single-digit int [i] (0–9) back to its character form.
  String cdig(int i) => String.fromCharCode(i + '0'.codeUnitAt(0));

  /// Subtracts the magnitudes of this value and [other] ignoring sign.
  ///
  /// Aligns both digit strings on the decimal point, subtracts the smaller
  /// from the larger with borrow propagation, and records whether the result
  /// should be negative in the returned value's [negative] flag.
  UcumDecimal doSubtract(UcumDecimal other) {
    int max = math.max(decimal, other.decimal);
    var s1 = stringMultiply('0', max - decimal + 1) + digits;
    var s2 = stringMultiply('0', max - other.decimal + 1) + other.digits;

    if (s1.length < s2.length) {
      s1 = s1 + stringMultiply('0', s2.length - s1.length);
    } else if (s2.length < s1.length) {
      s2 = s2 + stringMultiply('0', s1.length - s2.length);
    }

    String s3;
    final neg = s1.compareTo(s2) < 0;
    if (neg) {
      s3 = s2;
      s2 = s1;
      s1 = s3;
    }

    s3 = stringSubtraction(s1, s2);

    if (s3.isNotEmpty && s3[0] == '1') {
      max++;
    } else {
      s3 = delete(s3, 0, 1);
    }

    if (max != s3.length) {
      if (max < 0) {
        throw Exception('Unhandled');
      } else if (max < s3.length) {
        s3 = insert('.', s3, max);
      } else {
        throw Exception('Unhandled');
      }
    }

    final result = UcumDecimal();
    try {
      result.setValueUcumDecimal(s3);
    } catch (e) {
      // won't happen
    }

    result
      ..negative = neg
      ..scientific = scientific || other.scientific;
    if (decimal < other.decimal) {
      result.precision = precision;
    } else if (other.decimal < decimal) {
      result.precision = other.precision;
    } else {
      result.precision = math.min(precision, other.precision);
    }
    return result;
  }

  /// Adds two equal-length digit strings [s1] and [s2] and returns their sum
  /// as a digit string of the same length.
  ///
  /// The inputs must be the same length and must not overflow that length
  /// (both preconditions are asserted).
  String stringAddition(String s1, String s2) {
    assert(s1.length == s2.length, 'operands must be the same length');
    final result = List<String>.filled(s2.length, '0');
    var c = 0;
    for (var i = s1.length - 1; i >= 0; i--) {
      final t = c + dig(s1[i]) + dig(s2[i]);
      result[i] = cdig(t % 10);
      c = t ~/ 10;
    }
    assert(c == 0, 'sum overflowed the operand width');
    return result.join();
  }

  /// Subtracts equal-length digit string [s2] from [s1], borrowing across
  /// positions, and returns the difference as a digit string.
  ///
  /// [s1] must be greater than or equal to [s2]; a borrow out of the most
  /// significant digit is an internal logic error and throws.
  String stringSubtraction(String s1, String s2) {
    assert(s1.length == s2.length, 'operands must be the same length');
    var top = s1;
    final result = List<String>.filled(s2.length, '0');

    const c = 0;
    for (var i = top.length - 1; i >= 0; i--) {
      var t = c + (dig(top[i]) - dig(s2[i]));
      if (t < 0) {
        t += 10;
        if (i == 0) {
          throw Exception('Internal logic error');
        } else {
          top = replaceChar(top, i - 1, cdig(dig(top[i - 1]) - 1));
        }
      }
      result[i] = cdig(t);
    }
    assert(c == 0, 'borrow carried past the most significant digit');
    return result.join();
  }

  /// Returns [s] with the character at [offset] replaced by [c].
  String replaceChar(String s, int offset, String c) {
    if (offset == 0) {
      return '$c${s.substring(1)}';
    } else {
      return '${s.substring(0, offset)}$c${s.substring(offset + 1)}';
    }
  }

  /// Returns the product of this value and [other].
  ///
  /// Performs long multiplication digit-by-digit, then trims trailing zeros
  /// down to the appropriate result precision (whole-number operands keep full
  /// precision; otherwise the smaller operand precision is used).
  UcumDecimal multiply(UcumDecimal other) {
    if (isZero() || other.isZero()) {
      return UcumDecimal.zero();
    }

    final int max = math.max(decimal, other.decimal);
    var s1 = stringMultiply('0', max - decimal + 1) + digits;
    var s2 = stringMultiply('0', max - other.decimal + 1) + other.digits;

    if (s1.length < s2.length) {
      s1 = s1 + stringMultiply('0', s2.length - s1.length);
    } else if (s2.length < s1.length) {
      s2 = s2 + stringMultiply('0', s1.length - s2.length);
    }

    if (s2.compareTo(s1) > 0) {
      final temp = s1;
      s1 = s2;
      s2 = temp;
    }

    var s = List<String>.generate(s2.length, (_) => '');

    int carry;
    for (var i = s2.length - 1; i >= 0; i--) {
      s[i] = stringMultiply('0', s2.length - (i + 1));
      carry = 0;
      for (var j = s1.length - 1; j >= 0; j--) {
        final t = carry + (dig(s1[j]) * dig(s2[i]));
        s[i] = '${cdig(t % 10)}${s[i]}';
        carry = t ~/ 10;
      }
      while (carry > 0) {
        s[i] = '${cdig(carry % 10)}${s[i]}';
        carry ~/= 10;
      }
    }

    final maxLength = s.map((str) => str.length).reduce(math.max);
    s = s
        .map((str) => stringMultiply('0', maxLength - str.length) + str)
        .toList();

    var result = '';
    carry = 0;
    for (var i = maxLength - 1; i >= 0; i--) {
      for (final str in s) {
        carry += dig(str[i]);
      }
      result = '${cdig(carry % 10)}$result';
      carry ~/= 10;
    }

    if (carry > 0) {
      throw Exception('Internal logic error');
    }

    var decimalPos = result.length - ((s1.length - (max + 1)) * 2);
    while (result.isNotEmpty && result != '0' && result.startsWith('0')) {
      result = result.substring(1);
      decimalPos--;
    }

    int precisionResult;
    if (isWholeNumber() && other.isWholeNumber()) {
      precisionResult = math.max(
        math.max(digits.length, other.digits.length),
        math.min(precision, other.precision),
      );
    } else if (isWholeNumber()) {
      precisionResult = other.precision;
    } else if (other.isWholeNumber()) {
      precisionResult = precision;
    } else {
      precisionResult = math.min(precision, other.precision);
    }

    while (result.length > precisionResult && result.endsWith('0')) {
      result = result.substring(0, result.length - 1);
    }

    final newUcumDecimal = UcumDecimal()
      ..setValueUcumDecimal(result)
      ..precision = precisionResult
      ..decimal = decimalPos
      ..negative = negative != other.negative
      ..scientific = scientific || other.scientific;
    return newUcumDecimal;
  }

  /// Operator form of [multiply].
  UcumDecimal operator *(UcumDecimal other) {
    return multiply(other);
  }

  @override
  bool operator ==(Object other) {
    if (other is! UcumDecimal) {
      return false;
    } else {
      return asUcumDecimal() == other.asUcumDecimal();
    }
  }

  /// Whether this value is equivalent to [other] (same canonical string form).
  bool equivalent(Object other) {
    return this == other;
  }

  /// Returns the product of this value and the integer [other].
  UcumDecimal multiplyInt(int other) {
    return multiply(UcumDecimal.fromInt(other));
  }

  /// Returns the quotient of this value divided by [other].
  ///
  /// Uses long division against precomputed multiples (`tens`) of the divisor,
  /// producing a quotient rounded to the appropriate result precision. Throws
  /// a [UcumException] on division by zero.
  UcumDecimal divide(UcumDecimal other) {
    if (isZero()) {
      return UcumDecimal.zero();
    } else if (other.isZero()) {
      throw UcumException('Attempt to divide $toString() by zero');
    } else {
      final s = '0${other.digits}';
      final m = math.max(digits.length, other.digits.length) +
          40; // max loops we'll do
      final tens = List<String>.filled(10, '');
      tens[0] = stringAddition(stringMultiply('0', s.length), s);
      for (var i = 1; i < 10; i++) {
        tens[i] = stringAddition(tens[i - 1], s);
      }
      var v = digits;
      var r = '';
      var l = 0;
      var d = (digits.length - decimal + 1) -
          (other.digits.length - other.decimal + 1);

      if (v.length < tens[0].length) {
        final pad = tens[0].length - v.length;
        v = v.padRight(tens[0].length, '0');
        d += pad;
      }

      String w;
      int vi;
      if (v.substring(0, other.digits.length).compareTo(other.digits) < 0) {
        if (v.length == tens[0].length) {
          v = '${v}0';
          d++;
        }
        w = v.substring(0, other.digits.length + 1);
        vi = w.length;
      } else {
        w = '0${v.substring(0, other.digits.length)}';
        vi = w.length - 1;
      }

      var handled = false;
      bool proc;

      while (!(handled &&
          ((l > m) ||
              ((vi >= v.length) && (Utilities.noString(w) || allZeros(w)))))) {
        l++;
        handled = true;
        proc = false;
        for (var i = 8; i >= 0; i--) {
          if (tens[i].compareTo(w) <= 0) {
            proc = true;
            r = r + cdig(i + 1);
            w = trimLeadingZeros(stringSubtraction(w, tens[i]));
            if (!(handled &&
                ((l > m) ||
                    ((vi >= v.length) &&
                        (Utilities.noString(w) || allZeros(w)))))) {
              if (vi < v.length) {
                w = w + v[vi];
                vi++;
                handled = false;
              } else {
                w = '${w}0';
                d++;
              }
              while (w.length < tens[0].length) {
                w = '0$w';
              }
            }
            break;
          }
        }
        if (!proc) {
          assert(w[0] == '0', 'expected a leading zero when no digit fits');
          w = delete(w, 0, 1);
          r = '${r}0';
          if (!(handled &&
              ((l > m) ||
                  ((vi >= v.length) &&
                      (Utilities.noString(w) || allZeros(w)))))) {
            if (vi < v.length) {
              w = w + v[vi];
              vi++;
              handled = false;
            } else {
              w = '${w}0';
              d++;
            }
            while (w.length < tens[0].length) {
              w = '0$w';
            }
          }
        }
      }
      int prec;

      if (isWholeNumber() && other.isWholeNumber() && (l < m)) {
        for (var i = 0; i < d; i++) {
          if (r[r.length - 1] == '0') {
            r = delete(r, r.length - 1, 1);
            d--;
          }
        }
        prec = 100;
      } else {
        if (isWholeNumber() && other.isWholeNumber()) {
          prec = math.max(digits.length, other.digits.length);
        } else if (isWholeNumber()) {
          prec = math.max(other.precision, r.length - d);
        } else if (other.isWholeNumber()) {
          prec = math.max(precision, r.length - d);
        } else {
          prec = math.max(math.min(precision, other.precision), r.length - d);
        }

        if (r.length > prec) {
          d = d - (r.length - prec);
          final digit = r[prec].codeUnitAt(0);
          final up = digit >= '5'.codeUnitAt(0);
          if (up) {
            final rs = r.substring(0, prec).codeUnits.toList();
            var i = rs.length - 1;
            var carry = true;
            while (carry && i >= 0) {
              var ls = rs[i];
              if (ls == '9'.codeUnitAt(0)) {
                rs[i] = '0'.codeUnitAt(0);
              } else {
                ls = ls + 1;
                rs[i] = ls;
                carry = false;
              }
              i--;
            }
            if (carry) {
              r = '1${String.fromCharCodes(rs)}';
              d++; // because we added one at the start
            } else {
              r = String.fromCharCodes(rs);
            }
          } else {
            r = r.substring(0, prec);
          }
        }
      }

      final result = UcumDecimal()
        ..setValueUcumDecimal(r)
        ..decimal = r.length - d
        ..negative = negative != other.negative
        ..precision = prec
        ..scientific = scientific || other.scientific;
      return result;
    }
  }

  /// Operator form of [divide].
  UcumDecimal operator /(UcumDecimal other) {
    return divide(other);
  }

  /// Integer (truncating) division: `this / other` truncated toward zero.
  UcumDecimal operator ~/(UcumDecimal other) {
    return divide(other).trunc();
  }

  /// Returns the quotient of this value divided by the integer [other].
  UcumDecimal divideInt(int other) {
    return divide(UcumDecimal.fromInt(other));
  }

  /// Returns [s] with its leading zeros removed, or `"0"` if it is all zeros.
  String trimLeadingZeros(String s) {
    var i = 0;
    while (i < s.length && s[i] == '0') {
      i++;
    }
    if (i == s.length) {
      return '0';
    } else {
      return s.substring(i);
    }
  }

  /// Returns the integer part of `this / other` (quotient truncated to a whole
  /// number).
  UcumDecimal divInt(UcumDecimal other) {
    final t = divide(other);
    return t.trunc();
  }

  /// Returns the remainder of this value modulo [other]
  /// (`this - trunc(this / other) * other`); throws on a zero divisor.
  UcumDecimal modulo(UcumDecimal other) {
    if (other.isZero()) {
      throw UcumException('Modulo by zero');
    }

    final divisionResult = divide(other);
    final truncatedResult = divisionResult.trunc();
    return subtract(truncatedResult.multiply(other));
  }

  /// Returns the absolute value (a copy with the sign cleared).
  UcumDecimal absolute() {
    final result = copy()..negative = false;
    return result;
  }

  @override
  int get hashCode => asUcumDecimal().hashCode;

  /// Caps this value's [precision] so it does not exceed that of [other].
  void limitPrecisionTo(UcumDecimal other) {
    // Precision can't be greater than other
    if (precision > other.precision) {
      precision = other.precision;
    }
  }

  /// Corrects trailing rounding artefacts on high-precision values that are
  /// really whole numbers, folding a long run of trailing `9`s or `0`s back
  /// into an exact integer.
  void checkForCouldBeWholeNumber() {
    // Whole numbers have implied infinite precision, but we need to check for
    // digit errors in the last couple of digits
    if (precision > 17 && digits.length > 3) {
      var i = digits.length - 2;
      final ch = digits[i]; // Second last character
      if (ch == '9') {
        while (i > 0 && digits[i - 1] == '9') {
          i--;
        }
        if (i > 0 && i < digits.length - 3) {
          digits = digits.substring(0, i - 1) +
              String.fromCharCode(digits.codeUnitAt(i - 1) + 1);
          precision = digits.length;
        }
      } else if (ch == '0') {
        while (i > 0 && digits[i - 1] == '0') {
          i--;
        }
        if (i > 0 && i < digits.length - 3) {
          digits = digits.substring(0, i);
          precision = digits.length;
        }
      }
    }
  }
}
