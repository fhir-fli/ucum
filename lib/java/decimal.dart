import 'dart:math' as math;

import 'ucum_exception.dart';
import 'utilities.dart';

class Decimal {
  int? precision;
  bool? scientific;
  bool? negative;
  String? digits;
  int? decimal;
  static const _int32MinValue = -2147483647;
  static const _int32MaxValue = 2147483647;

  Decimal();

  Decimal.fromString(String? value, [int? precision]) {
    if (value != null) {
      value = value.toLowerCase();
      if (value.contains("e")) {
        setValueScientific(value);
      } else {
        setValueDecimal(value);
      }
    }
  }

  Decimal.fromInt(int i) {
    setValueDecimal(i.toString());
  }

  Decimal.fromValue(String value, int precision) {
    value = value.toLowerCase();
    if (value.contains("e")) {
      setValueScientific(value);
    } else {
      setValueDecimal(value);
    }
    this.precision = precision;
  }

  void setValueDecimal(String value) {
    scientific = false;
    negative = value.startsWith("-");
    if (negative ?? false) {
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
      precision = countSignificants(value);
      digits = value.replaceFirst('.', '');
      while (digits!.startsWith('0')) {
        digits = digits!.substring(1);
        decimal = decimal! - 1;
      }
    }
  }

  bool allZeros(String? s, int start) {
    if (s == null) {
      return false;
    } else {
      for (int i = start; i < s.length; i++) {
        if (s[i] != '0') return false;
      }
      return true;
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

    setValueDecimal(s);
    scientific = true;

    // Adjust for exponent
    int exp = int.parse(e);
    decimal = decimal! + exp;
  }

  String stringMultiply(String char, int count) {
    return char * count;
  }

  String insert(String ins, String value, int offset) {
    return offset == 0
        ? ins + value
        : value.substring(0, offset) + ins + value.substring(offset);
  }

  @override
  String toString() {
    return asDecimal();
  }

  Decimal copy() {
    return Decimal.fromString(this.asDecimal());
  }

  static Decimal zero() {
    return Decimal.fromString("0");
  }

  bool isZero() {
    return allZeros(digits, 0);
  }

  static Decimal one() {
    return Decimal.fromString("1");
  }

  bool isOne() {
    Decimal one = Decimal.one();
    return this.comparesTo(one) == 0;
  }

  bool equals(Object other) {
    if (other is Decimal) {
      return this.asDecimal() == other.asDecimal();
    }
    return false;
  }

  int comparesTo(Decimal other) {
    if ((negative ?? false) && !(other.negative ?? false)) {
      return -1;
    } else if (!(negative ?? false) && (other.negative ?? false)) {
      return 1;
    } else {
      int maxDecimal = math.max(decimal ?? 0, other.decimal ?? 0);
      String s1 = '0' * (maxDecimal - (decimal ?? 0)) + (digits ?? '');
      String s2 =
          '0' * (maxDecimal - (other.decimal ?? 0)) + (other.digits ?? '');
      int result = s1.compareTo(s2);
      return (negative ?? false) ? -result : result;
    }
  }

  bool isWholeNumber() {
    return !this.asDecimal().contains(".");
  }

  String asDecimal() {
    String result = digits!;
    if (decimal != digits!.length) {
      if (decimal! < 0) {
        result = "0." + '0' * (0 - decimal!) + digits!;
      } else if (decimal! < result.length) {
        result =
            result.substring(0, decimal!) + '.' + result.substring(decimal!);
      } else {
        result = result + '0' * (decimal! - result.length);
      }
    }
    if (negative! && result != '0') {
      result = "-" + result;
    }
    return result;
  }

  int asInteger() {
    if (!isWholeNumber()) {
      throw UcumException("Unable to represent $this as an integer");
    }
    if (comparesTo(Decimal.fromString(_int32MinValue.toString())) < 0) {
      throw UcumException(
          "Unable to represent $this as a signed 32-bit integer");
    }
    if (comparesTo(Decimal.fromString(_int32MaxValue.toString())) > 0) {
      throw UcumException(
          "Unable to represent $this as a signed 32-bit integer");
    }
    return int.parse(asDecimal());
  }

  String asScientific() {
    String result = digits ?? '';
    bool zero = allZeros(result, 0);
    if (zero) {
      result = (precision ?? 0) < 2 ? "0e0" : "0.${'0' * (precision! - 1)}e0";
    } else {
      if ((digits ?? '').length > 1) {
        result = insert(".", result, 1);
      }
      result += "e${(decimal ?? 0) - 1}";
    }
    if ((negative ?? false) && !zero) {
      result = '-$result';
    }
    return result;
  }

  Decimal trunc() {
    if (this.isZero() || this.decimal! <= 0) {
      return Decimal.fromString("0");
    }

    String truncatedDigits =
        this.digits!.substring(0, math.min(this.digits!.length, this.decimal!));
    return Decimal.fromString(truncatedDigits);
  }

  Decimal add(Decimal other) {
    // Basic checks for zero
    if (this.isZero()) return other;
    if (other.isZero()) return this;

    // Align both numbers by their decimal points for addition
    int maxDecimal = math.max(this.decimal!, other.decimal!);
    String thisDigits = this.digits!.padRight(maxDecimal, '0');
    String otherDigits = other.digits!.padRight(maxDecimal, '0');

    // Perform addition digit by digit
    int carry = 0;
    StringBuffer result = StringBuffer();
    for (int i = maxDecimal - 1; i >= 0; i--) {
      int sum = int.parse(thisDigits[i]) + int.parse(otherDigits[i]) + carry;
      carry = sum ~/ 10;
      result.write(sum % 10);
    }
    if (carry > 0) result.write(carry);
    String finalResult = result.toString().split('').reversed.join('');

    // Create new Decimal instance with the result
    return Decimal.fromString(finalResult);
  }

  Decimal subtract(Decimal other) {
    Decimal result;
    if ((negative ?? false) && !(other.negative ?? false)) {
      result = doAdd(other);
      result.negative = true;
    } else if (!(negative ?? false) && (other.negative ?? false)) {
      result = doAdd(other);
    } else if ((negative ?? false) && (other.negative ?? false)) {
      result = doSubtract(other);
      result.negative = !(result.negative ?? false);
    } else {
      result = other.doSubtract(this);
      result.negative = !(result.negative ?? false);
    }
    return result;
  }

  Decimal doAdd(Decimal other) {
    int max = math.max(decimal ?? 0, other.decimal ?? 0);
    String s1 = '0' * (max - (decimal ?? 0)) + (digits ?? '');
    String s2 = '0' * (max - (other.decimal ?? 0)) + (other.digits ?? '');

    if (s1.length < s2.length) {
      s1 = s1.padRight(s2.length, '0');
    } else if (s2.length < s1.length) {
      s2 = s2.padRight(s1.length, '0');
    }

    String s3 = stringAddition(s1, s2);

    if (s3.isNotEmpty && s3[0] == '1') {
      max++;
    } else {
      s3 = s3.substring(1);
    }

    Decimal result = Decimal();
    result.setValueDecimal(s3);
    result.scientific = (scientific ?? false) || (other.scientific ?? false);
    result.precision = math.min(precision ?? 0, other.precision ?? 0);
    return result;
  }

  int dig(String c) => int.parse(c);

  String cdig(int i) => i.toString();

  Decimal doSubtract(Decimal other) {
    int max = math.max(decimal ?? 0, other.decimal ?? 0);
    String s1 = '0' * (max - (decimal ?? 0)) + (digits ?? '');
    String s2 = '0' * (max - (other.decimal ?? 0)) + (other.digits ?? '');

    if (s1.length < s2.length) {
      s1 = s1.padRight(s2.length, '0');
    } else if (s2.length < s1.length) {
      s2 = s2.padRight(s1.length, '0');
    }

    bool neg = s1.compareTo(s2) < 0;
    String s3 = neg ? stringSubtraction(s2, s1) : stringSubtraction(s1, s2);

    if (s3.isNotEmpty && s3[0] == '1') {
      max++;
    } else {
      s3 = s3.substring(1);
    }

    Decimal result = Decimal();
    result.setValueDecimal(s3);
    result.negative = neg;
    result.scientific = (scientific ?? false) || (other.scientific ?? false);
    result.precision = math.min(precision ?? 0, other.precision ?? 0);
    return result;
  }

  String stringAddition(String s1, String s2) {
    assert(s1.length == s2.length);
    List<int> result = List.filled(s2.length, 0);
    int c = 0;
    for (int i = s1.length - 1; i >= 0; i--) {
      int t = c + dig(s1[i]) + dig(s2[i]);
      result[i] = t % 10;
      c = t ~/ 10;
    }
    assert(c == 0);
    return result.map(cdig).join();
  }

  String stringSubtraction(String s1, String s2) {
    assert(s1.length == s2.length);
    List<int> result = List.filled(s2.length, 0);
    int c = 0;
    for (int i = s1.length - 1; i >= 0; i--) {
      int t = c + dig(s1[i]) - dig(s2[i]);
      if (t < 0) {
        t += 10;
        if (i == 0)
          throw Exception("Internal logic error");
        else
          s1 = replaceChar(s1, i - 1, cdig(dig(s1[i - 1]) - 1));
      }
      result[i] = t;
    }
    assert(c == 0);
    return result.map(cdig).join();
  }

  String replaceChar(String s, int offset, String c) {
    if (offset == 0)
      return c + s.substring(1);
    else
      return s.substring(0, offset) + c + s.substring(offset + 1);
  }

  Decimal multiply(Decimal other) {
    if (isZero() || other.isZero()) {
      return zero();
    }

    int max = math.max(decimal!, other.decimal!);
    String s1 = stringMultiply('0', max - decimal! + 1) + digits!;
    String s2 = stringMultiply('0', max - other.decimal! + 1) + other.digits!;

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
      precisionResult = math.max(math.max(digits!.length, other.digits!.length),
          math.min(precision!, other.precision!));
    } else if (isWholeNumber()) {
      precisionResult = other.precision!;
    } else if (other.isWholeNumber()) {
      precisionResult = precision!;
    } else {
      precisionResult = math.min(precision!, other.precision!);
    }

    while (result.length > precisionResult && result.endsWith('0')) {
      result = result.substring(0, result.length - 1);
    }

    Decimal newDecimal = Decimal();
    newDecimal.setValueDecimal(result);
    newDecimal.precision = precisionResult;
    newDecimal.decimal = decimalPos;
    newDecimal.negative = negative != other.negative;
    newDecimal.scientific =
        (scientific ?? false) || (other.scientific ?? false);
    return newDecimal;
  }

  Decimal operator *(Decimal other) {
    return multiply(other);
  }

  Decimal multiplyInt(int other) {
    return multiply(Decimal.fromInt(other));
  }

  Decimal divide(Decimal other) {
    if (other.isZero()) {
      throw UcumException("Division by zero");
    }

    String dividend = this.digits!.padRight(this.decimal!, '0');
    String divisor = other.digits!.padRight(other.decimal!, '0');
    StringBuffer quotient = StringBuffer();
    int idx = 0;
    int tempDividend = int.parse(dividend.substring(0, divisor.length));
    dividend = dividend.substring(divisor.length);

    while (idx < dividend.length || tempDividend != 0) {
      if (tempDividend < int.parse(divisor)) {
        tempDividend = tempDividend * 10 +
            (idx < dividend.length ? int.parse(dividend[idx]) : 0);
        if (quotient.isNotEmpty) {
          quotient.write('0');
        }
      } else {
        int divResult = tempDividend ~/ int.parse(divisor);
        tempDividend -= divResult * int.parse(divisor);
        quotient.write(divResult.toString());
      }
      idx++;
    }

    void insertIntoStringBuffer(
        StringBuffer buffer, int index, String toInsert) {
      // Convert the StringBuffer to a String for manipulation
      String original = buffer.toString();

      // Check if the index is within the bounds of the original string
      if (index < 0 || index > original.length) {
        throw RangeError('Index out of range');
      }

      // Perform the insertion
      String updated =
          original.substring(0, index) + toInsert + original.substring(index);

      // Clear the original StringBuffer and set the updated string
      buffer.clear();
      buffer.write(updated);
    }

    // Adjusting the decimal point position in quotient
    int decimalPosition = this.decimal! - other.decimal! + quotient.length;
    if (decimalPosition <= 0) {
      insertIntoStringBuffer(quotient, 0, '0.');
      while (decimalPosition < 0) {
        insertIntoStringBuffer(quotient, 1, '0');
        decimalPosition++;
      }
    } else if (decimalPosition < quotient.length) {
      insertIntoStringBuffer(quotient, decimalPosition, '.');
    }

    // Create new Decimal instance with the quotient
    return Decimal.fromString(quotient.toString());
  }

  Decimal operator /(Decimal other) {
    return divide(other);
  }

  Decimal divideInt(int other) {
    return divide(Decimal.fromInt(other));
  }

  String trimLeadingZeros(String s) {
    int i = 0;
    while (i < s.length && s[i] == '0') i++;
    if (i == s.length)
      return "0";
    else
      return s.substring(i);
  }

  Decimal divInt(Decimal other) {
    Decimal t = divide(other);
    return t.trunc();
  }

  Decimal modulo(Decimal other) {
    if (other.isZero()) {
      throw UcumException("Modulo by zero");
    }

    Decimal divisionResult = this.divide(other);
    Decimal truncatedResult = divisionResult.trunc();
    return this.subtract(truncatedResult.multiply(other));
  }

  Decimal absolute() {
    Decimal result = this.copy();
    result.negative = false;
    return result;
  }

  @override
  int get hashCode => asDecimal().hashCode;

  void limitPrecisionTo(Decimal other) {
    // Precision can't be greater than other
    if (precision != null &&
        other.precision != null &&
        precision! > other.precision!) {
      precision = other.precision;
    }
  }

  void checkForCouldBeWholeNumber() {
    // Whole numbers have implied infinite precision, but we need to check for digit errors in the last couple of digits
    if (precision != null &&
        digits != null &&
        precision! > 17 &&
        digits!.length > 3) {
      int i = digits!.length - 2;
      String ch = digits![i]; // Second last character
      if (ch == '9') {
        while (i > 0 && digits![i - 1] == '9') {
          i--;
        }
        if (i > 0 && i < digits!.length - 3) {
          digits = digits!.substring(0, i - 1) +
              String.fromCharCode(digits!.codeUnitAt(i - 1) + 1);
          precision = digits!.length;
        }
      } else if (ch == '0') {
        while (i > 0 && digits![i - 1] == '0') {
          i--;
        }
        if (i > 0 && i < digits!.length - 3) {
          digits = digits!.substring(0, i);
          precision = digits!.length;
        }
      }
    }
  }
}
