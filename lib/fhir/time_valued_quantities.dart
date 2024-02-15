bool isYears(String code) => [
      'years',
      'year',
      "'year'",
      'a',
    ].contains(code);

bool isMonths(String code) => [
      'months',
      'month',
      "'month'",
      'mo',
    ].contains(code);

bool isWeeks(String code) => [
      'weeks',
      'week',
      "'week'",
      'wk',
    ].contains(code);

bool isDays(String code) => [
      'days',
      'day',
      "'day'",
      'd',
    ].contains(code);

bool isHours(String code) => [
      'hours',
      'hour',
      "'hour'",
      'h',
    ].contains(code);

bool isMinutes(String code) => [
      'minutes',
      'minute',
      "'minute'",
      'min',
    ].contains(code);

bool isSeconds(String code) => [
      'seconds',
      'second',
      "'second'",
      's',
    ].contains(code);

bool isMilliseconds(String code) => [
      'milliseconds',
      'millisecond',
      "'millisecond'",
      'ms',
    ].contains(code);

/// https://hl7.org/fhirpath/N1/#time-valued-quantities
const timeValuedQuantities = {
  'milliseconds',
  'millisecond',
  'seconds',
  'second',
  'minutes',
  'minute',
  'hours',
  'hour',
  'days',
  'day',
  'weeks',
  'week',
  'months',
  'month',
  'years',
  'year',
};

const calendarUnitRepresentations = {
  "'year'",
  "'month'",
  "'week'",
  "'day'",
  "'hour'",
  "'minute'",
  "'second'",
  "'millisecond'",
};

// https://www.hl7.org/fhir/fhirpath.html#quantity
const definiteDurationUnits = {
  'a',
  'mo',
  'wk',
  'd',
  'h',
  'min',
  // 's',
  // 'ms',
};
