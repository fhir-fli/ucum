import 'ucum.dart';

class ValidatedQuantity extends Pair {
  ValidatedQuantity(super.value, super.code);

  factory ValidatedQuantity.fromString(UcumService service, String string) {
    final matches = valueRegex.firstMatch(string);
    if (matches?.namedGroup('value') == null) {
      throw 'Quantity must have a number';
    }
    string = string.replaceAll(matches!.namedGroup('value')!, '').trim();
    if (service.validate(string) != null) {
      throw 'There was a problem with the unit: $string - ${service.validate(string)}';
    }
    return ValidatedQuantity(
        Decimal.fromString(matches.namedGroup('value')), string);
  }

  static RegExp valueRegex = RegExp(r"^(?<value>(\+|-)?\d+(\.\d+)?)\s*");
}
