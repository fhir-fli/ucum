import 'package:ucum/ucum.dart';

class UcumServiceTest {
  late UcumService ucumService;

  void beforeAll() {
    getUcumService().then((value) => ucumService = value);
  }

  Future<UcumService> getUcumService() async {
    final fileName = 'lib/resources/ucum-essence.xml';
    final ucumService = await UcumService.fromFile(fileName);
    return ucumService;
  }
}
