import 'dart:math' as math;

class Number {
  final int? _integer;
  final double? _decimal;
  final BigInt? _bigInt;
  dynamic get value => _integer ?? _decimal ?? _bigInt;
  Number._(this._integer, this._decimal, this._bigInt);
  factory Number.integer(int integer) => Number._(integer, null, null);
  factory Number.double(double decimal) => Number._(null, decimal, null);
  factory Number.bigInt(BigInt bigInt) => Number._(null, null, bigInt);
  factory Number.one() => Number.integer(1);
  factory Number.num(num num) {
    if (num is int) {
      return Number.integer(num);
    } else if (num is double) {
      return Number.double(num);
    } else {
      throw ArgumentError('num must be int or double');
    }
  }

  Number _fromOther(dynamic number) => number is num
      ? Number.num(number)
      : number is BigInt
          ? Number.bigInt(number)
          : number is Number
              ? number
              : throw ArgumentError('number must be num or BigInt');

  Number operator +(Object number) {
    Number other = _fromOther(number);
    // If either operand is a double, the result should be a double
    if (_decimal != null || other._decimal != null) {
      return Number.double((toDouble(this) + toDouble(other)));
    }

    // If one operand is BigInt and the other is not a double (could be int or
    //BigInt), convert both to BigInt and perform addition
    else if (_bigInt != null || other._bigInt != null) {
      return Number.bigInt((toBigInt(this) + toBigInt(other)));
    }

    // If both operands are int, perform int addition
    else {
      return Number.integer(toInt(this) + toInt(other));
    }
  }

  Number negative() {
    if (_decimal != null) {
      return Number.double(-toDouble(this));
    } else if (_bigInt != null) {
      return Number.bigInt(-toBigInt(this));
    } else {
      return Number.integer(-toInt(this));
    }
  }

  Number operator -(Object number) {
    Number other = _fromOther(number);
    if (_decimal != null || other._decimal != null) {
      return Number.double((toDouble(this) - toDouble(other)));
    } else if (_bigInt != null || other._bigInt != null) {
      return Number.bigInt((toBigInt(this) - toBigInt(other)));
    } else {
      return Number.integer(toInt(this) - toInt(other));
    }
  }

  Number operator *(Object number) {
    Number other = _fromOther(number);
    if (_decimal != null || other._decimal != null) {
      return Number.double((toDouble(this) * toDouble(other)));
    } else if (_bigInt != null || other._bigInt != null) {
      return Number.bigInt((toBigInt(this) * toBigInt(other)));
    } else {
      return Number.integer(toInt(this) * toInt(other));
    }
  }

  Number operator /(Object number) {
    Number other = _fromOther(number);
    // Division always results in a double to maintain precision
    return Number.double((toDouble(this) / toDouble(other)));
  }

  Number operator %(Object number) {
    Number other = _fromOther(number);
    if (_decimal != null || other._decimal != null) {
      return Number.double((toDouble(this) % toDouble(other)));
    } else if (_bigInt != null || other._bigInt != null) {
      return Number.bigInt((toBigInt(this) % toBigInt(other)));
    } else {
      return Number.integer(toInt(this) % toInt(other));
    }
  }

  static int toInt(Number number) =>
      number.value is int ? number.value as int : (number.value as num).toInt();

  static double toDouble(Number number) => number.value is double
      ? number.value as double
      : (number.value as num).toDouble();

  static BigInt toBigInt(Number number) => number.value is BigInt
      ? number.value as BigInt
      : BigInt.from(number.value as int);

  Number dividedInto(num number) {
    if (_decimal != null) {
      return Number.double(number / toDouble(this));
    } else if (_bigInt != null) {
      return Number.bigInt(BigInt.from(number) ~/ toBigInt(this));
    } else {
      return Number.integer(number ~/ toInt(this));
    }
  }

  Number dividedIntoNumber(Number number) {
    if (_decimal != null || number._decimal != null) {
      return Number.double(toDouble(number) / toDouble(this));
    } else if (_bigInt != null || number._bigInt != null) {
      return Number.bigInt(toBigInt(number) ~/ toBigInt(this));
    } else {
      return Number.integer(toInt(number) ~/ toInt(this));
    }
  }

  Number log() {
    if (_decimal != null) {
      return Number.double(math.log(toDouble(this)));
    } else if (_bigInt != null) {
      return Number.double(math.log(toBigInt(this).toDouble()));
    } else {
      return Number.double(math.log(toInt(this).toDouble()));
    }
  }

  Number ln10() {
    if (_decimal != null) {
      return Number.double(math.log(toDouble(this)) / math.ln10);
    } else if (_bigInt != null) {
      return Number.double(math.log(toBigInt(this).toDouble()) / math.ln10);
    } else {
      return Number.double(math.log(toInt(this).toDouble()) / math.ln10);
    }
  }

  Number exp() {
    if (_decimal != null) {
      return Number.double(math.exp(toDouble(this)));
    } else if (_bigInt != null) {
      return Number.double(math.exp(toBigInt(this).toDouble()));
    } else {
      return Number.double(math.exp(toInt(this).toDouble()));
    }
  }

  Number pow(Number exponent) {
    if (_decimal != null || exponent._decimal != null) {
      return Number.double(
          math.pow(toDouble(this), toDouble(exponent)).toDouble());
    } else if (_bigInt != null || exponent._bigInt != null) {
      return Number.double(math
          .pow(toBigInt(this).toDouble(), toBigInt(exponent).toDouble())
          .toDouble());
    } else {
      return Number.double(math
          .pow(toInt(this).toDouble(), toInt(exponent).toDouble())
          .toDouble());
    }
  }

  Number tan() {
    if (_decimal != null) {
      return Number.double(math.tan(toDouble(this)));
    } else if (_bigInt != null) {
      return Number.double(math.tan(toBigInt(this).toDouble()));
    } else {
      return Number.double(math.tan(toInt(this).toDouble()));
    }
  }

  Number atan() {
    if (_decimal != null) {
      return Number.double(math.atan(toDouble(this)));
    } else if (_bigInt != null) {
      return Number.double(math.atan(toBigInt(this).toDouble()));
    } else {
      return Number.double(math.atan(toInt(this).toDouble()));
    }
  }

  Number sqrt() {
    if (_decimal != null) {
      return Number.double(math.sqrt(toDouble(this)));
    } else if (_bigInt != null) {
      return Number.double(math.sqrt(toBigInt(this).toDouble()));
    } else {
      return Number.double(math.sqrt(toInt(this).toDouble()));
    }
  }
}
