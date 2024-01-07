import 'package:test/test.dart';

import 'ucum_test_utils.dart';

void main() {
  group('Check computed dimension vectors', () {
    test("should return an empty problems array", () {
      final tUtil = UcumTestUtils();
      final problems = tUtil.checkAllDimensions();
      final pLen = problems.length;
      if (pLen > 0) {
        print('PROBLEMS:');
        for (var p = 0; p < pLen; p++) {
          // print('$p. ${problems[p]}');
        }
      }
      expect(problems.length, equals(0));
    });
  });
}
