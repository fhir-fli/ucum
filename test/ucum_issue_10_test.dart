library org.fhir.ucum;

import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

void main() {
  group('Ucum Issue # 10', () {
    late UcumService ucumService;

    setUpAll(() {
      ucumService = getUcumService();
    });

    String describeDuration(int ms) {
      double days = ms / (1000 * 60 * 60 * 24);
      double hours = ms / (1000 * 60 * 60) % 24;
      double mins = ms / (1000 * 60) % 60;
      double secs = ms / (1000) % 60;
      ms = ms % 1000;
      if (days > 0) {
        return "${days}d ${hours}h ${mins}m ${secs}s ${ms}ms";
      } else {
        return "${hours}h ${mins}m ${secs}s ${ms}ms";
      }
    }

    test('KgToPoundTest', () {
      int start = DateTime.now().millisecondsSinceEpoch;
      for (double i = 90.5; i < 100; i += 0.001) {
        //    float i = 90.7183f;
        UcumDecimal decimal = new UcumDecimal.fromString(i.toString());
        double expectPound = i * 2.2046226218487758072297380134503;
        UcumDecimal actual = ucumService.convert(decimal, "kg", "[lb_av]");
        if ((double.parse(actual.asUcumDecimal()) - expectPound).abs() >
            0.001) {
          throw '$i actual:$actual expected:$expectPound';
        }
        print(
            "elapsed = ${describeDuration(DateTime.now().millisecondsSinceEpoch - start)}");
      }
    });
  });
}

UcumService getUcumService() => UcumService();
