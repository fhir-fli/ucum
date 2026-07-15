// ignore_for_file: avoid_print

import 'dart:io';

import 'package:test/test.dart';
import 'package:ucum/ucum.dart';
import 'package:xml/xml.dart';

import 'xml_utils.dart';

Future<void> main() async {
  final ucumServiceTest = UcumServiceTest()..beforeAll();

  void debug(String string) {
    print(string);
  }

  FunctionalTestType getFunctionalTestType(String typeString) {
    if (typeString == 'history') {
      return FunctionalTestType.history;
    } else if (typeString == 'validation') {
      return FunctionalTestType.validation;
    } else if (typeString == 'displayNameGeneration') {
      return FunctionalTestType.displayNameGeneration;
    } else if (typeString == 'conversion') {
      return FunctionalTestType.conversion;
    } else if (typeString == 'multiplication') {
      return FunctionalTestType.multiplication;
    } else if (typeString == 'division') {
      return FunctionalTestType.division;
    } else {
      throw Exception('unknown element name $typeString');
    }
  }

  void runMultiplicationCase(XmlElement x) {
    final id = x.getAttribute('id');
    final v1 = x.getAttribute('v1');
    final u1 = x.getAttribute('u1');
    final v2 = x.getAttribute('v2');
    final u2 = x.getAttribute('u2');
    final vRes = x.getAttribute('vRes');
    final uRes = x.getAttribute('uRes');

    final o1 = v1 != null && u1 != null
        ? Pair(value: UcumDecimal.fromString(v1), unit: u1)
        : null;
    final o2 = v2 != null && u2 != null
        ? Pair(value: UcumDecimal.fromString(v2), unit: u2)
        : null;
    if (o1 != null && o2 != null) {
      final o3 = ucumServiceTest.ucumService.multiply(o1, o2);

      debug("Multiplication Test $id: the value '$v1$u1' * '$v2$u2 ==> "
          '${o3.value} ${o3.unit}');

      // if (!res.toPlainString().equals(outcome)) { - that assumes that we
      // can get the precision right, which we can't
      if (o3.value.comparesTo(UcumDecimal.fromString(vRes)) != 0 ||
          o3.unit != uRes) {
        fail("Test $id : The value '$vRes $uRes' was expected, but the result "
            "was '${o3.value} ${o3.unit}'");
      }
    }
  }

  void runDivisionCase(XmlElement x) {
    final id = x.getAttribute('id');
    final v1 = x.getAttribute('v1');
    final u1 = x.getAttribute('u1');
    final v2 = x.getAttribute('v2');
    final u2 = x.getAttribute('u2');
    final vRes = x.getAttribute('vRes');
    final uRes = x.getAttribute('uRes');

    final o1 = v1 != null && u1 != null
        ? Pair(value: UcumDecimal.fromString(v1), unit: u1)
        : null;
    final o2 = v2 != null && u2 != null
        ? Pair(value: UcumDecimal.fromString(v2), unit: u2)
        : null;
    if (o1 != null && o2 != null) {
      final o3 = ucumServiceTest.ucumService.divideBy(o1, o2);

      debug(
        "Division Test $id: the value '$v1 $u1' * '$v2 $u2' ==> "
        "'${o3.value} ${o3.unit}'",
      );

      // if (!res.toPlainString().equals(outcome)) { - that assumes that we
      // can get the precision right, which we can't
      if (o3.value.comparesTo(UcumDecimal.fromString(vRes)) != 0 ||
          o3.unit != uRes) {
        fail("Test $id : The value '$vRes $uRes' was expected, but the result "
            "was '${o3.value} ${o3.unit}'");
      }
    }
  }

  void runConversionCase(XmlElement x) {
    final id = x.getAttribute('id');
    final value = x.getAttribute('value');
    final srcUnit = x.getAttribute('srcUnit');
    final dstUnit = x.getAttribute('dstUnit');
    final outcome = x.getAttribute('outcome');
    if (value != null && srcUnit != null && dstUnit != null) {
      final decimal = UcumDecimal.fromString(value);
      final res =
          ucumServiceTest.ucumService.convert(decimal, srcUnit, dstUnit);
      // debug(
      //     "Convert Test $id: the value '$value $srcUnit' => "
      //     "'${res.toString()} $dstUnit'");

      // if (!res.toPlainString().equals(outcome)) { - that assumes that we
      // can get the precision right, which we can't
      if (res.comparesTo(UcumDecimal.fromString(outcome)) != 0) {
        fail(
          "Test $id: The value '$outcome' was expected the result was "
          "'$res'",
        );
      }
    } else {
      fail(
        'Test $id: The value: $value, srcUnit: $srcUnit, or dstUnit: '
        '$dstUnit, were null',
      );
    }
  }

  void runDisplayNameGenerationCase(XmlElement x) {
    final id = x.getAttribute('id');
    final unit = x.getAttribute('unit');
    final display = x.getAttribute('display');

    if (unit != null) {
      final res = ucumServiceTest.ucumService.analyse(unit);
      debug("Analyse Test $id: the unit '$unit' => '$res'");

      if (res != display) {
        fail("Test $id: The unit '$unit' was expected to be displayed as "
            "'$display', but was displayed as '$res'");
      }
    } else {
      fail(
        'Test $id: The unit found was null, but was expected to be '
        "displayed as '$display'",
      );
    }
  }

  void runValidationCase(XmlElement x) {
    final id = x.getAttribute('id');
    final unit = x.getAttribute('unit');
    final valid = 'true' == x.getAttribute('valid');
    final reason = x.getAttribute('reason');

    if (unit != null) {
      final res = ucumServiceTest.ucumService.validate(unit);
      final result = res == null;
      if (result) {
        // debug(
        //     "Validation Test $id: the unit '$unit' is valid "
        //     "(reason: $reason)");
      } else {
        debug(
          "Validation Test $id: the unit is not valid because: '$res' "
          '(reason: $reason)',
        );
      }
      if (valid != result) {
        if (valid) {
          fail(
            "Unit $unit was expected to be valid, but was invalid ('$id') "
            '(reason: $reason)',
          );
        } else {
          fail(
            "Unit $unit was expected to be invalid, but was valid ('$id') "
            '(reason: $reason)',
          );
        }
      }
    } else {
      debug(
        'Validation Test $id: the unit is not valid because it is null '
        '(reason: $reason)',
      );
    }
  }

  void testXmlElement(TestCase testCase) {
    if (testCase.testType == FunctionalTestType.history) {
      // Test history element. Not a test. Do nothing.
    } else if (testCase.testType == FunctionalTestType.validation) {
      runValidationCase(testCase.testCase);
    } else if (testCase.testType == FunctionalTestType.displayNameGeneration) {
      runDisplayNameGenerationCase(testCase.testCase);
    } else if (testCase.testType == FunctionalTestType.conversion) {
      runConversionCase(testCase.testCase);
    } else if (testCase.testType == FunctionalTestType.multiplication) {
      runMultiplicationCase(testCase.testCase);
    } else if (testCase.testType == FunctionalTestType.division) {
      runDivisionCase(testCase.testCase);
    } else {
      throw Exception('unknown test type ${testCase.testCase.name}');
    }
  }

  final elements = <TestCase>[];
  final tests = File('test/resources/UcumFunctionalTests.xml');
  final doc = await XmlUtils.parseDOM(tests);
  final element = doc.rootElement;

  if (element.name.toString() != 'ucumTests') {
    throw Exception(
        "Unable to process XML document: expected 'ucumTests' but found "
        "'${element.name}'");
  }

  var focus = XmlUtils.getFirstChild(element);
  while (focus != null) {
    final testTypeString = focus.name.toString();
    final testType = getFunctionalTestType(testTypeString);
    for (final testCase in XmlUtils.getNamedChildren(focus, 'case')) {
      final testId = testCase.getAttribute('id');
      if (testId != null) {
        elements.add(TestCase('$testTypeString: $testId', testType, testCase));
      }
    }
    focus = XmlUtils.getNextSibling(focus);
  }
  group('UCUM Functional Tests', () {
    for (final testCase in elements) {
      test(testCase.testName, () {
        testXmlElement(testCase);
      });
    }
  });
}

enum FunctionalTestType {
  history,
  validation,
  displayNameGeneration,
  conversion,
  division,
  multiplication
}

class TestCase {
  const TestCase(this.testName, this.testType, this.testCase);
  final String testName;
  final FunctionalTestType testType;
  final XmlElement testCase;
}

class UcumServiceTest {
  late UcumService ucumService;

  void beforeAll() {
    ucumService = UcumService();
  }
}
