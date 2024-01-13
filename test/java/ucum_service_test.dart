import 'package:test/test.dart';
import 'package:ucum/java.dart';

void main() {
  group('UcumServiceTest', () {
    test('Test Setting Up Services', () async {
      try {
        await getUcumEssenceService();
        expect(true, true);
      } catch (e) {
        expect(e.toString(), 'No Errors');
      }
    });
  });
}

Future<UcumService> getUcumEssenceService() async {
  final fileName = 'lib/java/resources/ucum-essence.xml';
  final ucumService = await UcumEssenceService.fromFile(fileName);
  return ucumService;
}