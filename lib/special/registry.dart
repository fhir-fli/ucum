import '../ucum.dart';

/// A registry class for managing special unit handlers.
class Registry {
  final Map<String, SpecialUnitHandler> handlers = <String, SpecialUnitHandler>{};

  Registry() {
    _init();
  }

  void _register(SpecialUnitHandler handler) {
    handlers[handler.getCode()] = handler;
  }

  void _init() {
    // Initialize and register handlers
    _register(CelsiusHandler());
    _register(FahrenheitHandler());
    _register(HoldingHandler("[p'diop]", 'deg'));
    _register(HoldingHandler('%[slope]', 'deg'));
    _register(HoldingHandler('[hp_X]', '1'));
    _register(HoldingHandler('[hp_C]', '1'));
    _register(HoldingHandler('[pH]', 'mol/l'));
    _register(HoldingHandler('Np', '1'));
    _register(HoldingHandler('B', '1'));
    _register(HoldingHandler.withValue(
        'B[SPL]', '10*-5.Pa', UcumDecimal.fromString('2', 1)));
    _register(HoldingHandler('B[V]', 'V'));
    _register(HoldingHandler('B[mV]', 'mV'));
    _register(HoldingHandler('B[uV]', 'uV'));
    _register(HoldingHandler('B[W]', 'W'));
    _register(HoldingHandler('B[kW]', 'kW'));
    _register(HoldingHandler('bit_s', '1'));
    // Add other handlers here...
  }

  bool exists(String code) {
    return handlers.containsKey(code);
  }

  SpecialUnitHandler? get(String code) {
    return handlers[code];
  }
}
