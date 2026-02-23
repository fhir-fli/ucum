// ignore_for_file: avoid_print, unreachable_from_main

import 'dart:io';

import 'package:test/test.dart';
import 'package:ucum/ucum.dart';
import 'package:xml/xml.dart';

Future<void> main() async {
  final UcumServiceTest ucumServiceTest = UcumServiceTest();
  ucumServiceTest.beforeAll();

  void debug(String string) {
    print(string);
  }

  FunctionalTestType getFunctionalTestType(String typeString) {
    if (typeString == 'history') {
      return FunctionalTestType.HISTORY;
    } else if (typeString == 'validation') {
      return FunctionalTestType.VALIDATION;
    } else if (typeString == 'displayNameGeneration') {
      return FunctionalTestType.DISPLAY_NAME_GENERATION;
    } else if (typeString == 'conversion') {
      return FunctionalTestType.CONVERSION;
    } else if (typeString == 'multiplication') {
      return FunctionalTestType.MULTIPLICATION;
    } else if (typeString == 'division') {
      return FunctionalTestType.DIVISION;
    } else {
      throw Exception('unknown element name $typeString');
    }
  }

  void runMultiplicationCase(XmlElement x) {
    final String? id = x.getAttribute('id');
    final String? v1 = x.getAttribute('v1');
    final String? u1 = x.getAttribute('u1');
    final String? v2 = x.getAttribute('v2');
    final String? u2 = x.getAttribute('u2');
    final String? vRes = x.getAttribute('vRes');
    final String? uRes = x.getAttribute('uRes');

    final Pair? o1 = v1 != null && u1 != null
        ? Pair(value: UcumDecimal.fromString(v1), unit: u1)
        : null;
    final Pair? o2 = v2 != null && u2 != null
        ? Pair(value: UcumDecimal.fromString(v2), unit: u2)
        : null;
    if (o1 != null && o2 != null) {
      final Pair o3 = ucumServiceTest.ucumService.multiply(o1, o2);

      debug("Multiplication Test $id: the value '$v1$u1' * '$v2$u2 ==> "
          '${o3.value} ${o3.unit}');

      // if (!res.toPlainString().equals(outcome)) { - that assumes that we can get the precision right, which we can't
      if (o3.value.comparesTo(UcumDecimal.fromString(vRes)) != 0 ||
          o3.unit != uRes) {
        fail("Test $id : The value '$vRes $uRes' was expected, but the result "
            "was '${o3.value} ${o3.unit}'");
      }
    }
  }

  void runDivisionCase(XmlElement x) {
    final String? id = x.getAttribute('id');
    final String? v1 = x.getAttribute('v1');
    final String? u1 = x.getAttribute('u1');
    final String? v2 = x.getAttribute('v2');
    final String? u2 = x.getAttribute('u2');
    final String? vRes = x.getAttribute('vRes');
    final String? uRes = x.getAttribute('uRes');

    final Pair? o1 = v1 != null && u1 != null
        ? Pair(value: UcumDecimal.fromString(v1), unit: u1)
        : null;
    final Pair? o2 = v2 != null && u2 != null
        ? Pair(value: UcumDecimal.fromString(v2), unit: u2)
        : null;
    if (o1 != null && o2 != null) {
      final Pair o3 = ucumServiceTest.ucumService.divideBy(o1, o2);

      debug(
          "Division Test $id: the value '$v1 $u1' * '$v2 $u2' ==> '${o3.value} ${o3.unit}'");

      // if (!res.toPlainString().equals(outcome)) { - that assumes that we can get the precision right, which we can't
      if (o3.value.comparesTo(UcumDecimal.fromString(vRes)) != 0 ||
          o3.unit != uRes) {
        fail("Test $id : The value '$vRes $uRes' was expected, but the result "
            "was '${o3.value} ${o3.unit}'");
      }
    }
  }

  void runConversionCase(XmlElement x) {
    final String? id = x.getAttribute('id');
    final String? value = x.getAttribute('value');
    final String? srcUnit = x.getAttribute('srcUnit');
    final String? dstUnit = x.getAttribute('dstUnit');
    final String? outcome = x.getAttribute('outcome');
    if (value != null && srcUnit != null && dstUnit != null) {
      final UcumDecimal decimal = UcumDecimal.fromString(value);
      final UcumDecimal res =
          ucumServiceTest.ucumService.convert(decimal, srcUnit, dstUnit);
      // debug(
      //     "Convert Test $id: the value '$value $srcUnit' => '${res.toString()} $dstUnit'");

      // if (!res.toPlainString().equals(outcome)) { - that assumes that we can get the precision right, which we can't
      if (res.comparesTo(UcumDecimal.fromString(outcome)) != 0) {
        fail(
            "Test $id: The value '$outcome' was expected the result was '$res'");
      }
    } else {
      fail(
          'Test $id: The value: $value, srcUnit: $srcUnit, or dstUnit: $dstUnit, were null');
    }
  }

  void runDisplayNameGenerationCase(XmlElement x) {
    final String? id = x.getAttribute('id');
    final String? unit = x.getAttribute('unit');
    final String? display = x.getAttribute('display');

    if (unit != null) {
      final String res = ucumServiceTest.ucumService.analyse(unit);
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
    final String? id = x.getAttribute('id');
    final String? unit = x.getAttribute('unit');
    final bool valid = 'true' == x.getAttribute('valid');
    final String? reason = x.getAttribute('reason');

    if (unit != null) {
      final String? res = ucumServiceTest.ucumService.validate(unit);
      final bool result = res == null;
      if (result) {
        // debug(
        //     "Validation Test $id: the unit '$unit' is valid (reason: $reason)");
      } else {
        debug(
            "Validation Test $id: the unit is not valid because: '$res' (reason: $reason)");
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
          'Validation Test $id: the unit is not valid because it is null (reason: $reason)');
    }
  }

  void testXmlElement(TestCase testCase) {
    if (testCase.testType == FunctionalTestType.HISTORY) {
      // Test history element. Not a test. Do nothing.
    } else if (testCase.testType == FunctionalTestType.VALIDATION) {
      runValidationCase(testCase.testCase);
    } else if (testCase.testType ==
        FunctionalTestType.DISPLAY_NAME_GENERATION) {
      runDisplayNameGenerationCase(testCase.testCase);
    } else if (testCase.testType == FunctionalTestType.CONVERSION) {
      runConversionCase(testCase.testCase);
    } else if (testCase.testType == FunctionalTestType.MULTIPLICATION) {
      runMultiplicationCase(testCase.testCase);
    } else if (testCase.testType == FunctionalTestType.DIVISION) {
      runDivisionCase(testCase.testCase);
    } else {
      throw Exception('unknown test type ${testCase.testCase.name}');
    }
  }

  final List<TestCase> elements = <TestCase>[];
  final File tests = File('test/resources/UcumFunctionalTests.xml');
  final XmlDocument doc = await XmlUtils.parseDOM(tests);
  final XmlElement element = doc.rootElement;

  if (element.name.toString() != 'ucumTests') {
    throw Exception(
        "Unable to process XML document: expected 'ucumTests' but found "
        "'${element.name}'");
  }

  XmlElement? focus = XmlUtils.getFirstChild(element);
  while (focus != null) {
    final String testTypeString = focus.name.toString();
    final FunctionalTestType testType = getFunctionalTestType(testTypeString);
    for (final XmlElement testCase
        in XmlUtils.getNamedChildren(focus, 'case')) {
      final String? testId = testCase.getAttribute('id');
      if (testId != null) {
        elements.add(TestCase('$testTypeString: $testId', testType, testCase));
      }
    }
    focus = XmlUtils.getNextSibling(focus);
  }
  group('UCUM Functional Tests', () {
    for (final TestCase testCase in elements) {
      test(testCase.testName, () {
        testXmlElement(testCase);
      });
    }
  });
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

class UcumServiceTest {
  late UcumService ucumService;

  void beforeAll() {
    ucumService = UcumService();
  }
}
