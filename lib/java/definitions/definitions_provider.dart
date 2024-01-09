import '../ucum.dart';

abstract class DefinitionsProvider {
  Future<UcumModel> parse(String filename);
  Future<UcumModel> parseFromStream(Stream<List<int>> stream);
}
