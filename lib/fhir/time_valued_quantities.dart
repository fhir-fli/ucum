bool isYears(String code) => <String>[
      'years',
      'year',
      "'year'",
      'a',
    ].contains(code);

bool isMonths(String code) => <String>[
      'months',
      'month',
      "'month'",
      'mo',
    ].contains(code);

bool isWeeks(String code) => <String>[
      'weeks',
      'week',
      "'week'",
      'wk',
    ].contains(code);

bool isDays(String code) => <String>[
      'days',
      'day',
      "'day'",
      'd',
    ].contains(code);

bool isHours(String code) => <String>[
      'hours',
      'hour',
      "'hour'",
      'h',
    ].contains(code);

bool isMinutes(String code) => <String>[
      'minutes',
      'minute',
      "'minute'",
      'min',
    ].contains(code);

bool isSeconds(String code) => <String>[
      'seconds',
      'second',
      "'second'",
      's',
    ].contains(code);

bool isMilliseconds(String code) => <String>[
      'milliseconds',
      'millisecond',
      "'millisecond'",
      'ms',
    ].contains(code);

/// https://hl7.org/fhirpath/N1/#time-valued-quantities
const Set<String> timeValuedQuantities = <String>{
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

const Set<String> calendarUnitRepresentations = <String>{
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
const Set<String> definiteDurationUnits = <String>{
  'a',
  'mo',
  'wk',
  'd',
  'h',
  'min',
  's',
  'ms',
};
