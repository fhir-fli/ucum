// Regenerates lib/resources/{prefixes,base_units,defined_units,essence_metadata}.dart
// from tool/ucum-essence.xml (the official UCUM essence file from
// https://unitsofmeasure.org, also bundled with FHIR/Ucum-java).
//
// Run from the package root:
//   dart run tool/generate_definitions.dart
//   dart format lib/resources
//
// Parsing mirrors Ucum-java's XmlDefinitionsParser:
// - prefix values are read at precision 24;
// - unit values containing '.' are read at precision 24, whole values at
//   natural precision;
// - names/printSymbol/property use the element text content.
// One deliberate divergence: for special units (isSpecial="yes") Java stores
// the raw <value Unit="cel(1 K)"> attribute, which nothing can parse. We
// store the <function> element's Unit and value instead ('K', 1) — the same
// information the special-unit handlers encode, kept consistent with them.
import 'dart:io';

import 'package:xml/xml.dart';

Future<void> main() async {
  final XmlDocument doc =
      XmlDocument.parse(File('tool/ucum-essence.xml').readAsStringSync());
  final XmlElement root = doc.rootElement;
  final String version = root.getAttribute('version') ?? '';
  final String revision = root.getAttribute('revision') ?? '';
  final String revisionDate = root.getAttribute('revision-date') ?? '';

  stdout.writeln('ucum-essence version=$version revision-date=$revisionDate');

  await _writeMetadata(version, revision, revisionDate);
  await _writePrefixes(root);
  await _writeBaseUnits(root);
  await _writeDefinedUnits(root);
}

const String _header = '''
// GENERATED FILE - DO NOT EDIT BY HAND.
// Generated from tool/ucum-essence.xml by tool/generate_definitions.dart.
import '../ucum.dart';

''';

String _dart(String s) {
  final String base = s.replaceAll(r'\', r'\\').replaceAll(r'$', r'\$');
  // Prefer double quotes for strings containing apostrophes (codes like
  // "'" for angle minutes) so avoid_escaping_inner_quotes stays happy.
  if (base.contains("'") && !base.contains('"')) {
    return '"$base"';
  }
  return "'${base.replaceAll("'", r"\'")}'";
}

/// Pretty-printed XML puts newlines/indentation inside mixed content (e.g.
/// printSymbol 'ε<sub>0</sub>'); collapse to single spaces so the value is
/// a sane one-line string.
String _collapse(String s) => s.replaceAll(RegExp(r'\s+'), ' ').trim();

/// Text content of the first child element with [name], like Java's
/// getNamedChildText (textContent strips nested markup such as <sub>/<i>).
String? _childText(XmlElement e, String name) {
  for (final XmlElement child in e.childElements) {
    if (child.localName == name) {
      final String text = _collapse(child.innerText);
      return text.isEmpty ? null : text;
    }
  }
  return null;
}

List<String> _names(XmlElement e) => <String>[
      for (final XmlElement child in e.childElements)
        if (child.localName == 'name') _collapse(child.innerText)
    ];

/// Emits a UcumDecimal.fromString expression following Java's precision
/// rules: [alwaysPrecision24] for prefixes; otherwise 24 only when the
/// literal contains a decimal point.
String _decimal(String literal, {bool alwaysPrecision24 = false}) {
  final bool precise = alwaysPrecision24 || literal.contains('.');
  return precise
      ? 'UcumDecimal.fromString(${_dart(literal)}, 24)'
      : 'UcumDecimal.fromString(${_dart(literal)})';
}

Future<void> _writeMetadata(
    String version, String revision, String revisionDate) async {
  final IOSink fh = File('lib/resources/essence_metadata.dart').openWrite();
  fh.write('// GENERATED FILE - DO NOT EDIT BY HAND.\n'
      '// Generated from tool/ucum-essence.xml by '
      'tool/generate_definitions.dart.\n\n'
      '/// Version of the UCUM essence data these tables were generated '
      'from.\n'
      'const String ucumEssenceVersion = ${_dart(version)};\n\n'
      '/// Revision marker from the essence file.\n'
      'const String ucumEssenceRevision = ${_dart(revision)};\n\n'
      '/// Revision date of the essence file (yyyy-MM-dd).\n'
      'const String ucumEssenceRevisionDate = ${_dart(revisionDate)};\n');
  await fh.close();
  stdout.writeln('wrote lib/resources/essence_metadata.dart');
}

Future<void> _writePrefixes(XmlElement root) async {
  final File out = File('lib/resources/prefixes.dart');
  final IOSink fh = out.openWrite();
  fh.write(_header);
  fh.write('final List<Prefix> prefixesList = <Prefix>[\n');
  int n = 0;
  for (final XmlElement e in root.childElements) {
    if (e.localName != 'prefix') {
      continue;
    }
    final XmlElement value =
        e.childElements.firstWhere((XmlElement c) => c.localName == 'value');
    fh.write('  Prefix(\n'
        '      code: ${_dart(e.getAttribute('Code')!)},\n'
        '      codeUC: ${_dart(e.getAttribute('CODE')!)},\n'
        '      value: ${_decimal(value.getAttribute('value')!, alwaysPrecision24: true)},\n'
        '      name: ${_dart(_names(e).first)},\n'
        '      printSymbol: ${_dart(_childText(e, 'printSymbol') ?? '')}),\n');
    await fh.flush();
    n++;
  }
  fh.write('];\n');
  await fh.close();
  stdout.writeln('wrote lib/resources/prefixes.dart ($n prefixes)');
}

Future<void> _writeBaseUnits(XmlElement root) async {
  final File out = File('lib/resources/base_units.dart');
  final IOSink fh = out.openWrite();
  fh.write(_header);
  fh.write('final List<BaseUnit> baseUnitsList = <BaseUnit>[\n');
  int n = 0;
  for (final XmlElement e in root.childElements) {
    if (e.localName != 'base-unit') {
      continue;
    }
    fh.write('  BaseUnit(\n'
        '      code: ${_dart(e.getAttribute('Code')!)},\n'
        '      codeUC: ${_dart(e.getAttribute('CODE')!)},\n'
        '      property: ${_dart(_childText(e, 'property')!)},\n'
        '      dim: ${_dart(e.getAttribute('dim')!)},\n'
        '      name: ${_dart(_names(e).first)},\n'
        '      printSymbol: ${_dart(_childText(e, 'printSymbol') ?? '')}),\n');
    await fh.flush();
    n++;
  }
  fh.write('];\n');
  await fh.close();
  stdout.writeln('wrote lib/resources/base_units.dart ($n base units)');
}

Future<void> _writeDefinedUnits(XmlElement root) async {
  final File out = File('lib/resources/defined_units.dart');
  final IOSink fh = out.openWrite();
  fh.write(_header);
  fh.write('final List<DefinedUnit> definedUnitsList = <DefinedUnit>[\n');
  int n = 0;
  for (final XmlElement e in root.childElements) {
    if (e.localName != 'unit') {
      continue;
    }
    final bool isSpecial = e.getAttribute('isSpecial') == 'yes';
    final XmlElement value =
        e.childElements.firstWhere((XmlElement c) => c.localName == 'value');

    String? unit;
    String? unitUC;
    String? valueLiteral;
    final String text = _collapse(value.innerText);
    if (isSpecial) {
      final XmlElement function = value.childElements
          .firstWhere((XmlElement c) => c.localName == 'function');
      unit = function.getAttribute('Unit');
      unitUC = null;
      valueLiteral = function.getAttribute('value');
    } else {
      unit = value.getAttribute('Unit');
      unitUC = value.getAttribute('UNIT');
      valueLiteral = value.getAttribute('value');
    }

    final StringBuffer valueBuffer = StringBuffer('Value(');
    final List<String> parts = <String>[
      if (unit != null) 'unit: ${_dart(unit)}',
      if (unitUC != null) 'unitUC: ${_dart(unitUC)}',
      if (valueLiteral != null) 'value: ${_decimal(valueLiteral)}',
      if (text.isNotEmpty) 'text: ${_dart(text)}',
    ];
    valueBuffer
      ..write(parts.join(', '))
      ..write(')');

    final List<String> names = _names(e);
    final String namesLiteral = '<String>[${names.map(_dart).join(', ')}]';

    final String? printSymbol = _childText(e, 'printSymbol');
    fh.write('  DefinedUnit(\n'
        '      code: ${_dart(e.getAttribute('Code')!)},\n'
        '      codeUC: ${_dart(e.getAttribute('CODE')!)},\n'
        '      value: $valueBuffer,\n'
        '      property: ${_dart(_childText(e, 'property')!)},\n'
        '      isMetric: ${e.getAttribute('isMetric') == 'yes'},\n'
        '      isSpecial: $isSpecial,\n'
        '      class_: ${_dart(e.getAttribute('class') ?? '')},\n'
        '      names: $namesLiteral'
        '${printSymbol == null ? '' : ',\n      printSymbol: ${_dart(printSymbol)}'}),\n');
    await fh.flush();
    n++;
  }
  fh.write('];\n');
  await fh.close();
  stdout.writeln('wrote lib/resources/defined_units.dart ($n defined units)');
}
