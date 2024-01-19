import 'ucum.dart';

class ValidatedQuantity extends Pair {
  late String? unit;
  late String? time;
  ValidatedQuantity(super.value, super.code, [this.unit, this.time]);

  factory ValidatedQuantity.fromString(String string) {
    print(string);
    final matches = validatedQuantityRegex.firstMatch(string);
    String? unit;
    String? time;
    print(matches?.groupNames);
    if (matches?.namedGroup('value') == null) {
      throw 'Quantity must have a number';
    } else {
      if (matches?.namedGroup('unit') != null) {
        unit = matches!.namedGroup('unit');
      } else if (matches?.namedGroup('time') != null) {
        time = matches!.namedGroup('time');
      }
      return ValidatedQuantity(Decimal.fromString(matches!.namedGroup('value')),
          unit ?? time ?? '', unit, time);
    }
  }

  static RegExp validatedQuantityRegex = RegExp(
      r"^(?<value>(\+|-)?\d+(\.\d+)?)\s*('(?<unit>[^']+)'|(?<time>[a-zA-Z]+))?$");
}
