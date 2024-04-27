import '../ucum.dart';

class Search {
  List<UcumConcept> doSearch(
      UcumModel model, ConceptKind? kind, String text, bool isRegex) {
    final List<UcumConcept> concepts = <UcumConcept>[];
    if (kind == null || kind == ConceptKind.prefix) {
      searchPrefixes(concepts, model.prefixes, text, isRegex);
    }
    if (kind == null || kind == ConceptKind.baseUnit) {
      searchUnits(concepts, model.baseUnits, text, isRegex);
    }
    if (kind == null || kind == ConceptKind.unit) {
      searchUnits(concepts, model.definedUnits, text, isRegex);
    }
    return concepts;
  }

  void searchUnits(List<UcumConcept> concepts, List<UcumUnit> units,
      String text, bool isRegex) {
    for (final UcumUnit unit in units) {
      if (matchesUnit(unit, text, isRegex)) {
        // Assuming here that UcumUnit extends or implements UcumConcept
        concepts.add(unit);
      }
    }
  }

  bool matchesUnit(UcumUnit unit, String text, bool isRegex) {
    return matches(unit.property, text, isRegex) ||
        matchesUcumConcept(unit, text, isRegex);
  }

  void searchPrefixes(List<UcumConcept> concepts, List<Prefix> prefixes,
      String text, bool isRegex) {
    for (final Prefix concept in prefixes) {
      if (matchesUcumConcept(concept, text, isRegex)) {
        concepts.add(concept);
      }
    }
  }

  bool matchesUcumConcept(UcumConcept concept, String text, bool isRegex) {
    for (final String name in concept.names) {
      if (matches(name, text, isRegex)) {
        return true;
      }
    }
    return matches(concept.code, text, isRegex) ||
        matches(concept.codeUC, text, isRegex) ||
        matches(concept.printSymbol, text, isRegex);
  }

  bool matches(String? value, String text, bool isRegex) {
    if (value == null) {
      return false;
    }
    return isRegex
        ? RegExp(text).hasMatch(value)
        : value.toLowerCase().contains(text.toLowerCase());
  }
}
