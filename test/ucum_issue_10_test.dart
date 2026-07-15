// ignore_for_file: avoid_print

import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

void main() {
  group('Ucum Issue # 10', () {
    late UcumService ucumService;

    setUpAll(() {
      ucumService = getUcumService();
    });

    String describeDuration(int ms) {
      final days = ms / (1000 * 60 * 60 * 24);
      final hours = ms / (1000 * 60 * 60) % 24;
      final mins = ms / (1000 * 60) % 60;
      final secs = ms / 1000 % 60;
      final millis = ms % 1000;
      if (days > 0) {
        return '${days}d ${hours}h ${mins}m ${secs}s ${millis}ms';
      } else {
        return '${hours}h ${mins}m ${secs}s ${millis}ms';
      }
    }

    test('KgToPoundTest', () {
      final start = DateTime.now().millisecondsSinceEpoch;
      for (var i = 90.5; i < 100; i += 0.001) {
        final decimal = UcumDecimal.fromString(i.toString());
        final expectPound = i * 2.2046226218487758072297380134503;
        final actual = ucumService.convert(decimal, 'kg', '[lb_av]');
        if ((double.parse(actual.asUcumDecimal()) - expectPound).abs() >
            0.001) {
          throw Exception('$i actual:$actual expected:$expectPound');
        }
      }
      final elapsed =
          describeDuration(DateTime.now().millisecondsSinceEpoch - start);
      print('elapsed = $elapsed');
    });
  });
}

UcumService getUcumService() => UcumService();
