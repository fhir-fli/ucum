import 'dart:io';
import 'package:xml/xml.dart';

class XmlUtils {
  static Future<XmlDocument> parseDOM(File file) async {
    final contents = await file.readAsString();
    final xmlDoc = XmlDocument.parse(contents);
    return xmlDoc;
  }

  static XmlElement? getNamedChild(XmlElement? e, String name) {
    var c = getFirstChild(e);
    while (c != null && name != c.name.local && name != c.name.qualified) {
      c = getNextSibling(c);
    }
    return c;
  }

  static String? getNamedChildText(XmlElement? element, String name) {
    final e = getNamedChild(element, name);
    return e?.text;
  }

  static XmlElement? getFirstChild(XmlElement? e) {
    if (e == null) return null;
    var n = e.findElements('*').firstOrNull;
    return n;
  }

  static XmlElement? getNextSibling(XmlElement? e) {
    return e?.findElements('*').firstOrNull;
  }

  static List<XmlElement> getNamedChildren(XmlElement e, String name) {
    final res = <XmlElement>[];
    var c = getFirstChild(e);
    while (c != null) {
      if (name == c.name.local || name == c.name.qualified) {
        res.add(c);
      }
      c = getNextSibling(c);
    }
    return res;
  }
}
