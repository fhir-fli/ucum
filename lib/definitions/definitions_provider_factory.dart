import '../ucum.dart';

class DefinitionsProviderFactory {
  static DefinitionsProvider provider = XmlDefinitionsParser();

  static DefinitionsProvider getProvider() {
    return provider;
  }

  static void setProvider(DefinitionsProvider newProvider) {
    provider = newProvider;
  }
}
