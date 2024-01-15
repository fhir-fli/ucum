library org.fhir.ucum;

import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

void main() {
  group('testAsInteger', () {
    String message = 'Failed to round trip the integer ';
    int MIN_VALUE = -2147483647;
    int MAX_VALUE = 2147483647;
    test('', () {
      expect(0, Decimal.fromInt(0).asInteger(), reason: message + '0');
      expect(1, Decimal.fromInt(1).asInteger(), reason: message + '1');
      expect(2, Decimal.fromInt(2).asInteger(), reason: message + '2');
      expect(64, Decimal.fromInt(64).asInteger(), reason: message + '64');
      expect(MAX_VALUE, Decimal.fromInt(MAX_VALUE).asInteger(),
          reason: '$message$MAX_VALUE');
      expect(-1, Decimal.fromInt(-1).asInteger(), reason: message + '-1');
      expect(-2, Decimal.fromInt(-2).asInteger(), reason: message + '-2');
      expect(-64, Decimal.fromInt(-64).asInteger(), reason: message + '-64');
      expect(MIN_VALUE, Decimal.fromInt(MIN_VALUE).asInteger(),
          reason: '$message$MIN_VALUE');
    });
  });

  group('testStringSupport', () {
    String message = 'decimal: ';
    test('decimal', () {
      expect('1', Decimal.fromString('1').toString(), reason: message);
      expect('1', Decimal.fromString('1e0').asDecimal(), reason: message);
      expect('0', Decimal.fromString('0').toString(), reason: message);
      expect('0', Decimal.fromString('-0').toString(), reason: message);
      expect('0', Decimal.fromString('0e0').asDecimal(), reason: message);
      expect('10', Decimal.fromString('10').toString(), reason: message);
      expect('10', Decimal.fromString('1.0e1').asDecimal(), reason: message);
      expect('99', Decimal.fromString('99').toString(), reason: message);
      expect('99', Decimal.fromString('9.9e1').asDecimal(), reason: message);
      expect('-1', Decimal.fromString('-1').toString(), reason: message);
      expect('-1', Decimal.fromString('-1e0').asDecimal(), reason: message);
      expect('-10', Decimal.fromString('-10').toString(), reason: message);
      expect('-10', Decimal.fromString('-1.0e1').asDecimal(), reason: message);
      expect('-99', Decimal.fromString('-99').toString(), reason: message);
      expect('-99', Decimal.fromString('-9.9e1').asDecimal(), reason: message);
      expect('1.1', Decimal.fromString('1.1').toString(), reason: message);
      expect('1.1', Decimal.fromString('1.1e0').asDecimal(), reason: message);
      expect('-1.1', Decimal.fromString('-1.1').toString(), reason: message);
      expect('-1.1', Decimal.fromString('-1.1e0').asDecimal(), reason: message);
      expect('11.1', Decimal.fromString('11.1').toString(), reason: message);
      expect('11.1', Decimal.fromString('1.11e1').asDecimal(), reason: message);
      expect('1.11', Decimal.fromString('1.11').toString(), reason: message);
      expect('1.11', Decimal.fromString('1.11e0').asDecimal(), reason: message);
      expect('1.111', Decimal.fromString('1.111').toString(), reason: message);
      expect('1.111', Decimal.fromString('1.111e0').asDecimal(),
          reason: message);
      expect('0.1', Decimal.fromString('0.1').toString(), reason: message);
      expect('0.1', Decimal.fromString('1e-1').asDecimal(), reason: message);
      expect('0.1', Decimal.fromString('00.1').toString(), reason: message);
      expect('0.1', Decimal.fromString('.1').toString(), reason: message);
      expect('1.0', Decimal.fromString('1.0').toString(), reason: message);
      expect('1.0', Decimal.fromString('1.0e0').asDecimal(), reason: message);
      expect('1.00', Decimal.fromString('1.00').toString(), reason: message);
      expect('1.00', Decimal.fromString('1.00e0').asDecimal(), reason: message);
      expect(
          '1.000000000000000000000000000000000000000',
          Decimal.fromString('1.000000000000000000000000000000000000000')
              .toString(),
          reason: message);
      expect(
          '1.000000000000000000000000000000000000000',
          Decimal.fromString('1.000000000000000000000000000000000000000e0')
              .asDecimal(),
          reason: message);
      expect('-11.1', Decimal.fromString('-11.1').toString(), reason: message);
      expect('-11.1', Decimal.fromString('-1.11e1').asDecimal(),
          reason: message);
      expect('-1.11', Decimal.fromString('-1.11').toString(), reason: message);
      expect('-1.11', Decimal.fromString('-1.11e0').asDecimal(),
          reason: message);
      expect('-1.111', Decimal.fromString('-1.111').toString(),
          reason: message);
      expect('-1.111', Decimal.fromString('-1.111e0').asDecimal(),
          reason: message);
      expect('-0.1', Decimal.fromString('-0.1').toString(), reason: message);
      expect('-0.1', Decimal.fromString('-1e-1').asDecimal(), reason: message);
      expect('-0.1', Decimal.fromString('-00.1').toString(), reason: message);
      expect('-0.1', Decimal.fromString('-.1').toString(), reason: message);
      expect('-1.0', Decimal.fromString('-1.0').toString(), reason: message);
      expect('-1.0', Decimal.fromString('-1.0e0').asDecimal(), reason: message);
      expect('-1.00', Decimal.fromString('-1.00').toString(), reason: message);
      expect('-1.00', Decimal.fromString('-1.00e0').asDecimal(),
          reason: message);
      expect(
          '-1.000000000000000000000000000000000000000',
          Decimal.fromString('-1.000000000000000000000000000000000000000')
              .toString(),
          reason: message);
      expect(
          '-1.000000000000000000000000000000000000000',
          Decimal.fromString('-1.000000000000000000000000000000000000000e0')
              .asDecimal(),
          reason: message);
      expect('0.0', Decimal.fromString('0.0').toString(), reason: message);
      expect('0.0', Decimal.fromString('0.0e0').asDecimal(), reason: message);
      expect('0.0000', Decimal.fromString('0.0000').toString(),
          reason: message);
      expect('0.0000', Decimal.fromString('0.0000e0').asDecimal(),
          reason: message);
      expect('0.100', Decimal.fromString('0.100').toString(), reason: message);
      expect('0.100', Decimal.fromString('1.00e-1').asDecimal(),
          reason: message);
      expect('100', Decimal.fromString('100').toString(), reason: message);
      expect('100', Decimal.fromString('1.00e2').asDecimal(), reason: message);
      expect('0.01', Decimal.fromString('0.01').toString(), reason: message);
      expect('0.01', Decimal.fromString('1e-2').asDecimal(), reason: message);
      expect('0.001', Decimal.fromString('0.001').toString(), reason: message);
      expect('0.001', Decimal.fromString('1e-3').asDecimal(), reason: message);
      expect('0.0001', Decimal.fromString('0.0001').toString(),
          reason: message);
      expect('0.0001', Decimal.fromString('1e-4').asDecimal(), reason: message);
      expect('0.0001', Decimal.fromString('00.0001').toString(),
          reason: message);
      expect('0.0001', Decimal.fromString('000.0001').toString(),
          reason: message);
      expect('-0.01', Decimal.fromString('-0.01').toString(), reason: message);
      expect('-0.01', Decimal.fromString('-1e-2').asDecimal(), reason: message);
      expect('10.01', Decimal.fromString('10.01').toString(), reason: message);
      expect('10.01', Decimal.fromString('1.001e1').asDecimal(),
          reason: message);
      expect('0.00001', Decimal.fromString('0.00001').toString(),
          reason: message);
      expect('0.00001', Decimal.fromString('1e-5').asDecimal(),
          reason: message);
      expect('0.000001', Decimal.fromString('0.000001').toString(),
          reason: message);
      expect('0.000001', Decimal.fromString('1e-6').asDecimal(),
          reason: message);
      expect('0.0000001', Decimal.fromString('0.0000001').toString(),
          reason: message);
      expect('0.0000001', Decimal.fromString('1e-7').asDecimal(),
          reason: message);
      expect('0.000000001', Decimal.fromString('0.000000001').toString(),
          reason: message);
      expect('0.000000001', Decimal.fromString('1e-9').asDecimal(),
          reason: message);
      expect('0.00000000001', Decimal.fromString('0.00000000001').toString(),
          reason: message);
      expect('0.00000000001', Decimal.fromString('1e-11').asDecimal(),
          reason: message);
      expect(
          '0.0000000000001', Decimal.fromString('0.0000000000001').toString(),
          reason: message);
      expect('0.0000000000001', Decimal.fromString('1e-13').asDecimal(),
          reason: message);
      expect('0.000000000000001',
          Decimal.fromString('0.000000000000001').toString(),
          reason: message);
      expect('0.000000000000001', Decimal.fromString('1e-15').asDecimal(),
          reason: message);
      expect('0.00000000000000001',
          Decimal.fromString('0.00000000000000001').toString(),
          reason: message);
      expect('0.00000000000000001', Decimal.fromString('1e-17').asDecimal(),
          reason: message);
      expect('10.1', Decimal.fromString('10.1').toString(), reason: message);
      expect('10.1', Decimal.fromString('1.01e1').asDecimal(), reason: message);
      expect('100.1', Decimal.fromString('100.1').toString(), reason: message);
      expect('100.1', Decimal.fromString('1.001e2').asDecimal(),
          reason: message);
      expect('1000.1', Decimal.fromString('1000.1').toString(),
          reason: message);
      expect('1000.1', Decimal.fromString('1.0001e3').asDecimal(),
          reason: message);
      expect('10000.1', Decimal.fromString('10000.1').toString(),
          reason: message);
      expect('10000.1', Decimal.fromString('1.00001e4').asDecimal(),
          reason: message);
      expect('100000.1', Decimal.fromString('100000.1').toString(),
          reason: message);
      expect('100000.1', Decimal.fromString('1.000001e5').asDecimal(),
          reason: message);
      expect('1000000.1', Decimal.fromString('1000000.1').toString(),
          reason: message);
      expect('1000000.1', Decimal.fromString('1.0000001e6').asDecimal(),
          reason: message);
      expect('10000000.1', Decimal.fromString('10000000.1').toString(),
          reason: message);
      expect('10000000.1', Decimal.fromString('1.00000001e7').asDecimal(),
          reason: message);
      expect('100000000.1', Decimal.fromString('100000000.1').toString(),
          reason: message);
      expect('100000000.1', Decimal.fromString('1.000000001e8').asDecimal(),
          reason: message);
      expect('1000000000.1', Decimal.fromString('1000000000.1').toString(),
          reason: message);
      expect('1000000000.1', Decimal.fromString('1.0000000001e9').asDecimal(),
          reason: message);
      expect('10000000000.1', Decimal.fromString('10000000000.1').toString(),
          reason: message);
      expect(
          '10000000000.1', Decimal.fromString('1.00000000001e10').asDecimal(),
          reason: message);
      expect('100000000000.1', Decimal.fromString('100000000000.1').toString(),
          reason: message);
      expect(
          '100000000000.1', Decimal.fromString('1.000000000001e11').asDecimal(),
          reason: message);
      expect(
          '1000000000000.1', Decimal.fromString('1000000000000.1').toString(),
          reason: message);
      expect('1000000000000.1',
          Decimal.fromString('1.0000000000001e12').asDecimal(),
          reason: message);
      expect(
          '10000000000000.1', Decimal.fromString('10000000000000.1').toString(),
          reason: message);
      expect('10000000000000.1',
          Decimal.fromString('1.00000000000001e13').asDecimal(),
          reason: message);
      expect('100000000000000.1',
          Decimal.fromString('100000000000000.1').toString(),
          reason: message);
      expect('100000000000000.1',
          Decimal.fromString('1.000000000000001e14').asDecimal(),
          reason: message);
    });

    test('scientific', () {
      message = 'scientific: ';
      expect('1e0', Decimal.fromString('1').asScientific(), reason: message);
      expect('0e0', Decimal.fromString('0').asScientific(), reason: message);
      expect('0e0', Decimal.fromString('-0').asScientific(), reason: message);
      expect('1.0e1', Decimal.fromString('10').asScientific(), reason: message);
      expect('9.9e1', Decimal.fromString('99').asScientific(), reason: message);
      expect('-1e0', Decimal.fromString('-1').asScientific(), reason: message);
      expect('-1.0e1', Decimal.fromString('-10').asScientific(),
          reason: message);
      expect('-9.9e1', Decimal.fromString('-99').asScientific(),
          reason: message);
      expect('1.1e0', Decimal.fromString('1.1').asScientific(),
          reason: message);
      expect('-1.1e0', Decimal.fromString('-1.1').asScientific(),
          reason: message);
      expect('1.11e1', Decimal.fromString('11.1').asScientific(),
          reason: message);
      expect('1.11e0', Decimal.fromString('1.11').asScientific(),
          reason: message);
      expect('1.111e0', Decimal.fromString('1.111').asScientific(),
          reason: message);
      expect('1e-1', Decimal.fromString('0.1').asScientific(), reason: message);
      expect('1e-1', Decimal.fromString('00.1').asScientific(),
          reason: message);
      expect('1e-1', Decimal.fromString('.1').asScientific(), reason: message);
      expect('1.0e0', Decimal.fromString('1.0').asScientific(),
          reason: message);
      expect('1.00e0', Decimal.fromString('1.00').asScientific(),
          reason: message);
      expect(
          '1.000000000000000000000000000000000000000e0',
          Decimal.fromString('1.000000000000000000000000000000000000000')
              .asScientific(),
          reason: message);
      expect('-1.11e1', Decimal.fromString('-11.1').asScientific(),
          reason: message);
      expect('-1.11e0', Decimal.fromString('-1.11').asScientific(),
          reason: message);
      expect('-1.111e0', Decimal.fromString('-1.111').asScientific(),
          reason: message);
      expect('-1e-1', Decimal.fromString('-0.1').asScientific(),
          reason: message);
      expect('-1e-1', Decimal.fromString('-00.1').asScientific(),
          reason: message);
      expect('-1e-1', Decimal.fromString('-.1').asScientific(),
          reason: message);
      expect('-1.0e0', Decimal.fromString('-1.0').asScientific(),
          reason: message);
      expect('-1.00e0', Decimal.fromString('-1.00').asScientific(),
          reason: message);
      expect(
          '-1.000000000000000000000000000000000000000e0',
          Decimal.fromString('-1.000000000000000000000000000000000000000')
              .asScientific(),
          reason: message);
      expect('0.0e0', Decimal.fromString('0.0').asScientific(),
          reason: message);
      expect('0.0000e0', Decimal.fromString('0.0000').asScientific(),
          reason: message);
      expect('1.00e-1', Decimal.fromString('0.100').asScientific(),
          reason: message);
      expect('1.00e2', Decimal.fromString('100').asScientific(),
          reason: message);
      expect('1e-2', Decimal.fromString('0.01').asScientific(),
          reason: message);
      expect('1e-3', Decimal.fromString('0.001').asScientific(),
          reason: message);
      expect('1e-4', Decimal.fromString('0.0001').asScientific(),
          reason: message);
      expect('1e-4', Decimal.fromString('00.0001').asScientific(),
          reason: message);
      expect('1e-4', Decimal.fromString('000.0001').asScientific(),
          reason: message);
      expect('-1e-2', Decimal.fromString('-0.01').asScientific(),
          reason: message);
      expect('1.001e1', Decimal.fromString('10.01').asScientific(),
          reason: message);
      expect('1e-5', Decimal.fromString('0.00001').asScientific(),
          reason: message);
      expect('1e-6', Decimal.fromString('0.000001').asScientific(),
          reason: message);
      expect('1e-7', Decimal.fromString('0.0000001').asScientific(),
          reason: message);
      expect('1e-9', Decimal.fromString('0.000000001').asScientific(),
          reason: message);
      expect('1e-11', Decimal.fromString('0.00000000001').asScientific(),
          reason: message);
      expect('1e-13', Decimal.fromString('0.0000000000001').asScientific(),
          reason: message);
      expect('1e-15', Decimal.fromString('0.000000000000001').asScientific(),
          reason: message);
      expect('1e-17', Decimal.fromString('0.00000000000000001').asScientific(),
          reason: message);
      expect('1.01e1', Decimal.fromString('10.1').asScientific(),
          reason: message);
      expect('1.001e2', Decimal.fromString('100.1').asScientific(),
          reason: message);
      expect('1.0001e3', Decimal.fromString('1000.1').asScientific(),
          reason: message);
      expect('1.00001e4', Decimal.fromString('10000.1').asScientific(),
          reason: message);
      expect('1.000001e5', Decimal.fromString('100000.1').asScientific(),
          reason: message);
      expect('1.0000001e6', Decimal.fromString('1000000.1').asScientific(),
          reason: message);
      expect('1.00000001e7', Decimal.fromString('10000000.1').asScientific(),
          reason: message);
      expect('1.000000001e8', Decimal.fromString('100000000.1').asScientific(),
          reason: message);
      expect(
          '1.0000000001e9', Decimal.fromString('1000000000.1').asScientific(),
          reason: message);
      expect('1.00000000001e10',
          Decimal.fromString('10000000000.1').asScientific(),
          reason: message);
      expect('1.000000000001e11',
          Decimal.fromString('100000000000.1').asScientific(),
          reason: message);
      expect('1.0000000000001e12',
          Decimal.fromString('1000000000000.1').asScientific(),
          reason: message);
      expect('1.00000000000001e13',
          Decimal.fromString('10000000000000.1').asScientific(),
          reason: message);
      expect('1.000000000000001e14',
          Decimal.fromString('100000000000000.1').asScientific(),
          reason: message);
    });
  });

  group('testTruncate', () {
    String message = 'wrong trunc - ';
    test('trunc', () {
      expect('1', Decimal.fromString('1').trunc().asDecimal(), reason: message);
      expect('1', Decimal.fromString('1.01').trunc().asDecimal(),
          reason: message);
      expect('-1', Decimal.fromString('-1.01').trunc().asDecimal(),
          reason: message);
      expect('0', Decimal.fromString('0.01').trunc().asDecimal(),
          reason: message);
      expect('0', Decimal.fromString('-0.01').trunc().asDecimal(),
          reason: message);
      expect('0', Decimal.fromString('0.1').trunc().asDecimal(),
          reason: message);
      expect('0', Decimal.fromString('0.0001').trunc().asDecimal(),
          reason: message);
      expect(
          '100',
          Decimal.fromString('100.000000000000000000000000000000000000000001')
              .trunc()
              .asDecimal(),
          reason: message);
    });
  });

  group('testCompares', () {
    test('testCompares', () {
      int result = Decimal.fromString('1').comparesTo(Decimal.fromString('1'));
      String message = getCompareMessage('1', '1', 0, result);
      expect(0, result, reason: message);
      result = Decimal.fromString('0').comparesTo(Decimal.fromString('0'));
      message = getCompareMessage('0', '0', 0, result);
      expect(0, result, reason: message);
      result = Decimal.fromString('0').comparesTo(Decimal.fromString('1'));
      message = getCompareMessage('0', '1', -1, result);
      expect(-1, result, reason: message);
      result = Decimal.fromString('1').comparesTo(Decimal.fromString('0'));
      message = getCompareMessage('1', '0', 1, result);
      expect(1, result, reason: message);
      result = Decimal.fromString('10').comparesTo(Decimal.fromString('10'));
      message = getCompareMessage('10', '10', 0, result);
      expect(0, result, reason: message);
      result = Decimal.fromString('100').comparesTo(Decimal.fromString('100'));
      message = getCompareMessage('100', '100', 0, result);
      expect(0, result, reason: message);
      result = Decimal.fromString('0.1').comparesTo(Decimal.fromString('0.1'));
      message = getCompareMessage('0.1', '0.1', 0, result);
      expect(0, result, reason: message);
      result =
          Decimal.fromString('0.01').comparesTo(Decimal.fromString('0.01'));
      message = getCompareMessage('0.01', '0.01', 0, result);
      expect(0, result, reason: message);
      result =
          Decimal.fromString('0.01').comparesTo(Decimal.fromString('0.0100'));
      message = getCompareMessage('0.01', '0.0100', 0, result);
      expect(0, result, reason: message);
      result =
          Decimal.fromString('1').comparesTo(Decimal.fromString('1.00000000'));
      message = getCompareMessage('1', '1.00000000', 0, result);
      expect(0, result, reason: message);
      result = Decimal.fromString('1.111111')
          .comparesTo(Decimal.fromString('1.111111'));
      message = getCompareMessage('1.111111', '1.111111', 0, result);
      expect(0, result, reason: message);
    });
  });

  group('testAddition', () {
    test('testAddition', () {
      Decimal res = Decimal.fromString('1').add(Decimal.fromString('1'));
      print(res);
      String message = getAddSubMessage('1', '1', '2', '+', res);
      expect('2', res.asDecimal(), reason: message);
      res = Decimal.fromString('0').add(Decimal.fromString('1'));
      message = getAddSubMessage('0', '1', '1', '+', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('0').add(Decimal.fromString('0'));
      message = getAddSubMessage('0', '0', '0', '+', res);
      expect('0', res.asDecimal(), reason: message);
      res = Decimal.fromString('5').add(Decimal.fromString('5'));
      message = getAddSubMessage('5', '5', '10', '+', res);
      expect('10', res.asDecimal(), reason: message);
      res = Decimal.fromString('10').add(Decimal.fromString('1'));
      message = getAddSubMessage('10', '1', '11', '+', res);
      expect('11', res.asDecimal(), reason: message);
      res = Decimal.fromString('11').add(Decimal.fromString('12'));
      message = getAddSubMessage('11', '12', '23', '+', res);
      expect('23', res.asDecimal(), reason: message);
      res = Decimal.fromString('15').add(Decimal.fromString('16'));
      message = getAddSubMessage('15', '16', '31', '+', res);
      expect('31', res.asDecimal(), reason: message);
      res = Decimal.fromString('150').add(Decimal.fromString('160'));
      message = getAddSubMessage('150', '160', '310', '+', res);
      expect('310', res.asDecimal(), reason: message);
      res = Decimal.fromString('153').add(Decimal.fromString('168'));
      message = getAddSubMessage('153', '168', '321', '+', res);
      expect('321', res.asDecimal(), reason: message);
      res = Decimal.fromString('15300000000000000000000000000000000001')
          .add(Decimal.fromString('1680'));
      message = getAddSubMessage('\'15300000000000000000000000000000000001',
          '1680', '15300000000000000000000000000000001681', '+', res);
      expect('15300000000000000000000000000000001681', res.asDecimal(),
          reason: message);
      res = Decimal.fromString('1').add(Decimal.fromString('.1'));
      message = getAddSubMessage('1', '.1', '1.1', '+', res);
      expect('1.1', res.asDecimal(), reason: message);
      res = Decimal.fromString('1').add(Decimal.fromString('.001'));
      message = getAddSubMessage('1', '.001', '1.001', '+', res);
      expect('1.001', res.asDecimal(), reason: message);
      res = Decimal.fromString('.1').add(Decimal.fromString('.1'));
      message = getAddSubMessage('.1', '.1', '0.2', '+', res);
      expect('0.2', res.asDecimal(), reason: message);
      res = Decimal.fromString('.1').add(Decimal.fromString('.01'));
      message = getAddSubMessage('.1', '.01', '0.11', '+', res);
      expect('0.11', res.asDecimal(), reason: message);
      res = Decimal.fromString('5').add(Decimal.fromString('6'));
      message = getAddSubMessage('5', '6', '11', '+', res);
      expect('11', res.asDecimal(), reason: message);
      res = Decimal.fromString('5').add(Decimal.fromString('-6'));
      message = getAddSubMessage('5', '-6', '-1', '+', res);
      expect('-1', res.asDecimal(), reason: message);
      res = Decimal.fromString('-5').add(Decimal.fromString('6'));
      message = getAddSubMessage('-5', '6', '1', '+', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('-5').add(Decimal.fromString('-6'));
      message = getAddSubMessage('-5', '-6', '-11', '+', res);
      expect('-11', res.asDecimal(), reason: message);
      res = Decimal.fromString('2').add(Decimal.fromString('0.001'));
      message = getAddSubMessage('2', '0.001', '2.001', '+', res);
      expect('2.001', res.asDecimal(), reason: message);
      res = Decimal.fromString('2.0').add(Decimal.fromString('0.001'));
      message = getAddSubMessage('2.0', '0.001', '2.001', '+', res);
      expect('2.001', res.asDecimal(), reason: message);
    });
  });

  group('testSubtract', () {
    test('testSubtract', () {
      Decimal res = Decimal.fromString('2').subtract(Decimal.fromString('1'));
      String message = getAddSubMessage('2', '1', '1', '-', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('2').subtract(Decimal.fromString('0'));
      message = getAddSubMessage('2', '0', '2', '-', res);
      expect('2', res.asDecimal(), reason: message);
      res = Decimal.fromString('0').subtract(Decimal.fromString('0'));
      message = getAddSubMessage('0', '0', '0', '-', res);
      expect('0', res.asDecimal(), reason: message);
      res = Decimal.fromString('0').subtract(Decimal.fromString('2'));
      message = getAddSubMessage('0', '2', '-2', '-', res);
      expect('-2', res.asDecimal(), reason: message);
      res = Decimal.fromString('2').subtract(Decimal.fromString('2'));
      message = getAddSubMessage('2', '2', '0', '-', res);
      expect('0', res.asDecimal(), reason: message);
      res = Decimal.fromString('1').subtract(Decimal.fromString('2'));
      message = getAddSubMessage('1', '2', '-1', '-', res);
      expect('-1', res.asDecimal(), reason: message);
      res = Decimal.fromString('20').subtract(Decimal.fromString('1'));
      message = getAddSubMessage('20', '1', '19', '-', res);
      expect('19', res.asDecimal(), reason: message);
      res = Decimal.fromString('2').subtract(Decimal.fromString('.1'));
      message = getAddSubMessage('2', '.1', '1.9', '-', res);
      expect('1.9', res.asDecimal(), reason: message);
      res = Decimal.fromString('2').subtract(Decimal.fromString('.000001'));
      message = getAddSubMessage('2', '.000001', '1.999999', '-', res);
      expect('1.999999', res.asDecimal(), reason: message);
      res = Decimal.fromString('2').subtract(Decimal.fromString('2.000001'));
      message = getAddSubMessage('2', '2.000001', '-0.000001', '-', res);
      expect('-0.000001', res.asDecimal(), reason: message);
      res = Decimal.fromString('3.5').subtract(Decimal.fromString('35.5'));
      message = getAddSubMessage('3.5', '35.5', '-32.0', '-', res);
      expect('-32.0', res.asDecimal(), reason: message);
      res = Decimal.fromString('5').subtract(Decimal.fromString('6'));
      message = getAddSubMessage('5', '6', '-1', '-', res);
      expect('-1', res.asDecimal(), reason: message);
      res = Decimal.fromString('6').subtract(Decimal.fromString('5'));
      message = getAddSubMessage('6', '5', '1', '-', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('5').subtract(Decimal.fromString('-6'));
      message = getAddSubMessage('5', '-6', '11', '-', res);
      expect('11', res.asDecimal(), reason: message);
      res = Decimal.fromString('6').subtract(Decimal.fromString('-5'));
      message = getAddSubMessage('6', '-5', '11', '-', res);
      expect('11', res.asDecimal(), reason: message);
      res = Decimal.fromString('-5').subtract(Decimal.fromString('6'));
      message = getAddSubMessage('-5', '6', '-11', '-', res);
      expect('-11', res.asDecimal(), reason: message);
      res = Decimal.fromString('-6').subtract(Decimal.fromString('5'));
      message = getAddSubMessage('-6', '5', '-11', '-', res);
      expect('-11', res.asDecimal(), reason: message);
      res = Decimal.fromString('-5').subtract(Decimal.fromString('-6'));
      message = getAddSubMessage('-5', '-6', '1', '-', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('-6').subtract(Decimal.fromString('-5'));
      message = getAddSubMessage('-6', '-5', '-1', '-', res);
      expect('-1', res.asDecimal(), reason: message);
    });
  });

  group('testMultiply', () {
    test('testMultiply', () {
      Decimal res = Decimal.fromString('2').multiply(Decimal.fromString('2'));
      String message = getAddSubMessage('2', '2', '4', '*', res);
      expect('4', res.asDecimal(), reason: message);
      res = Decimal.fromString('2').multiply(Decimal.fromString('0.5'));
      message = getAddSubMessage('2', '0.5', '1', '*', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('0').multiply(Decimal.fromString('0'));
      message = getAddSubMessage('0', '0', '0', '*', res);
      expect('0', res.asDecimal(), reason: message);
      res = Decimal.fromString('0').multiply(Decimal.fromString('1'));
      message = getAddSubMessage('0', '1', '0', '*', res);
      expect('0', res.asDecimal(), reason: message);
      res = Decimal.fromString('4').multiply(Decimal.fromString('4'));
      message = getAddSubMessage('4', '4', '16', '*', res);
      expect('16', res.asDecimal(), reason: message);
      res = Decimal.fromString('20').multiply(Decimal.fromString('20'));
      message = getAddSubMessage('20', '20', '400', '*', res);
      expect('400', res.asDecimal(), reason: message);
      res = Decimal.fromString('200').multiply(Decimal.fromString('20'));
      message = getAddSubMessage('200', '20', '4000', '*', res);
      expect('4000', res.asDecimal(), reason: message);
      res = Decimal.fromString('400').multiply(Decimal.fromString('400'));
      message = getAddSubMessage('400', '400', '160000', '*', res);
      expect('160000', res.asDecimal(), reason: message);
      res = Decimal.fromString('2.0').multiply(Decimal.fromString('2.0'));
      message = getAddSubMessage('2.0', '2.0', '4.0', '*', res);
      expect('4.0', res.asDecimal(), reason: message);
      res = Decimal.fromString('2.00').multiply(Decimal.fromString('2.0'));
      message = getAddSubMessage('2.00', '2.0', '4.0', '*', res);
      expect('4.0', res.asDecimal(), reason: message);
      res = Decimal.fromString('2.0').multiply(Decimal.fromString('0.2'));
      message = getAddSubMessage('2.0', '0.2', '0.4', '*', res);
      expect('0.4', res.asDecimal(), reason: message);
      res = Decimal.fromString('2.0').multiply(Decimal.fromString('0.20'));
      message = getAddSubMessage('2.0', '0.20', '0.40', '*', res);
      expect('0.40', res.asDecimal(), reason: message);
      res = Decimal.fromString('13').multiply(Decimal.fromString('13'));
      message = getAddSubMessage('13', '13', '169', '*', res);
      expect('169', res.asDecimal(), reason: message);
      res = Decimal.fromString('12').multiply(Decimal.fromString('89'));
      message = getAddSubMessage('12', '89', '1068', '*', res);
      expect('1068', res.asDecimal(), reason: message);
      res = Decimal.fromString('1234').multiply(Decimal.fromString('6789'));
      message = getAddSubMessage('1234', '6789', '8377626', '*', res);
      expect('8377626', res.asDecimal(), reason: message);
      res = Decimal.fromString('10000').multiply(Decimal.fromString('0.0001'));
      message = getAddSubMessage('10000', '0.0001', '1', '*', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('10000').multiply(Decimal.fromString('0.00010'));
      message = getAddSubMessage('10000', '0.00010', '1.0', '*', res);
      expect('1.0', res.asDecimal(), reason: message);
      res =
          Decimal.fromString('10000').multiply(Decimal.fromString('0.000100'));
      message = getAddSubMessage('10000', '0.000100', '1.00', '*', res);
      expect('1.00', res.asDecimal(), reason: message);
      res =
          Decimal.fromString('10000').multiply(Decimal.fromString('0.0001000'));
      message = getAddSubMessage('10000', '0.0001000', '1.000', '*', res);
      expect('1.000', res.asDecimal(), reason: message);
      res = Decimal.fromString('10000')
          .multiply(Decimal.fromString('0.00010000'));
      message = getAddSubMessage('10000', '0.00010000', '1.0000', '*', res);
      expect('1.0000', res.asDecimal(), reason: message);
      res = Decimal.fromString('10000')
          .multiply(Decimal.fromString('0.000100000'));
      message = getAddSubMessage('10000', '0.000100000', '1.00000', '*', res);
      expect('1.00000', res.asDecimal(), reason: message);
      res = Decimal.fromString('10000.0')
          .multiply(Decimal.fromString('0.000100000'));
      message = getAddSubMessage('10000.0', '0.000100000', '1.00000', '*', res);
      expect('1.00000', res.asDecimal(), reason: message);
      res = Decimal.fromString('10000.0')
          .multiply(Decimal.fromString('0.0001000000'));
      message =
          getAddSubMessage('10000.0', '0.0001000000', '1.00000', '*', res);
      expect('1.00000', res.asDecimal(), reason: message);
      res = Decimal.fromString('10000.0')
          .multiply(Decimal.fromString('0.00010000000'));
      message =
          getAddSubMessage('10000.0', '0.00010000000', '1.00000', '*', res);
      expect('1.00000', res.asDecimal(), reason: message);
      res = Decimal.fromString('2').multiply(Decimal.fromString('-2'));
      message = getAddSubMessage('2', '-2', '-4', '*', res);
      expect('-4', res.asDecimal(), reason: message);
      res = Decimal.fromString('-2').multiply(Decimal.fromString('2'));
      message = getAddSubMessage('-2', '2', '-4', '*', res);
      expect('-4', res.asDecimal(), reason: message);
      res = Decimal.fromString('-2').multiply(Decimal.fromString('-2'));
      message = getAddSubMessage('-2', '-2', '4', '*', res);
      expect('4', res.asDecimal(), reason: message);
      res = Decimal.fromString('35328734682734')
          .multiply(Decimal.fromString('2349834295876423'));
      message = getAddSubMessage('35328734682734', '2349834295876423',
          '83016672387407213199375780482', '*', res);
      expect('83016672387407213199375780482', res.asDecimal(), reason: message);
      res = Decimal.fromString('35328734682734000000000')
          .multiply(Decimal.fromString('2349834295876423000000000'));
      message = getAddSubMessage(
          '35328734682734000000000',
          '2349834295876423000000000',
          '83016672387407213199375780482000000000000000000',
          '*',
          res);
      expect('83016672387407213199375780482000000000000000000', res.asDecimal(),
          reason: message);
      res = Decimal.fromString('3532873468.2734')
          .multiply(Decimal.fromString('23498342958.76423'));
      message = getAddSubMessage('3532873468.2734', '23498342958.76423',
          '83016672387407213199.375780482', '*', res);
      expect('83016672387407213199.375780482', res.asDecimal(),
          reason: message);
    });
  });

  group('testDivide', () {
    test('Decimal Divide', () {
      Decimal res = Decimal.fromString('500').divide(Decimal.fromString('4'));
      String message = getAddSubMessage('500', '4', '125', '/', res);
      expect('125', res.asDecimal(), reason: message);
      res = Decimal.fromString('1260257').divide(Decimal.fromString('37'));
      message = getAddSubMessage('1260257', '37', '34061', '/', res);
      expect('34061', res.asDecimal(), reason: message);
      res = Decimal.fromString('127').divide(Decimal.fromString('4'));
      message = getAddSubMessage('127', '4', '31.75', '/', res);
      expect('31.75', res.asDecimal(), reason: message);
      res = Decimal.fromString('10').divide(Decimal.fromString('10'));
      message = getAddSubMessage('10', '10', '1', '/', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('1').divide(Decimal.fromString('1'));
      message = getAddSubMessage('1', '1', '1', '/', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('10').divide(Decimal.fromString('3'));
      message = getAddSubMessage('10', '3', '3.3', '/', res);
      expect('3.3', res.asDecimal(), reason: message);
      res = Decimal.fromString('10.0').divide(Decimal.fromString('3'));
      message = getAddSubMessage('10.0', '3', '3.33', '/', res);
      expect('3.33', res.asDecimal(), reason: message);
      res = Decimal.fromString('10.00').divide(Decimal.fromString('3'));
      message = getAddSubMessage('10.00', '3', '3.333', '/', res);
      expect('3.333', res.asDecimal(), reason: message);
      res = Decimal.fromString('10.00').divide(Decimal.fromString('3.0'));
      message = getAddSubMessage('10.00', '3.0', '3.3', '/', res);
      expect('3.3', res.asDecimal(), reason: message);
      res = Decimal.fromString('100').divide(Decimal.fromString('1'));
      message = getAddSubMessage('100', '1', '100', '/', res);
      expect('100', res.asDecimal(), reason: message);
      res = Decimal.fromString('1000').divide(Decimal.fromString('10'));
      message = getAddSubMessage('1000', '10', '100', '/', res);
      expect('100', res.asDecimal(), reason: message);
      res = Decimal.fromString('100001').divide(Decimal.fromString('10'));
      message = getAddSubMessage('100001', '10', '10000.1', '/', res);
      expect('10000.1', res.asDecimal(), reason: message);
      res = Decimal.fromString('100').divide(Decimal.fromString('10'));
      message = getAddSubMessage('100', '10', '10', '/', res);
      expect('10', res.asDecimal(), reason: message);
      res = Decimal.fromString('1').divide(Decimal.fromString('10'));
      message = getAddSubMessage('1', '10', '0.1', '/', res);
      expect('0.1', res.asDecimal(), reason: message);
      res = Decimal.fromString('1').divide(Decimal.fromString('15'));
      message = getAddSubMessage('1', '15', '0.067', '/', res);
      expect('0.067', res.asDecimal(), reason: message);
      res = Decimal.fromString('1.0').divide(Decimal.fromString('15'));
      message = getAddSubMessage('1.0', '15', '0.067', '/', res);
      expect('0.067', res.asDecimal(), reason: message);
      res = Decimal.fromString('1.00').divide(Decimal.fromString('15.0'));
      message = getAddSubMessage('1.00', '15.0', '0.0667', '/', res);
      expect('0.0667', res.asDecimal(), reason: message);
      res = Decimal.fromString('1').divide(Decimal.fromString('0.1'));
      message = getAddSubMessage('1', '0.1', '10', '/', res);
      expect('10', res.asDecimal(), reason: message);
      res = Decimal.fromString('1').divide(Decimal.fromString('0.10'));
      message = getAddSubMessage('1', '0.10', '10', '/', res);
      expect('10', res.asDecimal(), reason: message);
      res = Decimal.fromString('1').divide(Decimal.fromString('0.010'));
      message = getAddSubMessage('1', '0.010', '100', '/', res);
      expect('100', res.asDecimal(), reason: message);
      res = Decimal.fromString('1').divide(Decimal.fromString('1.5'));
      message = getAddSubMessage('1', '1.5', '0.67', '/', res);
      expect('0.67', res.asDecimal(), reason: message);
      res = Decimal.fromString('1.0').divide(Decimal.fromString('1.5'));
      message = getAddSubMessage('1.0', '1.5', '0.67', '/', res);
      expect('0.67', res.asDecimal(), reason: message);
      res = Decimal.fromString('10').divide(Decimal.fromString('1.5'));
      message = getAddSubMessage('10', '1.5', '6.7', '/', res);
      expect('6.7', res.asDecimal(), reason: message);
      res = Decimal.fromString('-1').divide(Decimal.fromString('1'));
      message = getAddSubMessage('-1', '1', '-1', '/', res);
      expect('-1', res.asDecimal(), reason: message);
      res = Decimal.fromString('1').divide(Decimal.fromString('-1'));
      message = getAddSubMessage('1', '-1', '-1', '/', res);
      expect('-1', res.asDecimal(), reason: message);
      res = Decimal.fromString('-1').divide(Decimal.fromString('-1'));
      message = getAddSubMessage('-1', '-1', '1', '/', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('2').divide(Decimal.fromString('2'));
      message = getAddSubMessage('2', '2', '1', '/', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('20').divide(Decimal.fromString('2'));
      message = getAddSubMessage('20', '2', '10', '/', res);
      expect('10', res.asDecimal(), reason: message);
      res = Decimal.fromString('22').divide(Decimal.fromString('2'));
      message = getAddSubMessage('22', '2', '11', '/', res);
      expect('11', res.asDecimal(), reason: message);
      res = Decimal.fromString('83016672387407213199375780482')
          .divide(Decimal.fromString('2349834295876423'));
      message = getAddSubMessage('83016672387407213199375780482',
          '2349834295876423', '35328734682734', '/', res);
      expect('35328734682734', res.asDecimal(), reason: message);
      res =
          Decimal.fromString('83016672387407213199375780482000000000000000000')
              .divide(Decimal.fromString('2349834295876423000000000'));
      message = getAddSubMessage(
          '83016672387407213199375780482000000000000000000',
          '2349834295876423000000000',
          '35328734682734000000000',
          '/',
          res);
      expect('35328734682734000000000', res.asDecimal(), reason: message);
      res = Decimal.fromString('83016672387407213199.375780482')
          .divide(Decimal.fromString('23498342958.76423'));
      message = getAddSubMessage('83016672387407213199.375780482',
          '23498342958.76423', '3532873468.2734', '/', res);
      expect('3532873468.2734', res.asDecimal(), reason: message);
    });
    test('Integer Divide', () {
      Decimal res = Decimal.fromString('500').divInt(Decimal.fromString('4'));
      String message = getAddSubMessage('500', '4', '125', '/(int)', res);
      expect('125', res.asDecimal(), reason: message);
      res = Decimal.fromString('1260257').divInt(Decimal.fromString('37'));
      message = getAddSubMessage('1260257', '37', '34061', '/(int)', res);
      expect('34061', res.asDecimal(), reason: message);
      res = Decimal.fromString('127').divInt(Decimal.fromString('4'));
      message = getAddSubMessage('127', '4', '31', '/(int)', res);
      expect('31', res.asDecimal(), reason: message);
      res = Decimal.fromString('10').divInt(Decimal.fromString('10'));
      message = getAddSubMessage('10', '10', '1', '/(int)', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('1').divInt(Decimal.fromString('1'));
      message = getAddSubMessage('1', '1', '1', '/(int)', res);
      expect('1', res.asDecimal(), reason: message);
      res = Decimal.fromString('100').divInt(Decimal.fromString('1'));
      message = getAddSubMessage('100', '1', '100', '/(int)', res);
      expect('100', res.asDecimal(), reason: message);
      res = Decimal.fromString('1000').divInt(Decimal.fromString('10'));
      message = getAddSubMessage('1000', '10', '100', '/(int)', res);
      expect('100', res.asDecimal(), reason: message);
      res = Decimal.fromString('100001').divInt(Decimal.fromString('10'));
      message = getAddSubMessage('100001', '10', '10000', '/(int)', res);
      expect('10000', res.asDecimal(), reason: message);
      res = Decimal.fromString('1').divInt(Decimal.fromString('1.5'));
      message = getAddSubMessage('1', '1.5', '0', '/(int)', res);
      expect('0', res.asDecimal(), reason: message);
      res = Decimal.fromString('10').divInt(Decimal.fromString('1.5'));
      message = getAddSubMessage('10', '1.5', '6', '/(int)', res);
      expect('6', res.asDecimal(), reason: message);
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
      Decimal res = Decimal.fromString('10').modulo(Decimal.fromString('1'));
      String message = getAddSubMessage('10', '1', '0', '%', res);
      expect('0', res.asDecimal(), reason: message);
      res = Decimal.fromString('7').modulo(Decimal.fromString('4'));
      message = getAddSubMessage('7', '4', '3', '%%', res);
      expect('3', res.asDecimal(), reason: message);
    });
  });
}

void testRounding(String value, String expected) {
  Decimal dec = Decimal.fromString(value);
  dec.checkForCouldBeWholeNumber();
  expect(expected, dec.asDecimal());
}

String getCompareMessage(String v1, String v2, int outcome, int result) =>
    'Compare fail: $v1.compares($v2) should be $outcome but was $result';

String getAddSubMessage(
        String s1, String s2, String s3, String op, Decimal result) =>
    '$s1 $op $s2 = $s3, but the library returned ${result.asDecimal()}';
