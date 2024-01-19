library org.fhir.ucum;

import 'dart:io';

import 'package:test/test.dart';
import 'package:ucum/ucum.dart';
import 'package:xml/xml.dart';

import 'ucum_service_test.dart';

Future<void> main() async {
  final UcumServiceTest ucumServiceTest = UcumServiceTest();
  ucumServiceTest.beforeAll();

  void debug(String string) {
    print(string);
  }

  FunctionalTestType getFunctionalTestType(String typeString) {
    if (typeString == 'history')
      return FunctionalTestType.HISTORY;
    else if (typeString == 'validation')
      return FunctionalTestType.VALIDATION;
    else if (typeString == 'displayNameGeneration')
      return FunctionalTestType.DISPLAY_NAME_GENERATION;
    else if (typeString == 'conversion')
      return FunctionalTestType.CONVERSION;
    else if (typeString == 'multiplication')
      return FunctionalTestType.MULTIPLICATION;
    else if (typeString == 'division')
      return FunctionalTestType.DIVISION;
    else
      throw "unknown element name " + typeString;
  }

  void runMultiplicationCase(XmlElement x) {
    String? id = x.getAttribute("id");
    String? v1 = x.getAttribute("v1");
    String? u1 = x.getAttribute("u1");
    String? v2 = x.getAttribute("v2");
    String? u2 = x.getAttribute("u2");
    String? vRes = x.getAttribute("vRes");
    String? uRes = x.getAttribute("uRes");

    Pair? o1 = v1 != null && u1 != null
        ? Pair(value: Decimal.fromString(v1), code: u1)
        : null;
    Pair? o2 = v2 != null && u2 != null
        ? Pair(value: Decimal.fromString(v2), code: u2)
        : null;
    if (o1 != null && o2 != null) {
      Pair o3 = ucumServiceTest.ucumService.multiply(o1, o2);

      debug("Multiplication Test $id: the value '$v1$u1' * '$v2$u2 ==> "
          '${o3.value.toString()} ${o3.code}');

      // if (!res.toPlainString().equals(outcome)) { - that assumes that we can get the precision right, which we can't
      if (o3.value.comparesTo(Decimal.fromString(vRes)) != 0 ||
          o3.code != uRes) {
        fail("Test $id : The value '$vRes $uRes' was expected, but the result "
            "was '${o3.value.toString()} ${o3.code}'");
      }
    }
  }

  void runDivisionCase(XmlElement x) {
    String? id = x.getAttribute("id");
    String? v1 = x.getAttribute("v1");
    String? u1 = x.getAttribute("u1");
    String? v2 = x.getAttribute("v2");
    String? u2 = x.getAttribute("u2");
    String? vRes = x.getAttribute("vRes");
    String? uRes = x.getAttribute("uRes");

    Pair? o1 = v1 != null && u1 != null
        ? Pair(value: Decimal.fromString(v1), code: u1)
        : null;
    Pair? o2 = v2 != null && u2 != null
        ? Pair(value: Decimal.fromString(v2), code: u2)
        : null;
    if (o1 != null && o2 != null) {
      Pair o3 = ucumServiceTest.ucumService.divideBy(o1, o2);

      debug(
          "Division Test $id: the value '$v1 $u1' * '$v2 $u2' ==> '${o3.value.toString()} ${o3.code}'");

      // if (!res.toPlainString().equals(outcome)) { - that assumes that we can get the precision right, which we can't
      if (o3.value.comparesTo(Decimal.fromString(vRes)) != 0 ||
          o3.code != uRes) {
        fail("Test $id : The value '$vRes $uRes' was expected, but the result "
            "was '${o3.value.toString()} ${o3.code}'");
      }
    }
  }

  runConversionCase(XmlElement x) {
    String? id = x.getAttribute("id");
    String? value = x.getAttribute("value");
    String? srcUnit = x.getAttribute("srcUnit");
    String? dstUnit = x.getAttribute("dstUnit");
    String? outcome = x.getAttribute("outcome");
    print('case $id: $value $srcUnit -> $outcome $dstUnit');
    if (value != null && srcUnit != null && dstUnit != null) {
      Decimal res = ucumServiceTest.ucumService
          .convert(Decimal.fromString(value), srcUnit, dstUnit);
      debug(
          "Convert Test $id: the value '$value $srcUnit' => '${res.toString()} $dstUnit'");

      // if (!res.toPlainString().equals(outcome)) { - that assumes that we can get the precision right, which we can't
      if (res.comparesTo(Decimal.fromString(outcome)) != 0) {
        fail(
            "Test $id: The value '$outcome' was expected the result was '$res'");
      }
    } else {
      fail(
          'Test $id: The value: $value, srcUnit: $srcUnit, or dstUnit: $dstUnit, were null');
    }
  }

  void runDisplayNameGenerationCase(XmlElement x) {
    String? id = x.getAttribute("id");
    String? unit = x.getAttribute("unit");
    String? display = x.getAttribute("display");

    if (unit != null) {
      String res = ucumServiceTest.ucumService.analyse(unit);
      debug("Analyse Test $id: the unit '$unit' => '$res'");

      if (res != display) {
        fail("Test $id: The unit '$unit' was expected to be displayed as "
            "'$display', but was displayed as '$res'");
      }
    } else {
      fail(
          "Test $id: The unit found was null, but was expected to be displayed as '$display'");
    }
  }

  void runValidationCase(XmlElement x) {
    String? id = x.getAttribute("id");
    String? unit = x.getAttribute("unit");
    bool valid = "true" == x.getAttribute("valid");
    String? reason = x.getAttribute("reason");

    if (unit != null) {
      String? res = ucumServiceTest.ucumService.validate(unit);
      bool result = res == null;
      if (result) {
        debug(
            "Validation Test $id: the unit '$unit' is valid (reason: $reason)");
      } else {
        debug(
            "Validation Test $id: the unit is not valid because it is '$res' (reason: $reason)");
      }
      if (valid != result) {
        if (valid) {
          fail(
              "Unit $unit was expected to be valid, but was invalid ('$id') (reason: $reason)");
        } else {
          fail(
              "Unit $unit was expected to be invalid, but was valid ('$id') (reason: $reason)");
        }
      }
    } else {
      debug(
          "Validation Test $id: the unit is not valid because it is null (reason: $reason)");
    }
  }

  void testXmlElement(TestCase testCase) {
    if (testCase.testType == FunctionalTestType.HISTORY)
      // Test history element. Not a test. Do nothing.
      ;
    else if (testCase.testType == FunctionalTestType.VALIDATION)
      runValidationCase(testCase.testCase);
    else if (testCase.testType == FunctionalTestType.DISPLAY_NAME_GENERATION)
      runDisplayNameGenerationCase(testCase.testCase);
    else if (testCase.testType == FunctionalTestType.CONVERSION)
      runConversionCase(testCase.testCase);
    else if (testCase.testType == FunctionalTestType.MULTIPLICATION)
      runMultiplicationCase(testCase.testCase);
    else if (testCase.testType == FunctionalTestType.DIVISION)
      runDivisionCase(testCase.testCase);
    else
      throw 'unknown test type ${testCase.testCase.name}';
  }

  List<TestCase> elements = <TestCase>[];
  File tests = File("test/resources/UcumFunctionalTests.xml");
  XmlDocument doc = await XmlUtils.parseDOM(tests);
  XmlElement element = doc.rootElement;

  if (element.name.toString() != 'ucumTests') {
    throw "Unable to process XML document: expected 'ucumTests' but found "
        "'${element.name}'";
  }

  XmlElement? focus = XmlUtils.getFirstChild(element);
  while (focus != null) {
    print(focus.name);
    String testTypeString = focus.name.toString();
    FunctionalTestType testType = getFunctionalTestType(testTypeString);
    for (XmlElement testCase in XmlUtils.getNamedChildren(focus, "case")) {
      String? testId = testCase.getAttribute("id");
      if (testId != null) {
        elements.add(TestCase('$testTypeString: $testId', testType, testCase));
      }
    }
    focus = XmlUtils.getNextSibling(focus);
  }
  for (final TestCase testCase in elements) {
    testXmlElement(testCase);
  }
}

enum FunctionalTestType {
  HISTORY,
  VALIDATION,
  DISPLAY_NAME_GENERATION,
  CONVERSION,
  DIVISION,
  MULTIPLICATION
}

class TestCase {
  final String testName;
  final FunctionalTestType testType;
  final XmlElement testCase;

  const TestCase(this.testName, this.testType, this.testCase);
}
