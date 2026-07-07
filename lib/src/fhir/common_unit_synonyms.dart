/// Curated map of common non-UCUM unit tokens to their UCUM codes, used by
/// [UcumService.resolveCommonUnit] (and through it, [ValidatedQuantity]).
///
/// This is the EXPLICIT leniency layer, following ucum-lhc's substitution
/// contract: strict validation stays spec-pure, and human-friendly input
/// ('mcg/mL', '4 hours', '1 inch') is resolved to valid UCUM with the
/// substitution visible to the caller, never silently inside the parser.
///
/// Rules for entries:
/// - Keys must be INVALID as strict UCUM on their own (never shadow a real
///   code — 'mg' or 'mo' must not appear here).
/// - Keys are matched case-insensitively on word boundaries, longest first.
/// - Values must be valid UCUM.
library;

/// Maps common non-UCUM unit spellings (keys) to their equivalent strict
/// UCUM codes (values). Keys are invalid as strict UCUM and are substituted
/// case-insensitively on word boundaries, longest key first, by
/// [UcumService.resolveCommonUnit].
const Map<String, String> commonUnitSynonyms = <String, String>{
  // Time words (FHIRPath calendar keywords resolve to the definite UCUM
  // duration codes; ValidatedQuantity's == keeps the calendar-vs-definite
  // distinction via the original unit string).
  'years': 'a',
  'year': 'a',
  'yrs': 'a',
  'yr': 'a',
  'months': 'mo',
  'month': 'mo',
  'mos': 'mo',
  'weeks': 'wk',
  'week': 'wk',
  'wks': 'wk',
  'days': 'd',
  'day': 'd',
  'hours': 'h',
  'hour': 'h',
  'hrs': 'h',
  'hr': 'h',
  'minutes': 'min',
  'minute': 'min',
  'mins': 'min',
  'seconds': 's',
  'second': 's',
  'secs': 's',
  'sec': 's',
  'milliseconds': 'ms',
  'millisecond': 'ms',

  // Metric spellings.
  'kilograms': 'kg',
  'kilogram': 'kg',
  'kilometers': 'km',
  'kilometer': 'km',
  'kilometres': 'km',
  'kilometre': 'km',
  'centimeters': 'cm',
  'centimeter': 'cm',
  'centimetres': 'cm',
  'centimetre': 'cm',
  'millimeters': 'mm',
  'millimeter': 'mm',
  'millimetres': 'mm',
  'millimetre': 'mm',
  'meters': 'm',
  'meter': 'm',
  'metres': 'm',
  'metre': 'm',
  'milligrams': 'mg',
  'milligram': 'mg',
  'micrograms': 'ug',
  'microgram': 'ug',
  'grams': 'g',
  'gram': 'g',
  'milliliters': 'mL',
  'milliliter': 'mL',
  'millilitres': 'mL',
  'millilitre': 'mL',
  'deciliters': 'dL',
  'deciliter': 'dL',
  'liters': 'L',
  'liter': 'L',
  'litres': 'L',
  'litre': 'L',
  'percent': '%',

  // Clinical shorthand.
  'mcg': 'ug', // 'micro' written 'mc' — the classic e-prescribing form
  'mcl': 'uL',
  'mcmol': 'umol',
  'cc': 'cm3',
  'bpm': '/min',
  'degc': 'Cel',
  'degf': '[degF]',

  // Imperial / US customary.
  'inches': '[in_i]',
  'inch': '[in_i]',
  'feet': '[ft_i]',
  'foot': '[ft_i]',
  'miles': '[mi_i]',
  'mile': '[mi_i]',
  // NOTE: 'mph' is deliberately absent — it is VALID UCUM (milli-phot, an
  // illuminance unit), and resolution never rewrites valid codes. Callers
  // meaning miles-per-hour must write '[mi_i]/h'.
  'pounds': '[lb_av]',
  'pound': '[lb_av]',
  'lbs': '[lb_av]',
  'lb': '[lb_av]',
  'ounces': '[oz_av]',
  'ounce': '[oz_av]',
  'oz': '[oz_av]',
  'gallons': '[gal_us]',
  'gallon': '[gal_us]',
  'quarts': '[qt_us]',
  'quart': '[qt_us]',
  'pints': '[pt_us]',
  'pint': '[pt_us]',
  'tablespoons': '[tbs_us]',
  'tablespoon': '[tbs_us]',
  'teaspoons': '[tsp_us]',
  'teaspoon': '[tsp_us]',
};
