import '../ucum.dart';

class ValidatedQuantity extends Pair {
  ValidatedQuantity({required super.value, String? code})
      : super(code: code ?? '1');

  factory ValidatedQuantity.fromString(String string) {
    final matches = valueRegex.firstMatch(string);
    if (matches?.namedGroup('value') == null) {
      throw 'Quantity must have a number';
    }
    string = string.replaceAll(matches!.namedGroup('value')!, '').trim();
    return ValidatedQuantity(
        value: Decimal.fromString(matches.namedGroup('value')), code: string);
  }

  bool isValid() => UcumService().validate(code) == null;

  static RegExp valueRegex = RegExp(r"^(?<value>(\+|-)?\d+(\.\d+)?)\s*");

  @override
  operator ==(Object other) {
    print('here');
    if (other is ValidatedQuantity) {
      return UcumService().isEqual(this, other);
    } else if (other is String) {
      final newQuantity = ValidatedQuantity.fromString(other);
      if (newQuantity.isValid()) {
        return UcumService().isEqual(this, newQuantity);
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  int get hashCode => super.hashCode;
}
