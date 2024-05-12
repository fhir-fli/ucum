import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

void main() {
  group('testAsInteger', () {
    const String message = 'Failed to round trip the integer ';
    const int minValue = -2147483647;
    const int maxValue = 2147483647;
    test('', () {
      expect(0, UcumDecimal.fromInt(0).asInteger(), reason: '${message}0');
      expect(1, UcumDecimal.fromInt(1).asInteger(), reason: '${message}1');
      expect(2, UcumDecimal.fromInt(2).asInteger(), reason: '${message}2');
      expect(64, UcumDecimal.fromInt(64).asInteger(), reason: '${message}64');
      expect(maxValue, UcumDecimal.fromInt(maxValue).asInteger(),
          reason: '$message$maxValue');
      expect(-1, UcumDecimal.fromInt(-1).asInteger(), reason: '$message-1');
      expect(-2, UcumDecimal.fromInt(-2).asInteger(), reason: '$message-2');
      expect(-64, UcumDecimal.fromInt(-64).asInteger(), reason: '$message-64');
      expect(minValue, UcumDecimal.fromInt(minValue).asInteger(),
          reason: '$message$minValue');
    });
  });

  group('testStringSupport', () {
    String message = 'decimal: ';
    test('decimal', () {
      expect('1', UcumDecimal.fromString('1').toString(), reason: message);
      expect('1', UcumDecimal.fromString('1e0').asUcumDecimal(),
          reason: message);
      expect('0', UcumDecimal.fromString('0').toString(), reason: message);
      expect('0', UcumDecimal.fromString('-0').toString(), reason: message);
      expect('0', UcumDecimal.fromString('0e0').asUcumDecimal(),
          reason: message);
      expect('10', UcumDecimal.fromString('10').toString(), reason: message);
      expect('10', UcumDecimal.fromString('1.0e1').asUcumDecimal(),
          reason: message);
      expect('99', UcumDecimal.fromString('99').toString(), reason: message);
      expect('99', UcumDecimal.fromString('9.9e1').asUcumDecimal(),
          reason: message);
      expect('-1', UcumDecimal.fromString('-1').toString(), reason: message);
      expect('-1', UcumDecimal.fromString('-1e0').asUcumDecimal(),
          reason: message);
      expect('-10', UcumDecimal.fromString('-10').toString(), reason: message);
      expect('-10', UcumDecimal.fromString('-1.0e1').asUcumDecimal(),
          reason: message);
      expect('-99', UcumDecimal.fromString('-99').toString(), reason: message);
      expect('-99', UcumDecimal.fromString('-9.9e1').asUcumDecimal(),
          reason: message);
      expect('1.1', UcumDecimal.fromString('1.1').toString(), reason: message);
      expect('1.1', UcumDecimal.fromString('1.1e0').asUcumDecimal(),
          reason: message);
      expect('-1.1', UcumDecimal.fromString('-1.1').toString(),
          reason: message);
      expect('-1.1', UcumDecimal.fromString('-1.1e0').asUcumDecimal(),
          reason: message);
      expect('11.1', UcumDecimal.fromString('11.1').toString(),
          reason: message);
      expect('11.1', UcumDecimal.fromString('1.11e1').asUcumDecimal(),
          reason: message);
      expect('1.11', UcumDecimal.fromString('1.11').toString(),
          reason: message);
      expect('1.11', UcumDecimal.fromString('1.11e0').asUcumDecimal(),
          reason: message);
      expect('1.111', UcumDecimal.fromString('1.111').toString(),
          reason: message);
      expect('1.111', UcumDecimal.fromString('1.111e0').asUcumDecimal(),
          reason: message);
      expect('0.1', UcumDecimal.fromString('0.1').toString(), reason: message);
      expect('0.1', UcumDecimal.fromString('1e-1').asUcumDecimal(),
          reason: message);
      expect('0.1', UcumDecimal.fromString('00.1').toString(), reason: message);
      expect('0.1', UcumDecimal.fromString('.1').toString(), reason: message);
      expect('1.0', UcumDecimal.fromString('1.0').toString(), reason: message);
      expect('1.0', UcumDecimal.fromString('1.0e0').asUcumDecimal(),
          reason: message);
      expect('1.00', UcumDecimal.fromString('1.00').toString(),
          reason: message);
      expect('1.00', UcumDecimal.fromString('1.00e0').asUcumDecimal(),
          reason: message);
      expect(
          '1.000000000000000000000000000000000000000',
          UcumDecimal.fromString('1.000000000000000000000000000000000000000')
              .toString(),
          reason: message);
      expect(
          '1.000000000000000000000000000000000000000',
          UcumDecimal.fromString('1.000000000000000000000000000000000000000e0')
              .asUcumDecimal(),
          reason: message);
      expect('-11.1', UcumDecimal.fromString('-11.1').toString(),
          reason: message);
      expect('-11.1', UcumDecimal.fromString('-1.11e1').asUcumDecimal(),
          reason: message);
      expect('-1.11', UcumDecimal.fromString('-1.11').toString(),
          reason: message);
      expect('-1.11', UcumDecimal.fromString('-1.11e0').asUcumDecimal(),
          reason: message);
      expect('-1.111', UcumDecimal.fromString('-1.111').toString(),
          reason: message);
      expect('-1.111', UcumDecimal.fromString('-1.111e0').asUcumDecimal(),
          reason: message);
      expect('-0.1', UcumDecimal.fromString('-0.1').toString(),
          reason: message);
      expect('-0.1', UcumDecimal.fromString('-1e-1').asUcumDecimal(),
          reason: message);
      expect('-0.1', UcumDecimal.fromString('-00.1').toString(),
          reason: message);
      expect('-0.1', UcumDecimal.fromString('-.1').toString(), reason: message);
      expect('-1.0', UcumDecimal.fromString('-1.0').toString(),
          reason: message);
      expect('-1.0', UcumDecimal.fromString('-1.0e0').asUcumDecimal(),
          reason: message);
      expect('-1.00', UcumDecimal.fromString('-1.00').toString(),
          reason: message);
      expect('-1.00', UcumDecimal.fromString('-1.00e0').asUcumDecimal(),
          reason: message);
      expect(
          '-1.000000000000000000000000000000000000000',
          UcumDecimal.fromString('-1.000000000000000000000000000000000000000')
              .toString(),
          reason: message);
      expect(
          '-1.000000000000000000000000000000000000000',
          UcumDecimal.fromString('-1.000000000000000000000000000000000000000e0')
              .asUcumDecimal(),
          reason: message);
      expect('0.0', UcumDecimal.fromString('0.0').toString(), reason: message);
      expect('0.0', UcumDecimal.fromString('0.0e0').asUcumDecimal(),
          reason: message);
      expect('0.0000', UcumDecimal.fromString('0.0000').toString(),
          reason: message);
      expect('0.0000', UcumDecimal.fromString('0.0000e0').asUcumDecimal(),
          reason: message);
      expect('0.100', UcumDecimal.fromString('0.100').toString(),
          reason: message);
      expect('0.100', UcumDecimal.fromString('1.00e-1').asUcumDecimal(),
          reason: message);
      expect('100', UcumDecimal.fromString('100').toString(), reason: message);
      expect('100', UcumDecimal.fromString('1.00e2').asUcumDecimal(),
          reason: message);
      expect('0.01', UcumDecimal.fromString('0.01').toString(),
          reason: message);
      expect('0.01', UcumDecimal.fromString('1e-2').asUcumDecimal(),
          reason: message);
      expect('0.001', UcumDecimal.fromString('0.001').toString(),
          reason: message);
      expect('0.001', UcumDecimal.fromString('1e-3').asUcumDecimal(),
          reason: message);
      expect('0.0001', UcumDecimal.fromString('0.0001').toString(),
          reason: message);
      expect('0.0001', UcumDecimal.fromString('1e-4').asUcumDecimal(),
          reason: message);
      expect('0.0001', UcumDecimal.fromString('00.0001').toString(),
          reason: message);
      expect('0.0001', UcumDecimal.fromString('000.0001').toString(),
          reason: message);
      expect('-0.01', UcumDecimal.fromString('-0.01').toString(),
          reason: message);
      expect('-0.01', UcumDecimal.fromString('-1e-2').asUcumDecimal(),
          reason: message);
      expect('10.01', UcumDecimal.fromString('10.01').toString(),
          reason: message);
      expect('10.01', UcumDecimal.fromString('1.001e1').asUcumDecimal(),
          reason: message);
      expect('0.00001', UcumDecimal.fromString('0.00001').toString(),
          reason: message);
      expect('0.00001', UcumDecimal.fromString('1e-5').asUcumDecimal(),
          reason: message);
      expect('0.000001', UcumDecimal.fromString('0.000001').toString(),
          reason: message);
      expect('0.000001', UcumDecimal.fromString('1e-6').asUcumDecimal(),
          reason: message);
      expect('0.0000001', UcumDecimal.fromString('0.0000001').toString(),
          reason: message);
      expect('0.0000001', UcumDecimal.fromString('1e-7').asUcumDecimal(),
          reason: message);
      expect('0.000000001', UcumDecimal.fromString('0.000000001').toString(),
          reason: message);
      expect('0.000000001', UcumDecimal.fromString('1e-9').asUcumDecimal(),
          reason: message);
      expect(
          '0.00000000001', UcumDecimal.fromString('0.00000000001').toString(),
          reason: message);
      expect('0.00000000001', UcumDecimal.fromString('1e-11').asUcumDecimal(),
          reason: message);
      expect('0.0000000000001',
          UcumDecimal.fromString('0.0000000000001').toString(),
          reason: message);
      expect('0.0000000000001', UcumDecimal.fromString('1e-13').asUcumDecimal(),
          reason: message);
      expect('0.000000000000001',
          UcumDecimal.fromString('0.000000000000001').toString(),
          reason: message);
      expect(
          '0.000000000000001', UcumDecimal.fromString('1e-15').asUcumDecimal(),
          reason: message);
      expect('0.00000000000000001',
          UcumDecimal.fromString('0.00000000000000001').toString(),
          reason: message);
      expect('0.00000000000000001',
          UcumDecimal.fromString('1e-17').asUcumDecimal(),
          reason: message);
      expect('10.1', UcumDecimal.fromString('10.1').toString(),
          reason: message);
      expect('10.1', UcumDecimal.fromString('1.01e1').asUcumDecimal(),
          reason: message);
      expect('100.1', UcumDecimal.fromString('100.1').toString(),
          reason: message);
      expect('100.1', UcumDecimal.fromString('1.001e2').asUcumDecimal(),
          reason: message);
      expect('1000.1', UcumDecimal.fromString('1000.1').toString(),
          reason: message);
      expect('1000.1', UcumDecimal.fromString('1.0001e3').asUcumDecimal(),
          reason: message);
      expect('10000.1', UcumDecimal.fromString('10000.1').toString(),
          reason: message);
      expect('10000.1', UcumDecimal.fromString('1.00001e4').asUcumDecimal(),
          reason: message);
      expect('100000.1', UcumDecimal.fromString('100000.1').toString(),
          reason: message);
      expect('100000.1', UcumDecimal.fromString('1.000001e5').asUcumDecimal(),
          reason: message);
      expect('1000000.1', UcumDecimal.fromString('1000000.1').toString(),
          reason: message);
      expect('1000000.1', UcumDecimal.fromString('1.0000001e6').asUcumDecimal(),
          reason: message);
      expect('10000000.1', UcumDecimal.fromString('10000000.1').toString(),
          reason: message);
      expect(
          '10000000.1', UcumDecimal.fromString('1.00000001e7').asUcumDecimal(),
          reason: message);
      expect('100000000.1', UcumDecimal.fromString('100000000.1').toString(),
          reason: message);
      expect('100000000.1',
          UcumDecimal.fromString('1.000000001e8').asUcumDecimal(),
          reason: message);
      expect('1000000000.1', UcumDecimal.fromString('1000000000.1').toString(),
          reason: message);
      expect('1000000000.1',
          UcumDecimal.fromString('1.0000000001e9').asUcumDecimal(),
          reason: message);
      expect(
          '10000000000.1', UcumDecimal.fromString('10000000000.1').toString(),
          reason: message);
      expect('10000000000.1',
          UcumDecimal.fromString('1.00000000001e10').asUcumDecimal(),
          reason: message);
      expect(
          '100000000000.1', UcumDecimal.fromString('100000000000.1').toString(),
          reason: message);
      expect('100000000000.1',
          UcumDecimal.fromString('1.000000000001e11').asUcumDecimal(),
          reason: message);
      expect('1000000000000.1',
          UcumDecimal.fromString('1000000000000.1').toString(),
          reason: message);
      expect('1000000000000.1',
          UcumDecimal.fromString('1.0000000000001e12').asUcumDecimal(),
          reason: message);
      expect('10000000000000.1',
          UcumDecimal.fromString('10000000000000.1').toString(),
          reason: message);
      expect('10000000000000.1',
          UcumDecimal.fromString('1.00000000000001e13').asUcumDecimal(),
          reason: message);
      expect('100000000000000.1',
          UcumDecimal.fromString('100000000000000.1').toString(),
          reason: message);
      expect('100000000000000.1',
          UcumDecimal.fromString('1.000000000000001e14').asUcumDecimal(),
          reason: message);
    });

    test('scientific', () {
      message = 'scientific: ';
      expect('1e0', UcumDecimal.fromString('1').asScientific(),
          reason: message);
      expect('0e0', UcumDecimal.fromString('0').asScientific(),
          reason: message);
      expect('0e0', UcumDecimal.fromString('-0').asScientific(),
          reason: message);
      expect('1.0e1', UcumDecimal.fromString('10').asScientific(),
          reason: message);
      expect('9.9e1', UcumDecimal.fromString('99').asScientific(),
          reason: message);
      expect('-1e0', UcumDecimal.fromString('-1').asScientific(),
          reason: message);
      expect('-1.0e1', UcumDecimal.fromString('-10').asScientific(),
          reason: message);
      expect('-9.9e1', UcumDecimal.fromString('-99').asScientific(),
          reason: message);
      expect('1.1e0', UcumDecimal.fromString('1.1').asScientific(),
          reason: message);
      expect('-1.1e0', UcumDecimal.fromString('-1.1').asScientific(),
          reason: message);
      expect('1.11e1', UcumDecimal.fromString('11.1').asScientific(),
          reason: message);
      expect('1.11e0', UcumDecimal.fromString('1.11').asScientific(),
          reason: message);
      expect('1.111e0', UcumDecimal.fromString('1.111').asScientific(),
          reason: message);
      expect('1e-1', UcumDecimal.fromString('0.1').asScientific(),
          reason: message);
      expect('1e-1', UcumDecimal.fromString('00.1').asScientific(),
          reason: message);
      expect('1e-1', UcumDecimal.fromString('.1').asScientific(),
          reason: message);
      expect('1.0e0', UcumDecimal.fromString('1.0').asScientific(),
          reason: message);
      expect('1.00e0', UcumDecimal.fromString('1.00').asScientific(),
          reason: message);
      expect(
          '1.000000000000000000000000000000000000000e0',
          UcumDecimal.fromString('1.000000000000000000000000000000000000000')
              .asScientific(),
          reason: message);
      expect('-1.11e1', UcumDecimal.fromString('-11.1').asScientific(),
          reason: message);
      expect('-1.11e0', UcumDecimal.fromString('-1.11').asScientific(),
          reason: message);
      expect('-1.111e0', UcumDecimal.fromString('-1.111').asScientific(),
          reason: message);
      expect('-1e-1', UcumDecimal.fromString('-0.1').asScientific(),
          reason: message);
      expect('-1e-1', UcumDecimal.fromString('-00.1').asScientific(),
          reason: message);
      expect('-1e-1', UcumDecimal.fromString('-.1').asScientific(),
          reason: message);
      expect('-1.0e0', UcumDecimal.fromString('-1.0').asScientific(),
          reason: message);
      expect('-1.00e0', UcumDecimal.fromString('-1.00').asScientific(),
          reason: message);
      expect(
          '-1.000000000000000000000000000000000000000e0',
          UcumDecimal.fromString('-1.000000000000000000000000000000000000000')
              .asScientific(),
          reason: message);
      expect('0.0e0', UcumDecimal.fromString('0.0').asScientific(),
          reason: message);
      expect('0.0000e0', UcumDecimal.fromString('0.0000').asScientific(),
          reason: message);
      expect('1.00e-1', UcumDecimal.fromString('0.100').asScientific(),
          reason: message);
      expect('1.00e2', UcumDecimal.fromString('100').asScientific(),
          reason: message);
      expect('1e-2', UcumDecimal.fromString('0.01').asScientific(),
          reason: message);
      expect('1e-3', UcumDecimal.fromString('0.001').asScientific(),
          reason: message);
      expect('1e-4', UcumDecimal.fromString('0.0001').asScientific(),
          reason: message);
      expect('1e-4', UcumDecimal.fromString('00.0001').asScientific(),
          reason: message);
      expect('1e-4', UcumDecimal.fromString('000.0001').asScientific(),
          reason: message);
      expect('-1e-2', UcumDecimal.fromString('-0.01').asScientific(),
          reason: message);
      expect('1.001e1', UcumDecimal.fromString('10.01').asScientific(),
          reason: message);
      expect('1e-5', UcumDecimal.fromString('0.00001').asScientific(),
          reason: message);
      expect('1e-6', UcumDecimal.fromString('0.000001').asScientific(),
          reason: message);
      expect('1e-7', UcumDecimal.fromString('0.0000001').asScientific(),
          reason: message);
      expect('1e-9', UcumDecimal.fromString('0.000000001').asScientific(),
          reason: message);
      expect('1e-11', UcumDecimal.fromString('0.00000000001').asScientific(),
          reason: message);
      expect('1e-13', UcumDecimal.fromString('0.0000000000001').asScientific(),
          reason: message);
      expect(
          '1e-15', UcumDecimal.fromString('0.000000000000001').asScientific(),
          reason: message);
      expect(
          '1e-17', UcumDecimal.fromString('0.00000000000000001').asScientific(),
          reason: message);
      expect('1.01e1', UcumDecimal.fromString('10.1').asScientific(),
          reason: message);
      expect('1.001e2', UcumDecimal.fromString('100.1').asScientific(),
          reason: message);
      expect('1.0001e3', UcumDecimal.fromString('1000.1').asScientific(),
          reason: message);
      expect('1.00001e4', UcumDecimal.fromString('10000.1').asScientific(),
          reason: message);
      expect('1.000001e5', UcumDecimal.fromString('100000.1').asScientific(),
          reason: message);
      expect('1.0000001e6', UcumDecimal.fromString('1000000.1').asScientific(),
          reason: message);
      expect(
          '1.00000001e7', UcumDecimal.fromString('10000000.1').asScientific(),
          reason: message);
      expect(
          '1.000000001e8', UcumDecimal.fromString('100000000.1').asScientific(),
          reason: message);
      expect('1.0000000001e9',
          UcumDecimal.fromString('1000000000.1').asScientific(),
          reason: message);
      expect('1.00000000001e10',
          UcumDecimal.fromString('10000000000.1').asScientific(),
          reason: message);
      expect('1.000000000001e11',
          UcumDecimal.fromString('100000000000.1').asScientific(),
          reason: message);
      expect('1.0000000000001e12',
          UcumDecimal.fromString('1000000000000.1').asScientific(),
          reason: message);
      expect('1.00000000000001e13',
          UcumDecimal.fromString('10000000000000.1').asScientific(),
          reason: message);
      expect('1.000000000000001e14',
          UcumDecimal.fromString('100000000000000.1').asScientific(),
          reason: message);
    });
  });

  group('testTruncate', () {
    const String message = 'wrong trunc - ';
    test('trunc', () {
      expect('1', UcumDecimal.fromString('1').trunc().asUcumDecimal(),
          reason: message);
      expect('1', UcumDecimal.fromString('1.01').trunc().asUcumDecimal(),
          reason: message);
      expect('-1', UcumDecimal.fromString('-1.01').trunc().asUcumDecimal(),
          reason: message);
      expect('0', UcumDecimal.fromString('0.01').trunc().asUcumDecimal(),
          reason: message);
      expect('0', UcumDecimal.fromString('-0.01').trunc().asUcumDecimal(),
          reason: message);
      expect('0', UcumDecimal.fromString('0.1').trunc().asUcumDecimal(),
          reason: message);
      expect('0', UcumDecimal.fromString('0.0001').trunc().asUcumDecimal(),
          reason: message);
      expect(
          '100',
          UcumDecimal.fromString(
                  '100.000000000000000000000000000000000000000001')
              .trunc()
              .asUcumDecimal(),
          reason: message);
    });
  });

  group('testCompares', () {
    test('testCompares', () {
      int result =
          UcumDecimal.fromString('1').comparesTo(UcumDecimal.fromString('1'));
      String message = getCompareMessage('1', '1', 0, result);
      expect(0, result, reason: message);
      result =
          UcumDecimal.fromString('0').comparesTo(UcumDecimal.fromString('0'));
      message = getCompareMessage('0', '0', 0, result);
      expect(0, result, reason: message);
      result =
          UcumDecimal.fromString('0').comparesTo(UcumDecimal.fromString('1'));
      message = getCompareMessage('0', '1', -1, result);
      expect(-1, result, reason: message);
      result =
          UcumDecimal.fromString('1').comparesTo(UcumDecimal.fromString('0'));
      message = getCompareMessage('1', '0', 1, result);
      expect(1, result, reason: message);
      result =
          UcumDecimal.fromString('10').comparesTo(UcumDecimal.fromString('10'));
      message = getCompareMessage('10', '10', 0, result);
      expect(0, result, reason: message);
      result = UcumDecimal.fromString('100')
          .comparesTo(UcumDecimal.fromString('100'));
      message = getCompareMessage('100', '100', 0, result);
      expect(0, result, reason: message);
      result = UcumDecimal.fromString('0.1')
          .comparesTo(UcumDecimal.fromString('0.1'));
      message = getCompareMessage('0.1', '0.1', 0, result);
      expect(0, result, reason: message);
      result = UcumDecimal.fromString('0.01')
          .comparesTo(UcumDecimal.fromString('0.01'));
      message = getCompareMessage('0.01', '0.01', 0, result);
      expect(0, result, reason: message);
      result = UcumDecimal.fromString('0.01')
          .comparesTo(UcumDecimal.fromString('0.0100'));
      message = getCompareMessage('0.01', '0.0100', 0, result);
      expect(0, result, reason: message);
      result = UcumDecimal.fromString('1')
          .comparesTo(UcumDecimal.fromString('1.00000000'));
      message = getCompareMessage('1', '1.00000000', 0, result);
      expect(0, result, reason: message);
      result = UcumDecimal.fromString('1.111111')
          .comparesTo(UcumDecimal.fromString('1.111111'));
      message = getCompareMessage('1.111111', '1.111111', 0, result);
      expect(0, result, reason: message);
    });
  });

  group('testAddition', () {
    test('testAddition', () {
      UcumDecimal res =
          UcumDecimal.fromString('1').add(UcumDecimal.fromString('1'));
      String message = getAddSubMessage('1', '1', '2', '+', res);
      expect('2', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('0').add(UcumDecimal.fromString('1'));
      message = getAddSubMessage('0', '1', '1', '+', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('0').add(UcumDecimal.fromString('0'));
      message = getAddSubMessage('0', '0', '0', '+', res);
      expect('0', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('5').add(UcumDecimal.fromString('5'));
      message = getAddSubMessage('5', '5', '10', '+', res);
      expect('10', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10').add(UcumDecimal.fromString('1'));
      message = getAddSubMessage('10', '1', '11', '+', res);
      expect('11', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('11').add(UcumDecimal.fromString('12'));
      message = getAddSubMessage('11', '12', '23', '+', res);
      expect('23', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('15').add(UcumDecimal.fromString('16'));
      message = getAddSubMessage('15', '16', '31', '+', res);
      expect('31', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('150').add(UcumDecimal.fromString('160'));
      message = getAddSubMessage('150', '160', '310', '+', res);
      expect('310', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('153').add(UcumDecimal.fromString('168'));
      message = getAddSubMessage('153', '168', '321', '+', res);
      expect('321', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('15300000000000000000000000000000000001')
          .add(UcumDecimal.fromString('1680'));
      message = getAddSubMessage("'15300000000000000000000000000000000001",
          '1680', '15300000000000000000000000000000001681', '+', res);
      expect('15300000000000000000000000000000001681', res.asUcumDecimal(),
          reason: message);
      res = UcumDecimal.fromString('1').add(UcumDecimal.fromString('.1'));
      message = getAddSubMessage('1', '.1', '1.1', '+', res);
      expect('1.1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1').add(UcumDecimal.fromString('.001'));
      message = getAddSubMessage('1', '.001', '1.001', '+', res);
      expect('1.001', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('.1').add(UcumDecimal.fromString('.1'));
      message = getAddSubMessage('.1', '.1', '0.2', '+', res);
      expect('0.2', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('.1').add(UcumDecimal.fromString('.01'));
      message = getAddSubMessage('.1', '.01', '0.11', '+', res);
      expect('0.11', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('0.40').add(UcumDecimal.fromString('0.10'));
      message = getAddSubMessage('0.40', '0.10', '0.50', '+', res);
      res =
          UcumDecimal.fromString('0.040').add(UcumDecimal.fromString('0.010'));
      message = getAddSubMessage('0.040', '0.010', '0.050', '+', res);
      res = UcumDecimal.fromString('0.0040')
          .add(UcumDecimal.fromString('0.0010'));
      message = getAddSubMessage('0.0040', '0.0010', '0.0050', '+', res);
      res = UcumDecimal.fromString('0.00040')
          .add(UcumDecimal.fromString('0.00010'));
      message = getAddSubMessage('0.00040', '0.00010', '0.00050', '+', res);
      res = UcumDecimal.fromString('0.000040')
          .add(UcumDecimal.fromString('0.000010'));
      message = getAddSubMessage('0.000040', '0.000010', '0.000050', '+', res);
      res = UcumDecimal.fromString('5').add(UcumDecimal.fromString('6'));
      message = getAddSubMessage('5', '6', '11', '+', res);
      expect('11', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('5').add(UcumDecimal.fromString('-6'));
      message = getAddSubMessage('5', '-6', '-1', '+', res);
      expect('-1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('-5').add(UcumDecimal.fromString('6'));
      message = getAddSubMessage('-5', '6', '1', '+', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('-5').add(UcumDecimal.fromString('-6'));
      message = getAddSubMessage('-5', '-6', '-11', '+', res);
      expect('-11', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('2').add(UcumDecimal.fromString('0.001'));
      message = getAddSubMessage('2', '0.001', '2.001', '+', res);
      expect('2.001', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('2.0').add(UcumDecimal.fromString('0.001'));
      message = getAddSubMessage('2.0', '0.001', '2.001', '+', res);
      expect('2.001', res.asUcumDecimal(), reason: message);
    });
  });

  group('testSubtract', () {
    test('testSubtract', () {
      UcumDecimal res =
          UcumDecimal.fromString('2').subtract(UcumDecimal.fromString('1'));
      String message = getAddSubMessage('2', '1', '1', '-', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('2').subtract(UcumDecimal.fromString('0'));
      message = getAddSubMessage('2', '0', '2', '-', res);
      expect('2', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('0').subtract(UcumDecimal.fromString('0'));
      message = getAddSubMessage('0', '0', '0', '-', res);
      expect('0', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('0').subtract(UcumDecimal.fromString('2'));
      message = getAddSubMessage('0', '2', '-2', '-', res);
      expect('-2', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('2').subtract(UcumDecimal.fromString('2'));
      message = getAddSubMessage('2', '2', '0', '-', res);
      expect('0', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1').subtract(UcumDecimal.fromString('2'));
      message = getAddSubMessage('1', '2', '-1', '-', res);
      expect('-1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('20').subtract(UcumDecimal.fromString('1'));
      message = getAddSubMessage('20', '1', '19', '-', res);
      expect('19', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('2').subtract(UcumDecimal.fromString('.1'));
      message = getAddSubMessage('2', '.1', '1.9', '-', res);
      expect('1.9', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('2')
          .subtract(UcumDecimal.fromString('.000001'));
      message = getAddSubMessage('2', '.000001', '1.999999', '-', res);
      expect('1.999999', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('2')
          .subtract(UcumDecimal.fromString('2.000001'));
      message = getAddSubMessage('2', '2.000001', '-0.000001', '-', res);
      expect('-0.000001', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('3.5')
          .subtract(UcumDecimal.fromString('35.5'));
      message = getAddSubMessage('3.5', '35.5', '-32.0', '-', res);
      expect('-32.0', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('5').subtract(UcumDecimal.fromString('6'));
      message = getAddSubMessage('5', '6', '-1', '-', res);
      expect('-1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('6').subtract(UcumDecimal.fromString('5'));
      message = getAddSubMessage('6', '5', '1', '-', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('5').subtract(UcumDecimal.fromString('-6'));
      message = getAddSubMessage('5', '-6', '11', '-', res);
      expect('11', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('6').subtract(UcumDecimal.fromString('-5'));
      message = getAddSubMessage('6', '-5', '11', '-', res);
      expect('11', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('-5').subtract(UcumDecimal.fromString('6'));
      message = getAddSubMessage('-5', '6', '-11', '-', res);
      expect('-11', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('-6').subtract(UcumDecimal.fromString('5'));
      message = getAddSubMessage('-6', '5', '-11', '-', res);
      expect('-11', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('-5').subtract(UcumDecimal.fromString('-6'));
      message = getAddSubMessage('-5', '-6', '1', '-', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('-6').subtract(UcumDecimal.fromString('-5'));
      message = getAddSubMessage('-6', '-5', '-1', '-', res);
      expect('-1', res.asUcumDecimal(), reason: message);
    });
  });

  group('testMultiply', () {
    test('testMultiply', () {
      UcumDecimal res =
          UcumDecimal.fromString('2').multiply(UcumDecimal.fromString('2'));
      String message = getAddSubMessage('2', '2', '4', '*', res);
      expect('4', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('2').multiply(UcumDecimal.fromString('0.5'));
      message = getAddSubMessage('2', '0.5', '1', '*', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('0').multiply(UcumDecimal.fromString('0'));
      message = getAddSubMessage('0', '0', '0', '*', res);
      expect('0', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('0').multiply(UcumDecimal.fromString('1'));
      message = getAddSubMessage('0', '1', '0', '*', res);
      expect('0', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('4').multiply(UcumDecimal.fromString('4'));
      message = getAddSubMessage('4', '4', '16', '*', res);
      expect('16', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('20').multiply(UcumDecimal.fromString('20'));
      message = getAddSubMessage('20', '20', '400', '*', res);
      expect('400', res.asUcumDecimal(), reason: message);
      res =
          UcumDecimal.fromString('200').multiply(UcumDecimal.fromString('20'));
      message = getAddSubMessage('200', '20', '4000', '*', res);
      expect('4000', res.asUcumDecimal(), reason: message);
      res =
          UcumDecimal.fromString('400').multiply(UcumDecimal.fromString('400'));
      message = getAddSubMessage('400', '400', '160000', '*', res);
      expect('160000', res.asUcumDecimal(), reason: message);
      res =
          UcumDecimal.fromString('2.0').multiply(UcumDecimal.fromString('2.0'));
      message = getAddSubMessage('2.0', '2.0', '4.0', '*', res);
      expect('4.0', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('2.00')
          .multiply(UcumDecimal.fromString('2.0'));
      message = getAddSubMessage('2.00', '2.0', '4.0', '*', res);
      expect('4.0', res.asUcumDecimal(), reason: message);
      res =
          UcumDecimal.fromString('2.0').multiply(UcumDecimal.fromString('0.2'));
      message = getAddSubMessage('2.0', '0.2', '0.4', '*', res);
      expect('0.4', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('2.0')
          .multiply(UcumDecimal.fromString('0.20'));
      message = getAddSubMessage('2.0', '0.20', '0.40', '*', res);
      expect('0.40', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('13').multiply(UcumDecimal.fromString('13'));
      message = getAddSubMessage('13', '13', '169', '*', res);
      expect('169', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('12').multiply(UcumDecimal.fromString('89'));
      message = getAddSubMessage('12', '89', '1068', '*', res);
      expect('1068', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1234')
          .multiply(UcumDecimal.fromString('6789'));
      message = getAddSubMessage('1234', '6789', '8377626', '*', res);
      expect('8377626', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10000')
          .multiply(UcumDecimal.fromString('0.0001'));
      message = getAddSubMessage('10000', '0.0001', '1', '*', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10000')
          .multiply(UcumDecimal.fromString('0.00010'));
      message = getAddSubMessage('10000', '0.00010', '1.0', '*', res);
      expect('1.0', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10000')
          .multiply(UcumDecimal.fromString('0.000100'));
      message = getAddSubMessage('10000', '0.000100', '1.00', '*', res);
      expect('1.00', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10000')
          .multiply(UcumDecimal.fromString('0.0001000'));
      message = getAddSubMessage('10000', '0.0001000', '1.000', '*', res);
      expect('1.000', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10000')
          .multiply(UcumDecimal.fromString('0.00010000'));
      message = getAddSubMessage('10000', '0.00010000', '1.0000', '*', res);
      expect('1.0000', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10000')
          .multiply(UcumDecimal.fromString('0.000100000'));
      message = getAddSubMessage('10000', '0.000100000', '1.00000', '*', res);
      expect('1.00000', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10000.0')
          .multiply(UcumDecimal.fromString('0.000100000'));
      message = getAddSubMessage('10000.0', '0.000100000', '1.00000', '*', res);
      expect('1.00000', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10000.0')
          .multiply(UcumDecimal.fromString('0.0001000000'));
      message =
          getAddSubMessage('10000.0', '0.0001000000', '1.00000', '*', res);
      expect('1.00000', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10000.0')
          .multiply(UcumDecimal.fromString('0.00010000000'));
      message =
          getAddSubMessage('10000.0', '0.00010000000', '1.00000', '*', res);
      expect('1.00000', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('2').multiply(UcumDecimal.fromString('-2'));
      message = getAddSubMessage('2', '-2', '-4', '*', res);
      expect('-4', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('-2').multiply(UcumDecimal.fromString('2'));
      message = getAddSubMessage('-2', '2', '-4', '*', res);
      expect('-4', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('-2').multiply(UcumDecimal.fromString('-2'));
      message = getAddSubMessage('-2', '-2', '4', '*', res);
      expect('4', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('35328734682734')
          .multiply(UcumDecimal.fromString('2349834295876423'));
      message = getAddSubMessage('35328734682734', '2349834295876423',
          '83016672387407213199375780482', '*', res);
      expect('83016672387407213199375780482', res.asUcumDecimal(),
          reason: message);
      res = UcumDecimal.fromString('35328734682734000000000')
          .multiply(UcumDecimal.fromString('2349834295876423000000000'));
      message = getAddSubMessage(
          '35328734682734000000000',
          '2349834295876423000000000',
          '83016672387407213199375780482000000000000000000',
          '*',
          res);
      expect('83016672387407213199375780482000000000000000000',
          res.asUcumDecimal(),
          reason: message);
      res = UcumDecimal.fromString('3532873468.2734')
          .multiply(UcumDecimal.fromString('23498342958.76423'));
      message = getAddSubMessage('3532873468.2734', '23498342958.76423',
          '83016672387407213199.375780482', '*', res);
      expect('83016672387407213199.375780482', res.asUcumDecimal(),
          reason: message);
    });
  });

  group('testDivide', () {
    test('UcumDecimal Divide', () {
      UcumDecimal res =
          UcumDecimal.fromString('500').divide(UcumDecimal.fromString('4'));
      String message = getAddSubMessage('500', '4', '125', '/', res);
      expect('125', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1260257')
          .divide(UcumDecimal.fromString('37'));
      message = getAddSubMessage('1260257', '37', '34061', '/', res);
      expect('34061', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('127').divide(UcumDecimal.fromString('4'));
      message = getAddSubMessage('127', '4', '31.75', '/', res);
      expect('31.75', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10').divide(UcumDecimal.fromString('10'));
      message = getAddSubMessage('10', '10', '1', '/', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1').divide(UcumDecimal.fromString('1'));
      message = getAddSubMessage('1', '1', '1', '/', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10').divide(UcumDecimal.fromString('3'));
      message = getAddSubMessage('10', '3', '3.3', '/', res);
      expect('3.3', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10.0').divide(UcumDecimal.fromString('3'));
      message = getAddSubMessage('10.0', '3', '3.33', '/', res);
      expect('3.33', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10.00').divide(UcumDecimal.fromString('3'));
      message = getAddSubMessage('10.00', '3', '3.333', '/', res);
      expect('3.333', res.asUcumDecimal(), reason: message);
      res =
          UcumDecimal.fromString('10.00').divide(UcumDecimal.fromString('3.0'));
      message = getAddSubMessage('10.00', '3.0', '3.3', '/', res);
      expect('3.3', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('100').divide(UcumDecimal.fromString('1'));
      message = getAddSubMessage('100', '1', '100', '/', res);
      expect('100', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1000').divide(UcumDecimal.fromString('10'));
      message = getAddSubMessage('1000', '10', '100', '/', res);
      expect('100', res.asUcumDecimal(), reason: message);
      res =
          UcumDecimal.fromString('100001').divide(UcumDecimal.fromString('10'));
      message = getAddSubMessage('100001', '10', '10000.1', '/', res);
      expect('10000.1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('100').divide(UcumDecimal.fromString('10'));
      message = getAddSubMessage('100', '10', '10', '/', res);
      expect('10', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1').divide(UcumDecimal.fromString('10'));
      message = getAddSubMessage('1', '10', '0.1', '/', res);
      expect('0.1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1').divide(UcumDecimal.fromString('15'));
      message = getAddSubMessage('1', '15', '0.067', '/', res);
      expect('0.067', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1.0').divide(UcumDecimal.fromString('15'));
      message = getAddSubMessage('1.0', '15', '0.067', '/', res);
      expect('0.067', res.asUcumDecimal(), reason: message);
      res =
          UcumDecimal.fromString('1.00').divide(UcumDecimal.fromString('15.0'));
      message = getAddSubMessage('1.00', '15.0', '0.0667', '/', res);
      expect('0.0667', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1').divide(UcumDecimal.fromString('0.1'));
      message = getAddSubMessage('1', '0.1', '10', '/', res);
      expect('10', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1').divide(UcumDecimal.fromString('0.10'));
      message = getAddSubMessage('1', '0.10', '10', '/', res);
      expect('10', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1').divide(UcumDecimal.fromString('0.010'));
      message = getAddSubMessage('1', '0.010', '100', '/', res);
      expect('100', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1').divide(UcumDecimal.fromString('1.5'));
      message = getAddSubMessage('1', '1.5', '0.67', '/', res);
      expect('0.67', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1.0').divide(UcumDecimal.fromString('1.5'));
      message = getAddSubMessage('1.0', '1.5', '0.67', '/', res);
      expect('0.67', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10').divide(UcumDecimal.fromString('1.5'));
      message = getAddSubMessage('10', '1.5', '6.7', '/', res);
      expect('6.7', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('-1').divide(UcumDecimal.fromString('1'));
      message = getAddSubMessage('-1', '1', '-1', '/', res);
      expect('-1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1').divide(UcumDecimal.fromString('-1'));
      message = getAddSubMessage('1', '-1', '-1', '/', res);
      expect('-1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('-1').divide(UcumDecimal.fromString('-1'));
      message = getAddSubMessage('-1', '-1', '1', '/', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('2').divide(UcumDecimal.fromString('2'));
      message = getAddSubMessage('2', '2', '1', '/', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('20').divide(UcumDecimal.fromString('2'));
      message = getAddSubMessage('20', '2', '10', '/', res);
      expect('10', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('22').divide(UcumDecimal.fromString('2'));
      message = getAddSubMessage('22', '2', '11', '/', res);
      expect('11', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('83016672387407213199375780482')
          .divide(UcumDecimal.fromString('2349834295876423'));
      message = getAddSubMessage('83016672387407213199375780482',
          '2349834295876423', '35328734682734', '/', res);
      expect('35328734682734', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString(
              '83016672387407213199375780482000000000000000000')
          .divide(UcumDecimal.fromString('2349834295876423000000000'));
      message = getAddSubMessage(
          '83016672387407213199375780482000000000000000000',
          '2349834295876423000000000',
          '35328734682734000000000',
          '/',
          res);
      expect('35328734682734000000000', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('83016672387407213199.375780482')
          .divide(UcumDecimal.fromString('23498342958.76423'));
      message = getAddSubMessage('83016672387407213199.375780482',
          '23498342958.76423', '3532873468.2734', '/', res);
      expect('3532873468.2734', res.asUcumDecimal(), reason: message);
    });
    test('Integer Divide', () {
      UcumDecimal res =
          UcumDecimal.fromString('500').divInt(UcumDecimal.fromString('4'));
      String message = getAddSubMessage('500', '4', '125', '/(int)', res);
      expect('125', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1260257')
          .divInt(UcumDecimal.fromString('37'));
      message = getAddSubMessage('1260257', '37', '34061', '/(int)', res);
      expect('34061', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('127').divInt(UcumDecimal.fromString('4'));
      message = getAddSubMessage('127', '4', '31', '/(int)', res);
      expect('31', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10').divInt(UcumDecimal.fromString('10'));
      message = getAddSubMessage('10', '10', '1', '/(int)', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1').divInt(UcumDecimal.fromString('1'));
      message = getAddSubMessage('1', '1', '1', '/(int)', res);
      expect('1', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('100').divInt(UcumDecimal.fromString('1'));
      message = getAddSubMessage('100', '1', '100', '/(int)', res);
      expect('100', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1000').divInt(UcumDecimal.fromString('10'));
      message = getAddSubMessage('1000', '10', '100', '/(int)', res);
      expect('100', res.asUcumDecimal(), reason: message);
      res =
          UcumDecimal.fromString('100001').divInt(UcumDecimal.fromString('10'));
      message = getAddSubMessage('100001', '10', '10000', '/(int)', res);
      expect('10000', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('1').divInt(UcumDecimal.fromString('1.5'));
      message = getAddSubMessage('1', '1.5', '0', '/(int)', res);
      expect('0', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('10').divInt(UcumDecimal.fromString('1.5'));
      message = getAddSubMessage('10', '1.5', '6', '/(int)', res);
      expect('6', res.asUcumDecimal(), reason: message);
    });
  });

  group('test rounding', () {
    test('testWholeNumberRounding', () {
      testRounding('1', '1');
      testRounding('0', '0');
      testRounding('9', '9');

      testRounding('100', '100');
      testRounding('100.1', '100.1');
      testRounding('100.0000000000000000001', '100');
      testRounding('100.0000000000000000000', '100');
      testRounding('100.0000010000000000000', '100.000001');
      testRounding('100.0000000000000000010', '100.0000000000000000010');
      testRounding('100.0000010000000000100', '100.0000010000000000100');
      testRounding('100.0000010000000001000', '100.0000010000000001000');
      testRounding('100.0000010000000010000', '100.000001000000001');

      testRounding('99', '99');
      testRounding('99.9', '99.9');
      testRounding('199.9999999999999999999', '200');
      testRounding('199.9999999999999999991', '200');
      testRounding('167.9999999999999999991', '168');
      testRounding('166.9999919999999999999', '166.999992');
    });
  });

  group('testModulo', () {
    test('testModulo', () {
      UcumDecimal res =
          UcumDecimal.fromString('10').modulo(UcumDecimal.fromString('1'));
      String message = getAddSubMessage('10', '1', '0', '%', res);
      expect('0', res.asUcumDecimal(), reason: message);
      res = UcumDecimal.fromString('7').modulo(UcumDecimal.fromString('4'));
      message = getAddSubMessage('7', '4', '3', '%%', res);
      expect('3', res.asUcumDecimal(), reason: message);
    });
  });
}

void testRounding(String value, String expected) {
  final UcumDecimal dec = UcumDecimal.fromString(value);
  dec.checkForCouldBeWholeNumber();
  expect(expected, dec.asUcumDecimal());
}

String getCompareMessage(String v1, String v2, int outcome, int result) =>
    'Compare fail: $v1.compares($v2) should be $outcome but was $result';

String getAddSubMessage(
        String s1, String s2, String s3, String op, UcumDecimal result) =>
    '$s1 $op $s2 = $s3, but the library returned ${result.asUcumDecimal()}';
