import 'package:ucum/ucum.dart';

class UcumServiceTest {
  late UcumService ucumService;

  void beforeAll() {
    getUcumEssenceService().then((value) => ucumService = value);
  }

  Future<UcumService> getUcumEssenceService() async {
    final fileName = 'lib/resources/ucum-essence.xml';
    final ucumService = await UcumEssenceService.fromFile(fileName);
    return ucumService;
  }
}
