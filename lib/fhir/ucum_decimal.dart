import 'dart:math' as math;

import '../foundation/ucum_exception.dart';
import '../foundation/utilities.dart';

class UcumDecimal {
  late int precision;
  late bool scientific;
  late bool negative;
  late String digits;
  late int decimal;
  static const _int32MinValue = -2147483647;
  static const _int32MaxValue = 2147483647;

  UcumDecimal()
      : precision = 0,
        scientific = false,
        negative = false,
        digits = '',
        decimal = 0;

  UcumDecimal.fromString(String? value, [int? precision]) {
    if (value != null) {
      value = value.toLowerCase();
      if (value.contains("e")) {
        setValueScientific(value);
      } else {
        setValueUcumDecimal(value);
      }
    }
    if (precision != null) {
      this.precision = precision;
    }
  }

  UcumDecimal.fromNum(num i) {
    setValueUcumDecimal(i.toString());
  }

  UcumDecimal.fromInt(int i) {
    setValueUcumDecimal(i.toString());
  }

  UcumDecimal.fromDouble(double d) {
    setValueUcumDecimal(d.toString());
  }

  UcumDecimal.fromBigInt(BigInt i) {
    setValueUcumDecimal(i.toString());
  }

  void setValueUcumDecimal(String value) {
    scientific = false;
    negative = value.startsWith("-");
    if (negative) {
      value = value.substring(1);
    }

    while (value.startsWith("0") && value.length > 1) {
      value = value.substring(1);
    }

    int dec = value.indexOf('.');
    if (dec == -1) {
      precision = value.length;
      decimal = value.length;
      digits = value;
    } else if (dec == value.length - 1) {
      throw UcumException("'$value' is not a valid decimal");
    } else {
      decimal = dec;
      if (allZeros(value, 1)) {
        precision = value.length - 1;
      } else {
        precision = countSignificants(value);
      }
      digits = delete(value, decimal, 1);
      if (allZeros(digits, 0)) {
        precision = precision + 1;
      }
      while (digits.startsWith('0')) {
        digits = digits.substring(1);
        decimal--;
      }
    }
  }

  bool allZeros(String? s, [int start = 0]) {
    if (s == null) {
      return false;
    } else {
      for (int i = start; i < s.length; i++) {
        if (s[i] != '0') return false;
      }
      return true;
    }
  }

  int significantFigures() {
    if (scientific) {
      return countSignificants(digits);
    } else {
      return precision;
    }
  }

  int countSignificants(String value) {
    int i = value.indexOf(".");
    if (i > -1) {
      value = delete(value, i, 1);
    }
    while (value.isNotEmpty && value[0] == '0') {
      value = value.substring(1);
    }
    return value.length;
  }

  String delete(String value, int offset, int length) {
    return value.substring(0, offset) + value.substring(offset + length);
  }

  void setValueScientific(String value) {
    int i = value.indexOf("e");
    String s = value.substring(0, i);
    String e = value.substring(i + 1);

    if (Utilities.noString(s) ||
        s == "-" ||
        !Utilities.isDecimal(s) ||
        Utilities.noString(e) ||
        e == "-" ||
        !Utilities.isInteger(e)) {
      throw UcumException("'$value' is not a valid decimal");
    }

    setValueUcumDecimal(s);
    scientific = true;

    // Adjust for exponent
    int exp = int.parse(e);
    decimal = decimal + exp;
  }

  String stringMultiply(String char, int count) =>
      Utilities.padLeft('', char, count);

  String insert(String ins, String value, int offset) => offset == 0
      ? ins + value
      : value.substring(0, offset) + ins + value.substring(offset);

  @override
  String toString() => asUcumDecimal();

  UcumDecimal copy() => UcumDecimal.fromString(this.asUcumDecimal());

  static UcumDecimal zero() => UcumDecimal.fromString("0");

  bool isZero() => allZeros(digits, 0);

  static UcumDecimal one() => UcumDecimal.fromString("1");

  bool isOne() {
    UcumDecimal one = UcumDecimal.one();
    return this.comparesTo(one) == 0;
  }

  bool equals(Object other) {
    if (other is UcumDecimal) {
      return this.asUcumDecimal() == other.asUcumDecimal();
    }
    return false;
  }

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

  int comparesTo(UcumDecimal? other) {
    if (other == null) {
      return 0;
    } else {
      if (negative && !other.negative) {
        return -1;
      } else if (!negative && other.negative) {
        return 1;
      } else {
        int maxUcumDecimal = math.max(decimal, other.decimal);
        String s1 = ('0' * (maxUcumDecimal - decimal + 1)) + digits;
        String s2 = ('0' * (maxUcumDecimal - other.decimal + 1)) + other.digits;
        if (s1.length < s2.length) {
          s1 = s1 + stringMultiply('0', s2.length - s1.length);
        } else if (s2.length < s1.length) {
          s2 = s2 + stringMultiply('0', s1.length - s2.length);
        }
        int result = s1.compareTo(s2);
        if (negative) {
          result = -result;
        }
        return result;
      }
    }
  }

  bool isWholeNumber() {
    return !this.asUcumDecimal().contains(".");
  }

  String asUcumDecimal() {
    String result = digits;
    if (decimal != digits.length) {
      if (decimal < 0) {
        result = '0.' + ('0' * (0 - decimal)) + digits;
      } else if (decimal < result.length) {
        if (decimal == 0) {
          result = '0.' + result;
        } else {
          result =
              result.substring(0, decimal) + '.' + result.substring(decimal);
        }
      } else {
        result = result + '0' * (decimal - result.length);
      }
    }
    if (negative && result != '0') {
      result = "-" + result;
    }
    return result;
  }

  int asInteger() {
    if (!isWholeNumber()) {
      throw UcumException("Unable to represent $this as an integer");
    }
    if (comparesTo(UcumDecimal.fromString(_int32MinValue.toString())) < 0) {
      throw UcumException(
          "Unable to represent $this as a signed 32-bit integer");
    }
    if (comparesTo(UcumDecimal.fromString(_int32MaxValue.toString())) > 0) {
      throw UcumException(
          "Unable to represent $this as a signed 32-bit integer");
    }
    return int.parse(asUcumDecimal());
  }

  String asScientific() {
    String result = digits;
    bool zero = allZeros(result, 0);
    if (zero) {
      result = precision < 2 ? "0e0" : "0.${'0' * (precision - 1)}e0";
    } else {
      if (digits.length > 1) {
        result = insert(".", result, 1);
      }
      result += "e${decimal - 1}";
    }
    if (negative && !zero) {
      result = '-$result';
    }
    return result;
  }

  UcumDecimal trunc() {
    if (isZero() || decimal <= 0) {
      return zero();
    }

    UcumDecimal result = copy();

    if (result.digits.length >= result.decimal)
      result.digits = result.digits.substring(0, result.decimal);
    if (Utilities.noString(result.digits)) {
      result.digits = "0";
      result.decimal = 1;
      result.negative = false;
    }
    return result;
  }

  UcumDecimal add(UcumDecimal other) {
    if (negative == other.negative) {
      UcumDecimal result = doAdd(other);
      result.negative = negative;
      return result;
    } else if (negative) {
      return other.doSubtract(this);
    } else {
      return doSubtract(other);
    }
  }

  UcumDecimal subtract(UcumDecimal other) {
    UcumDecimal result;
    if (negative && !other.negative) {
      result = doAdd(other);
      result.negative = true;
    } else if (!negative && other.negative) {
      result = doAdd(other);
    } else if (negative && other.negative) {
      result = doSubtract(other);
      result.negative = !result.negative;
    } else {
      result = other.doSubtract(this);
      result.negative = !result.negative;
    }
    return result;
  }

  UcumDecimal doAdd(UcumDecimal other) {
    int max = math.max(decimal, other.decimal);
    String s1 = stringMultiply('0', max - decimal + 1) + digits;
    String s2 = stringMultiply('0', (max - other.decimal + 1)) + other.digits;

    if (s1.length < s2.length) {
      s1 = s1 + stringMultiply('0', s2.length - s1.length);
    } else if (s2.length < s1.length) {
      s2 = s2 + stringMultiply('0', s1.length - s2.length);
    }

    String s3 = stringAddition(s1, s2);

    if (s3.isNotEmpty && s3[0] == '1') {
      max++;
    } else {
      s3 = delete(s3, 0, 1);
    }

    if (max != s3.length) {
      if (max < 0) {
        throw Exception("Unhandled");
      } else if (max < s3.length) {
        s3 = insert('.', s3, max);
      } else {
        throw Exception("Unhandled");
      }
    }

    UcumDecimal result = UcumDecimal();
    try {
      result.setValueUcumDecimal(s3);
    } catch (e) {
      // won't happen
    }
    result.scientific = scientific || other.scientific;
    if (decimal < other.decimal) {
      result.precision = precision;
    } else if (other.decimal < decimal) {
      result.precision = other.precision;
    } else {
      result.precision = math.min(precision, other.precision);
    }
    return result;
  }

  int dig(String c) => c.codeUnitAt(0) - '0'.codeUnitAt(0);

  String cdig(int i) => String.fromCharCode(i + '0'.codeUnitAt(0));

  UcumDecimal doSubtract(UcumDecimal other) {
    int max = math.max(decimal, other.decimal);
    String s1 = stringMultiply('0', max - decimal + 1) + digits;
    String s2 = stringMultiply('0', max - other.decimal + 1) + other.digits;

    if (s1.length < s2.length) {
      s1 = s1 + stringMultiply('0', s2.length - s1.length);
    } else if (s2.length < s1.length) {
      s2 = s2 + stringMultiply('0', s1.length - s2.length);
    }

    String s3;
    bool neg = s1.compareTo(s2) < 0;
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
        throw Exception("Unhandled");
      } else if (max < s3.length) {
        s3 = insert('.', s3, max);
      } else {
        throw Exception("Unhandled");
      }
    }

    UcumDecimal result = UcumDecimal();
    try {
      result.setValueUcumDecimal(s3);
    } catch (e) {
      // won't happen
    }

    result.negative = neg;
    result.scientific = scientific || other.scientific;
    if (decimal < other.decimal) {
      result.precision = precision;
    } else if (other.decimal < decimal) {
      result.precision = other.precision;
    } else {
      result.precision = math.min(precision, other.precision);
    }
    return result;
  }

  String stringAddition(String s1, String s2) {
    assert(s1.length == s2.length);
    List<String> result = List.filled(s2.length, '0');
    int c = 0;
    for (int i = s1.length - 1; i >= 0; i--) {
      int t = c + dig(s1[i]) + dig(s2[i]);
      result[i] = cdig(t % 10);
      c = t ~/ 10;
    }
    assert(c == 0);
    return result.join();
  }

  String stringSubtraction(String s1, String s2) {
    assert(s1.length == s2.length);
    List<String> result = List.filled(s2.length, '0');

    int c = 0;
    for (int i = s1.length - 1; i >= 0; i--) {
      int t = c + (dig(s1[i]) - dig(s2[i]));
      if (t < 0) {
        t += 10;
        if (i == 0) {
          throw Exception("Internal logic error");
        } else {
          s1 = replaceChar(s1, i - 1, cdig(dig(s1[i - 1]) - 1));
        }
      }
      result[i] = cdig(t);
    }
    assert(c == 0);
    return result.join();
  }

  String replaceChar(String s, int offset, String c) {
    if (offset == 0) {
      return '$c${s.substring(1)}';
    } else {
      return '${s.substring(0, offset)}$c${s.substring(offset + 1)}';
    }
  }

  UcumDecimal multiply(UcumDecimal other) {
    if (isZero() || other.isZero()) {
      return zero();
    }

    int max = math.max(decimal, other.decimal);
    String s1 = stringMultiply('0', max - decimal + 1) + digits;
    String s2 = stringMultiply('0', max - other.decimal + 1) + other.digits;

    if (s1.length < s2.length) {
      s1 = s1 + stringMultiply('0', s2.length - s1.length);
    } else if (s2.length < s1.length) {
      s2 = s2 + stringMultiply('0', s1.length - s2.length);
    }

    if (s2.compareTo(s1) > 0) {
      String temp = s1;
      s1 = s2;
      s2 = temp;
    }

    List<String> s = List.generate(s2.length, (_) => '');

    int carry;
    for (int i = s2.length - 1; i >= 0; i--) {
      s[i] = stringMultiply('0', s2.length - (i + 1));
      carry = 0;
      for (int j = s1.length - 1; j >= 0; j--) {
        int t = carry + (dig(s1[j]) * dig(s2[i]));
        s[i] = '${cdig(t % 10)}' + s[i];
        carry = t ~/ 10;
      }
      while (carry > 0) {
        s[i] = '${cdig(carry % 10)}' + s[i];
        carry ~/= 10;
      }
    }

    int maxLength = s.map((str) => str.length).reduce(math.max);
    s = s
        .map((str) => stringMultiply('0', maxLength - str.length) + str)
        .toList();

    String result = '';
    carry = 0;
    for (int i = maxLength - 1; i >= 0; i--) {
      for (String str in s) {
        carry += dig(str[i]);
      }
      result = '${cdig(carry % 10)}' + result;
      carry ~/= 10;
    }

    if (carry > 0) {
      throw Exception('Internal logic error');
    }

    int decimalPos = result.length - ((s1.length - (max + 1)) * 2);
    while (result.isNotEmpty && result != '0' && result.startsWith('0')) {
      result = result.substring(1);
      decimalPos--;
    }

    int precisionResult;
    if (isWholeNumber() && other.isWholeNumber()) {
      precisionResult = math.max(math.max(digits.length, other.digits.length),
          math.min(precision, other.precision));
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

    UcumDecimal newUcumDecimal = UcumDecimal();
    newUcumDecimal.setValueUcumDecimal(result);
    newUcumDecimal.precision = precisionResult;
    newUcumDecimal.decimal = decimalPos;
    newUcumDecimal.negative = negative != other.negative;
    newUcumDecimal.scientific = scientific || other.scientific;
    return newUcumDecimal;
  }

  UcumDecimal operator *(UcumDecimal other) {
    return multiply(other);
  }

  bool operator ==(Object other) {
    if (other is! UcumDecimal) {
      return false;
    } else {
      return asUcumDecimal() == other.asUcumDecimal();
    }
  }

  bool equivalent(Object other) {
    return this == other;
  }

  UcumDecimal multiplyInt(int other) {
    return multiply(UcumDecimal.fromInt(other));
  }

  UcumDecimal divide(UcumDecimal other) {
    if (isZero()) {
      return zero();
    } else if (other.isZero()) {
      throw UcumException("Attempt to divide $toString() by zero");
    } else {
      String s = "0" + other.digits;
      int m = math.max(digits.length, other.digits.length) +
          40; // max loops we'll do
      List<String> tens = List<String>.filled(10, "");
      tens[0] = stringAddition(stringMultiply('0', s.length), s);
      for (int i = 1; i < 10; i++) {
        tens[i] = stringAddition(tens[i - 1], s);
      }
      String v = digits;
      String r = "";
      int l = 0;
      int d = (digits.length - decimal + 1) -
          (other.digits.length - other.decimal + 1);

      while (v.length < tens[0].length) {
        v = v + "0";
        d++;
      }

      String w;
      int vi;
      if (v.substring(0, other.digits.length).compareTo(other.digits) < 0) {
        if (v.length == tens[0].length) {
          v = v + '0';
          d++;
        }
        w = v.substring(0, other.digits.length + 1);
        vi = w.length;
      } else {
        w = "0" + v.substring(0, other.digits.length);
        vi = w.length - 1;
      }

      bool handled = false;
      bool proc;

      while (!(handled &&
          ((l > m) ||
              ((vi >= v.length) && (Utilities.noString(w) || allZeros(w)))))) {
        l++;
        handled = true;
        proc = false;
        for (int i = 8; i >= 0; i--) {
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
                w = w + '0';
                d++;
              }
              while (w.length < tens[0].length) {
                w = '0' + w;
              }
            }
            break;
          }
        }
        if (!proc) {
          assert(w[0] == '0');
          w = delete(w, 0, 1);
          r = r + '0';
          if (!(handled &&
              ((l > m) ||
                  ((vi >= v.length) &&
                      (Utilities.noString(w) || allZeros(w)))))) {
            if (vi < v.length) {
              w = w + v[vi];
              vi++;
              handled = false;
            } else {
              w = w + '0';
              d++;
            }
            while (w.length < tens[0].length) {
              w = '0' + w;
            }
          }
        }
      }
      int prec;

      if (isWholeNumber() && other.isWholeNumber() && (l < m)) {
        for (int i = 0; i < d; i++) {
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
          int digit = r[prec].codeUnitAt(0);
          bool up = digit >= '5'.codeUnitAt(0);
          if (up) {
            List<int> rs = r.substring(0, prec).codeUnits.toList();
            int i = rs.length - 1;
            bool carry = true;
            while (carry && i >= 0) {
              int ls = rs[i];
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
              r = "1" + String.fromCharCodes(rs);
              d++; // because we added one at the start
            } else {
              r = String.fromCharCodes(rs);
            }
          } else {
            r = r.substring(0, prec);
          }
        }
      }

      UcumDecimal result = UcumDecimal();
      result.setValueUcumDecimal(r);
      result.decimal = r.length - d;
      result.negative = negative != other.negative;
      result.precision = prec;
      result.scientific = scientific || other.scientific;
      return result;
    }
  }

  UcumDecimal operator /(UcumDecimal other) {
    return divide(other);
  }

  UcumDecimal operator ~/(UcumDecimal other) {
    return divide(other).trunc();
  }

  UcumDecimal divideInt(int other) {
    return divide(UcumDecimal.fromInt(other));
  }

  String trimLeadingZeros(String s) {
    int i = 0;
    while (i < s.length && s[i] == '0') i++;
    if (i == s.length)
      return "0";
    else
      return s.substring(i);
  }

  UcumDecimal divInt(UcumDecimal other) {
    UcumDecimal t = divide(other);
    return t.trunc();
  }

  UcumDecimal modulo(UcumDecimal other) {
    if (other.isZero()) {
      throw UcumException("Modulo by zero");
    }

    UcumDecimal divisionResult = this.divide(other);
    UcumDecimal truncatedResult = divisionResult.trunc();
    return this.subtract(truncatedResult.multiply(other));
  }

  UcumDecimal absolute() {
    UcumDecimal result = this.copy();
    result.negative = false;
    return result;
  }

  @override
  int get hashCode => asUcumDecimal().hashCode;

  void limitPrecisionTo(UcumDecimal other) {
    // Precision can't be greater than other
    if (precision > other.precision) {
      precision = other.precision;
    }
  }

  void checkForCouldBeWholeNumber() {
    // Whole numbers have implied infinite precision, but we need to check for digit errors in the last couple of digits
    if (precision > 17 && digits.length > 3) {
      int i = digits.length - 2;
      String ch = digits[i]; // Second last character
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
