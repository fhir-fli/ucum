import '../ucum.dart';

final prefixesList = <Prefix>[
  Prefix(
      code: "Y",
      codeUC: "YA",
      value: Decimal.fromString('1000000000000000000000000', 24),
      name: "yotta",
      printSymbol: "Y"),
  Prefix(
      code: "Z",
      codeUC: "ZA",
      value: Decimal.fromString('1000000000000000000000', 24),
      name: "zetta",
      printSymbol: "Z"),
  Prefix(
      code: "E",
      codeUC: "EX",
      value: Decimal.fromString('1000000000000000000', 24),
      name: "exa",
      printSymbol: "E"),
  Prefix(
      code: "P",
      codeUC: "PT",
      value: Decimal.fromString('1000000000000000', 24),
      name: "peta",
      printSymbol: "P"),
  Prefix(
      code: "T",
      codeUC: "TR",
      value: Decimal.fromString('1000000000000', 24),
      name: "tera",
      printSymbol: "T"),
  Prefix(
      code: "G",
      codeUC: "GA",
      value: Decimal.fromString('1000000000', 24),
      name: "giga",
      printSymbol: "G"),
  Prefix(
      code: "M",
      codeUC: "MA",
      value: Decimal.fromString('1000000', 24),
      name: "mega",
      printSymbol: "M"),
  Prefix(
      code: "k",
      codeUC: "K",
      value: Decimal.fromString('1000', 24),
      name: "kilo",
      printSymbol: "k"),
  Prefix(
      code: "h",
      codeUC: "H",
      value: Decimal.fromString('100', 24),
      name: "hecto",
      printSymbol: "h"),
  Prefix(
      code: "da",
      codeUC: "DA",
      value: Decimal.fromString('10', 24),
      name: "deka",
      printSymbol: "da"),
  Prefix(
      code: "d",
      codeUC: "D",
      value: Decimal.fromString('0.1', 24),
      name: "deci",
      printSymbol: "d"),
  Prefix(
      code: "c",
      codeUC: "C",
      value: Decimal.fromString('0.01', 24),
      name: "centi",
      printSymbol: "c"),
  Prefix(
      code: "m",
      codeUC: "M",
      value: Decimal.fromString('0.001', 24),
      name: "milli",
      printSymbol: "m"),
  Prefix(
      code: "u",
      codeUC: "U",
      value: Decimal.fromString('0.000001', 24),
      name: "micro",
      printSymbol: "μ"),
  Prefix(
      code: "n",
      codeUC: "N",
      value: Decimal.fromString('0.000000001', 24),
      name: "nano",
      printSymbol: "n"),
  Prefix(
      code: "p",
      codeUC: "P",
      value: Decimal.fromString('0.000000000001', 24),
      name: "pico",
      printSymbol: "p"),
  Prefix(
      code: "f",
      codeUC: "F",
      value: Decimal.fromString('0.000000000000001', 24),
      name: "femto",
      printSymbol: "f"),
  Prefix(
      code: "a",
      codeUC: "A",
      value: Decimal.fromString('0.000000000000000001', 24),
      name: "atto",
      printSymbol: "a"),
  Prefix(
      code: "z",
      codeUC: "ZO",
      value: Decimal.fromString('0.000000000000000000001', 24),
      name: "zepto",
      printSymbol: "z"),
  Prefix(
      code: "y",
      codeUC: "YO",
      value: Decimal.fromString('0.000000000000000000000001', 24),
      name: "yocto",
      printSymbol: "y"),
  Prefix(
      code: "Ki",
      codeUC: "KIB",
      value: Decimal.fromString('1024', 24),
      name: "kibi",
      printSymbol: "Ki"),
  Prefix(
      code: "Mi",
      codeUC: "MIB",
      value: Decimal.fromString('1048576', 24),
      name: "mebi",
      printSymbol: "Mi"),
  Prefix(
      code: "Gi",
      codeUC: "GIB",
      value: Decimal.fromString('1073741824', 24),
      name: "gibi",
      printSymbol: "Gi"),
  Prefix(
      code: "Ti",
      codeUC: "TIB",
      value: Decimal.fromString('1099511627776', 24),
      name: "tebi",
      printSymbol: "Ti")
];
