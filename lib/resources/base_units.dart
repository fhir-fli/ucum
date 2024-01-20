import '../ucum.dart';

final baseUnitsList = [
  BaseUnit(
      code: "m",
      codeUC: "M",
      property: "length",
      dim: "L",
      name: "meter",
      synonyms: ['meters'],
      printSymbol: "m"),
  BaseUnit(
      code: "s",
      codeUC: "S",
      property: "time",
      dim: "T",
      name: "second",
      synonyms: ['seconds'],
      printSymbol: "s"),
  BaseUnit(
      code: "g",
      codeUC: "G",
      property: "mass",
      dim: "M",
      name: "gram",
      synonyms: ['grams'],
      printSymbol: "g"),
  BaseUnit(
      code: "rad",
      codeUC: "RAD",
      property: "plane angle",
      dim: "A",
      name: "radian",
      synonyms: ['radians'],
      printSymbol: "rad"),
  BaseUnit(
      code: "K",
      codeUC: "K",
      property: "temperature",
      dim: "C",
      name: "Kelvin",
      printSymbol: "K"),
  BaseUnit(
      code: "C",
      codeUC: "C",
      property: "electric charge",
      dim: "Q",
      name: "Coulomb",
      printSymbol: "C"),
  BaseUnit(
      code: "cd",
      codeUC: "CD",
      property: "luminous intensity",
      dim: "F",
      name: "candela",
      printSymbol: "cd")
];
