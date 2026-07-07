/// Whether [code] denotes years — the calendar word forms or the definite
/// UCUM annum code `a`.
bool isYears(String code) => <String>[
      'years',
      'year',
      "'year'",
      'a',
    ].contains(code);

/// Whether [code] denotes months — the calendar word forms or the definite
/// UCUM code `mo`.
bool isMonths(String code) => <String>[
      'months',
      'month',
      "'month'",
      'mo',
    ].contains(code);

/// Whether [code] denotes weeks — the calendar word forms or the definite
/// UCUM code `wk`.
bool isWeeks(String code) => <String>[
      'weeks',
      'week',
      "'week'",
      'wk',
    ].contains(code);

/// Whether [code] denotes days — the calendar word forms or the definite
/// UCUM code `d`.
bool isDays(String code) => <String>[
      'days',
      'day',
      "'day'",
      'd',
    ].contains(code);

/// Whether [code] denotes hours — the calendar word forms or the definite
/// UCUM code `h`.
bool isHours(String code) => <String>[
      'hours',
      'hour',
      "'hour'",
      'h',
    ].contains(code);

/// Whether [code] denotes minutes — the calendar word forms or the definite
/// UCUM code `min`.
bool isMinutes(String code) => <String>[
      'minutes',
      'minute',
      "'minute'",
      'min',
    ].contains(code);

/// Whether [code] denotes seconds — the calendar word forms or the definite
/// UCUM code `s`.
bool isSeconds(String code) => <String>[
      'seconds',
      'second',
      "'second'",
      's',
    ].contains(code);

/// Whether [code] denotes milliseconds — the calendar word forms or the
/// definite UCUM code `ms`.
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

/// The quoted calendar-duration keywords (`'year'`, `'month'`, ...) as they
/// appear in FHIRPath/CQL literals, distinguishing calendar durations from
/// definite UCUM durations.
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
/// The definite-duration UCUM codes (`a`, `mo`, `wk`, `d`, `h`, `min`, `s`,
/// `ms`) whose lengths are fixed, as opposed to variable-length calendar
/// durations.
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
