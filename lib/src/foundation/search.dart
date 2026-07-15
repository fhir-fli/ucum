import 'package:ucum/src/internal.dart';

/// Free-text and regex search across the concepts held in a [UcumModel].
class Search {
  /// Searches [model] for concepts matching [text], optionally restricted to a
  /// single [kind] (null searches prefixes, base units, and defined units).
  /// When [isRegex] is true [text] is treated as a regular expression,
  /// otherwise as a case-insensitive substring.
  List<UcumConcept> doSearch(
    UcumModel model,
    ConceptKind? kind,
    String text,
    bool isRegex,
  ) {
    final concepts = <UcumConcept>[];
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

  /// Appends every unit in [units] that matches [text] to [concepts].
  void searchUnits(
    List<UcumConcept> concepts,
    List<UcumUnit> units,
    String text,
    bool isRegex,
  ) {
    for (final unit in units) {
      if (matchesUnit(unit, text, isRegex)) {
        // Assuming here that UcumUnit extends or implements UcumConcept
        concepts.add(unit);
      }
    }
  }

  /// Whether [unit] matches [text] on its property or on any inherited concept
  /// field (names, codes, print symbol).
  bool matchesUnit(UcumUnit unit, String text, bool isRegex) {
    return matches(unit.property, text, isRegex) ||
        matchesUcumConcept(unit, text, isRegex);
  }

  /// Appends every prefix in [prefixes] that matches [text] to [concepts].
  void searchPrefixes(
    List<UcumConcept> concepts,
    List<Prefix> prefixes,
    String text,
    bool isRegex,
  ) {
    for (final concept in prefixes) {
      if (matchesUcumConcept(concept, text, isRegex)) {
        concepts.add(concept);
      }
    }
  }

  /// Whether [text] matches any of [concept]'s names, its case-sensitive or
  /// case-insensitive code, or its print symbol.
  bool matchesUcumConcept(UcumConcept concept, String text, bool isRegex) {
    for (final name in concept.names) {
      if (matches(name, text, isRegex)) {
        return true;
      }
    }
    return matches(concept.code, text, isRegex) ||
        matches(concept.codeUC, text, isRegex) ||
        matches(concept.printSymbol, text, isRegex);
  }

  /// Whether [value] matches [text]; returns false for a null [value]. Uses
  /// regex matching when [isRegex] is true, otherwise case-insensitive
  /// substring containment.
  bool matches(String? value, String text, bool isRegex) {
    if (value == null) {
      return false;
    }
    return isRegex
        ? RegExp(text).hasMatch(value)
        : value.toLowerCase().contains(text.toLowerCase());
  }
}
