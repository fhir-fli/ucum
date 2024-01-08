import 'dart:math' as math;

import 'ucum_pkg.dart';

class UcumFunctions {
  static final Map<String, FunctionPair> _funcs = {};

  UcumFunctions._() {
    // Celsius - convert to Celsius from kelvin and from Celsius to kelvin
    _funcs['cel'] = FunctionPair(
      cnvTo: (x) => x - 273.15,
      cnvFrom: (x) => x + 273.15,
    );

    // Fahrenheit - convert to Fahrenheit from kelvin and from Fahrenheit to kelvin
    _funcs['degf'] = FunctionPair(
      cnvTo: (x) => x - 459.67,
      cnvFrom: (x) => x + 459.67,
    );

    // Example of adding more functions
    _funcs['ph'] = FunctionPair(
      cnvTo: (x) => x.log().negative() / math.ln10,
      cnvFrom: (x) => Number.integer(10).pow(x.negative()),
    );

    // Reaumur - convert between Reaumur and Kelvin
    _funcs['degre'] = FunctionPair(
      cnvTo: (x) => x - 273.15,
      cnvFrom: (x) => x + 273.15,
    );

    // Natural logarithm (base e) and 2 times the natural logarithm
    _funcs['ln'] = FunctionPair(
      cnvTo: (x) => x.log(),
      cnvFrom: (x) => x.exp(),
    );

    _funcs['2ln'] = FunctionPair(
      cnvTo: (x) => x.log() * 2,
      cnvFrom: (x) => (x / 2).exp(),
    );

    // Decadic logarithm (base 10)
    _funcs['lg'] = FunctionPair(
      cnvTo: (x) => x.log() / math.ln10,
      cnvFrom: (x) => Number.integer(10).pow(x),
    );

    _funcs['10lg'] = FunctionPair(
      cnvTo: (x) => x.log() * 10 / math.ln10,
      cnvFrom: (x) => Number.integer(10).pow(x / 10),
    );

    _funcs['20lg'] = FunctionPair(
      cnvTo: (x) => x.log() * 20 / math.ln10,
      cnvFrom: (x) => Number.integer(10).pow(x / 20),
    );

    // Dual logarithm (base 2)
    _funcs['ld'] = FunctionPair(
      cnvTo: (x) => x.log() / math.ln2,
      cnvFrom: (x) => Number.integer(2).pow(x),
    );

    // Tangent and 100 times the tangent
    _funcs['100tan'] = FunctionPair(
      cnvTo: (x) => x.tan() * 100,
      cnvFrom: (x) => (x / 100).atan(),
    );

    // Square root
    _funcs['sqrt'] = FunctionPair(
      cnvTo: (x) => x.sqrt(),
      cnvFrom: (x) => x * x,
    );

    // Inverse
    _funcs['inv'] = FunctionPair(
      cnvTo: (x) => x.dividedInto(1.0),
      cnvFrom: (x) => x.dividedInto(1.0),
    );

    // Homeopathic potency functions
    _funcs['hpX'] = FunctionPair(
      cnvTo: (x) => x.log().negative() / math.ln10,
      cnvFrom: (x) => Number.integer(10).pow(x.negative()),
    );

    // Homeopathic potency functions
    _funcs['hpX'] = FunctionPair(
      cnvTo: (x) => x.log().negative() / math.ln10,
      cnvFrom: (x) => Number.integer(10).pow(x.negative()),
    );

    _funcs['hpC'] = FunctionPair(
      cnvTo: (x) => x.log().negative() / math.log(100),
      cnvFrom: (x) => Number.integer(100).pow(x.negative()),
    );

    _funcs['hpM'] = FunctionPair(
      cnvTo: (x) => x.log().negative() / math.log(1000),
      cnvFrom: (x) => Number.integer(1000).pow(x.negative()),
    );

    _funcs['hpQ'] = FunctionPair(
      cnvTo: (x) => x.log().negative() / math.log(50000),
      cnvFrom: (x) => Number.integer(5000).pow(x.negative()),
    );
  }

  static final UcumFunctions _instance = UcumFunctions._();

  static UcumFunctions get instance => _instance;

  static FunctionPair forName(String fname) {
    fname = fname.toLowerCase();
    if (!_funcs.containsKey(fname)) {
      throw Exception('Requested function $fname is not defined');
    }
    return _funcs[fname]!;
  }

  bool isDefined(String fname) {
    fname = fname.toLowerCase();
    return _funcs.containsKey(fname);
  }
}

class FunctionPair {
  final Number Function(Number) cnvTo;
  final Number Function(Number) cnvFrom;

  FunctionPair({required this.cnvTo, required this.cnvFrom});
}
