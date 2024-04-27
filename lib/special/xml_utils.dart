import 'dart:io';
import 'package:xml/xml.dart';

abstract class XmlUtils {
  static Future<XmlDocument> parseDOM(File file) async {
    final String contents = await file.readAsString();
    final XmlDocument xmlDoc = XmlDocument.parse(contents);
    return xmlDoc;
  }

  static XmlElement? getNamedChild(XmlElement? e, String name) {
    XmlElement? c = getFirstChild(e);
    while (c != null && name != c.name.local && name != c.name.qualified) {
      c = getNextSibling(c);
    }
    return c;
  }

  static String? getNamedChildText(XmlElement? element, String name) {
    final XmlElement? e = getNamedChild(element, name);
    return e?.text;
  }

  static XmlElement? getFirstChild(XmlElement? e) {
    if (e == null) {
      return null;
    }
    final XmlElement? n = e.findElements('*').firstOrNull;
    return n;
  }

  static XmlElement? getNextSibling(XmlElement? e) {
    if (e == null) {
      return null;
    } else {
      final XmlNode? parentNode = e.parent;
      final int? index = parentNode?.childElements.toList().indexOf(e);
      if (index == null ||
          index == -1 ||
          index == ((parentNode?.childElements.length ?? 0) - 1)) {
        return null;
      } else {
        return parentNode!.childElements.toList()[index + 1];
      }
    }
  }

  static List<XmlElement> getNamedChildren(XmlElement e, String name) {
    final List<XmlElement> res = <XmlElement>[];
    XmlElement? c = getFirstChild(e);
    while (c != null) {
      if (name == c.name.local || name == c.name.qualified) {
        res.add(c);
      }
      c = getNextSibling(c);
    }
    return res;
  }
}
