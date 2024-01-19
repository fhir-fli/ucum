const ucumJsonDefs = {
  "prefixes": [
    {
      "code": "Y",
      "CODE": "YA",
      "value": "1000000000000000000000000",
      "name": "yotta",
      "printSymbol": "Y"
    },
    {
      "code": "Z",
      "CODE": "ZA",
      "value": "1000000000000000000000",
      "name": "zetta",
      "printSymbol": "Z"
    },
    {
      "code": "E",
      "CODE": "EX",
      "value": "1000000000000000000",
      "name": "exa",
      "printSymbol": "E"
    },
    {
      "code": "P",
      "CODE": "PT",
      "value": "1000000000000000",
      "name": "peta",
      "printSymbol": "P"
    },
    {
      "code": "T",
      "CODE": "TR",
      "value": "1000000000000",
      "name": "tera",
      "printSymbol": "T"
    },
    {
      "code": "G",
      "CODE": "GA",
      "value": "1000000000",
      "name": "giga",
      "printSymbol": "G"
    },
    {
      "code": "M",
      "CODE": "MA",
      "value": "1000000",
      "name": "mega",
      "printSymbol": "M"
    },
    {
      "code": "k",
      "CODE": "K",
      "value": "1000",
      "name": "kilo",
      "printSymbol": "k"
    },
    {
      "code": "h",
      "CODE": "H",
      "value": "100",
      "name": "hecto",
      "printSymbol": "h"
    },
    {
      "code": "da",
      "CODE": "DA",
      "value": "10",
      "name": "deka",
      "printSymbol": "da"
    },
    {
      "code": "d",
      "CODE": "D",
      "value": "0.1",
      "name": "deci",
      "printSymbol": "d"
    },
    {
      "code": "c",
      "CODE": "C",
      "value": "0.01",
      "name": "centi",
      "printSymbol": "c"
    },
    {
      "code": "m",
      "CODE": "M",
      "value": "0.001",
      "name": "milli",
      "printSymbol": "m"
    },
    {
      "code": "u",
      "CODE": "U",
      "value": "0.000001",
      "name": "micro",
      "printSymbol": "μ"
    },
    {
      "code": "n",
      "CODE": "N",
      "value": "0.000000001",
      "name": "nano",
      "printSymbol": "n"
    },
    {
      "code": "p",
      "CODE": "P",
      "value": "0.000000000001",
      "name": "pico",
      "printSymbol": "p"
    },
    {
      "code": "f",
      "CODE": "F",
      "value": "0.000000000000001",
      "name": "femto",
      "printSymbol": "f"
    },
    {
      "code": "a",
      "CODE": "A",
      "value": "0.000000000000000001",
      "name": "atto",
      "printSymbol": "a"
    },
    {
      "code": "z",
      "CODE": "ZO",
      "value": "0.000000000000000000001",
      "name": "zepto",
      "printSymbol": "z"
    },
    {
      "code": "y",
      "CODE": "YO",
      "value": "0.000000000000000000000001",
      "name": "yocto",
      "printSymbol": "y"
    },
    {
      "code": "Ki",
      "CODE": "KIB",
      "value": "1024",
      "name": "kibi",
      "printSymbol": "Ki"
    },
    {
      "code": "Mi",
      "CODE": "MIB",
      "value": "1048576",
      "name": "mebi",
      "printSymbol": "Mi"
    },
    {
      "code": "Gi",
      "CODE": "GIB",
      "value": "1073741824",
      "name": "gibi",
      "printSymbol": "Gi"
    },
    {
      "code": "Ti",
      "CODE": "TIB",
      "value": "1099511627776",
      "name": "tebi",
      "printSymbol": "Ti"
    }
  ],
  "baseUnits": [
    {
      "code": "m",
      "CODE": "M",
      "property": "length",
      "dim": "L",
      "name": "meter",
      "printSymbol": "m"
    },
    {
      "code": "s",
      "CODE": "S",
      "property": "time",
      "dim": "T",
      "name": "second",
      "printSymbol": "s"
    },
    {
      "code": "g",
      "CODE": "G",
      "property": "mass",
      "dim": "M",
      "name": "gram",
      "printSymbol": "g"
    },
    {
      "code": "rad",
      "CODE": "RAD",
      "property": "plane angle",
      "dim": "A",
      "name": "radian",
      "printSymbol": "rad"
    },
    {
      "code": "K",
      "CODE": "K",
      "property": "temperature",
      "dim": "C",
      "name": "Kelvin",
      "printSymbol": "K"
    },
    {
      "code": "C",
      "CODE": "C",
      "property": "electric charge",
      "dim": "Q",
      "name": "Coulomb",
      "printSymbol": "C"
    },
    {
      "code": "cd",
      "CODE": "CD",
      "property": "luminous intensity",
      "dim": "F",
      "name": "candela",
      "printSymbol": "cd"
    }
  ],
  "definedUnits": [
    {
      "code": "10*",
      "CODE": "10*",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "the number ten for arbitrary powers",
        "10^",
        "10 to the arbitrary powers"
      ],
      "printSymbol": "10"
    },
    {
      "code": "10^",
      "CODE": "10^",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "the number ten for arbitrary powers",
        "10*",
        "10 to the arbitrary power"
      ],
      "printSymbol": "10"
    },
    {
      "code": "[pi]",
      "CODE": "[PI]",
      "value": {
        "unit": "1",
        "UNIT": "1",
        "value":
            "3.1415926535897932384626433832795028841971693993751058209749445923",
        "text":
            "3.1415926535897932384626433832795028841971693993751058209749445923"
      },
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["the number pi", "π"],
      "printSymbol": "π"
    },
    {
      "code": "%",
      "CODE": "%",
      "value": {"unit": "10*-2", "UNIT": "10*-2", "value": "1", "text": "1"},
      "property": "fraction",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["", "percents"],
      "printSymbol": "%"
    },
    {
      "code": "[ppth]",
      "CODE": "[PPTH]",
      "value": {"unit": "10*-3", "UNIT": "10*-3", "value": "1", "text": "1"},
      "property": "fraction",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["parts per thousand", "ppth", "10^-3"],
      "printSymbol": "ppth"
    },
    {
      "code": "[ppm]",
      "CODE": "[PPM]",
      "value": {"unit": "10*-6", "UNIT": "10*-6", "value": "1", "text": "1"},
      "property": "fraction",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["parts per million", "ppm", "10^-6"],
      "printSymbol": "ppm"
    },
    {
      "code": "[ppb]",
      "CODE": "[PPB]",
      "value": {"unit": "10*-9", "UNIT": "10*-9", "value": "1", "text": "1"},
      "property": "fraction",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["parts per billion", "ppb", "10^-9"],
      "printSymbol": "ppb"
    },
    {
      "code": "[pptr]",
      "CODE": "[PPTR]",
      "value": {"unit": "10*-12", "UNIT": "10*-12", "value": "1", "text": "1"},
      "property": "fraction",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["parts per trillion", "pptr", "10^-12"],
      "printSymbol": "pptr"
    },
    {
      "code": "mol",
      "CODE": "MOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["mole", "moles"],
      "printSymbol": "mol"
    },
    {
      "code": "sr",
      "CODE": "SR",
      "value": {"unit": "rad2", "UNIT": "RAD2", "value": "1", "text": "1"},
      "property": "solid angle",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["steradian - solid angle", "square radian", "rad2", "rad^2"],
      "printSymbol": "sr"
    },
    {
      "code": "Hz",
      "CODE": "HZ",
      "value": {"unit": "s-1", "UNIT": "S-1", "value": "1", "text": "1"},
      "property": "frequency",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["hertz", "Herz", "frequency", "frequencies"],
      "printSymbol": "Hz"
    },
    {
      "code": "N",
      "CODE": "N",
      "value": {
        "unit": "kg.m/s2",
        "UNIT": "KG.M/S2",
        "value": "1",
        "text": "1"
      },
      "property": "force",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["newton", "Newtons"],
      "printSymbol": "N"
    },
    {
      "code": "Pa",
      "CODE": "PAL",
      "value": {"unit": "N/m2", "UNIT": "N/M2", "value": "1", "text": "1"},
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["pascal", "pascals"],
      "printSymbol": "Pa"
    },
    {
      "code": "J",
      "CODE": "J",
      "value": {"unit": "N.m", "UNIT": "N.M", "value": "1", "text": "1"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["joule", "joules"],
      "printSymbol": "J"
    },
    {
      "code": "W",
      "CODE": "W",
      "value": {"unit": "J/s", "UNIT": "J/S", "value": "1", "text": "1"},
      "property": "power",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["watt", "watts"],
      "printSymbol": "W"
    },
    {
      "code": "A",
      "CODE": "A",
      "value": {"unit": "C/s", "UNIT": "C/S", "value": "1", "text": "1"},
      "property": "electric current",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Ampere", "Amperes"],
      "printSymbol": "A"
    },
    {
      "code": "V",
      "CODE": "V",
      "value": {"unit": "J/C", "UNIT": "J/C", "value": "1", "text": "1"},
      "property": "electric potential",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["volt", "volts"],
      "printSymbol": "V"
    },
    {
      "code": "F",
      "CODE": "F",
      "value": {"unit": "C/V", "UNIT": "C/V", "value": "1", "text": "1"},
      "property": "electric capacitance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["farad", "farads", "electric capacitance"],
      "printSymbol": "F"
    },
    {
      "code": "Ohm",
      "CODE": "OHM",
      "value": {"unit": "V/A", "UNIT": "V/A", "value": "1", "text": "1"},
      "property": "electric resistance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["ohm", "Ω", "resistance", "ohms"],
      "printSymbol": "Ω"
    },
    {
      "code": "S",
      "CODE": "SIE",
      "value": {"unit": "Ohm-1", "UNIT": "OHM-1", "value": "1", "text": "1"},
      "property": "electric conductance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["siemens", "Reciprocal ohm", "mho", "Ω−1", "conductance"],
      "printSymbol": "S"
    },
    {
      "code": "Wb",
      "CODE": "WB",
      "value": {"unit": "V.s", "UNIT": "V.S", "value": "1", "text": "1"},
      "property": "magnetic flux",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["weber", "magnetic flux", "webers"],
      "printSymbol": "Wb"
    },
    {
      "code": "Cel",
      "CODE": "CEL",
      "value": {"unit": "K", "UNIT": null, "value": null, "text": "null"},
      "property": "temperature",
      "isMetric": true,
      "isSpecial": true,
      "class": null,
      "name": ["degree Celsius", "°C", "degrees"],
      "printSymbol": "°C"
    },
    {
      "code": "T",
      "CODE": "T",
      "value": {"unit": "Wb/m2", "UNIT": "WB/M2", "value": "1", "text": "1"},
      "property": "magnetic flux density",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["tesla", "Teslas", "magnetic field"],
      "printSymbol": "T"
    },
    {
      "code": "H",
      "CODE": "H",
      "value": {"unit": "Wb/A", "UNIT": "WB/A", "value": "1", "text": "1"},
      "property": "inductance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["henry", "henries", "inductance"],
      "printSymbol": "H"
    },
    {
      "code": "lm",
      "CODE": "LM",
      "value": {"unit": "cd.sr", "UNIT": "CD.SR", "value": "1", "text": "1"},
      "property": "luminous flux",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["lumen", "luminous flux", "lumens"],
      "printSymbol": "lm"
    },
    {
      "code": "lx",
      "CODE": "LX",
      "value": {"unit": "lm/m2", "UNIT": "LM/M2", "value": "1", "text": "1"},
      "property": "illuminance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["lux", "illuminance", "luxes"],
      "printSymbol": "lx"
    },
    {
      "code": "Bq",
      "CODE": "BQ",
      "value": {"unit": "s-1", "UNIT": "S-1", "value": "1", "text": "1"},
      "property": "radioactivity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["becquerel", "activity", "radiation", "becquerels"],
      "printSymbol": "Bq"
    },
    {
      "code": "Gy",
      "CODE": "GY",
      "value": {"unit": "J/kg", "UNIT": "J/KG", "value": "1", "text": "1"},
      "property": "energy dose",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "gray",
        "absorbed doses",
        "ionizing radiation doses",
        "kerma",
        "grays"
      ],
      "printSymbol": "Gy"
    },
    {
      "code": "Sv",
      "CODE": "SV",
      "value": {"unit": "J/kg", "UNIT": "J/KG", "value": "1", "text": "1"},
      "property": "dose equivalent",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "sievert",
        "sieverts",
        "radiation dose quantities",
        "equivalent doses",
        "effective dose",
        "operational dose",
        "committed dose"
      ],
      "printSymbol": "Sv"
    },
    {
      "code": "deg",
      "CODE": "DEG",
      "value": {
        "unit": "[pi].rad/360",
        "UNIT": "[PI].RAD/360",
        "value": "2",
        "text": "2"
      },
      "property": "plane angle",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "degree - plane angle",
        "°",
        "degree of arc",
        "arc degree",
        "arcdegree",
        "angle"
      ],
      "printSymbol": "°"
    },
    {
      "code": "gon",
      "CODE": "GON",
      "value": {"unit": "deg", "UNIT": "DEG", "value": "0.9", "text": "0.9"},
      "property": "plane angle",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["gon", "gon (grade)", "gons"],
      "printSymbol": "□<sup>g</sup>"
    },
    {
      "code": "",
      "CODE": "",
      "value": {"unit": "deg/60", "UNIT": "DEG/60", "value": "1", "text": "1"},
      "property": "plane angle",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["arc minute", "arcminutes", "arcmin", "arc minutes", "arc mins"],
      "printSymbol": ""
    },
    {
      "code": "'",
      "CODE": "'",
      "value": {"unit": "/60", "UNIT": "/60", "value": "1", "text": "1"},
      "property": "plane angle",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["arc second", "arcseconds", "arcsecs"],
      "printSymbol": "'"
    },
    {
      "code": "l",
      "CODE": "L",
      "value": {"unit": "dm3", "UNIT": "DM3", "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "Liters",
        "cubic decimeters",
        "decimeters cubed",
        "decimetres",
        "dm3",
        "dm^3",
        "litres",
        "liters, LT"
      ],
      "printSymbol": "l"
    },
    {
      "code": "L",
      "CODE": "L",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "Liters",
        "cubic decimeters",
        "decimeters cubed",
        "decimetres",
        "dm3",
        "dm^3",
        "litres",
        "liters, LT"
      ],
      "printSymbol": "L"
    },
    {
      "code": "ar",
      "CODE": "AR",
      "value": {"unit": "m2", "UNIT": "M2", "value": "100", "text": "100"},
      "property": "area",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "are",
        "100 m2",
        "100 m^2",
        "100 square meter",
        "meters squared",
        "metres"
      ],
      "printSymbol": "a"
    },
    {
      "code": "min",
      "CODE": "MIN",
      "value": {"unit": "s", "UNIT": "S", "value": "60", "text": "60"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["minute", "minutes"],
      "printSymbol": "min"
    },
    {
      "code": "h",
      "CODE": "HR",
      "value": {"unit": "min", "UNIT": "MIN", "value": "60", "text": "60"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["hour", "hours", "hrs", "age"],
      "printSymbol": "h"
    },
    {
      "code": "d",
      "CODE": "D",
      "value": {"unit": "h", "UNIT": "HR", "value": "24", "text": "24"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["day", "days", "age", "dy", "24 hours", "24 hrs"],
      "printSymbol": "d"
    },
    {
      "code": "a_t",
      "CODE": "ANN_T",
      "value": {
        "unit": "d",
        "UNIT": "D",
        "value": "365.24219",
        "text": "365.24219"
      },
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["tropical year", "solar years", "a tropical", "years"],
      "printSymbol": "a<sub>t</sub>"
    },
    {
      "code": "a_j",
      "CODE": "ANN_J",
      "value": {"unit": "d", "UNIT": "D", "value": "365.25", "text": "365.25"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["mean Julian year", "mean Julian yr", "a julian", "years"],
      "printSymbol": "a<sub>j</sub>"
    },
    {
      "code": "a_g",
      "CODE": "ANN_G",
      "value": {
        "unit": "d",
        "UNIT": "D",
        "value": "365.2425",
        "text": "365.2425"
      },
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "mean Gregorian year",
        "mean Gregorian yr",
        "a gregorian",
        "years"
      ],
      "printSymbol": "a<sub>g</sub>"
    },
    {
      "code": "a",
      "CODE": "ANN",
      "value": {"unit": "a_j", "UNIT": "ANN_J", "value": "1", "text": "1"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["year", "years", "a", "yr, yrs", "annum"],
      "printSymbol": "a"
    },
    {
      "code": "wk",
      "CODE": "WK",
      "value": {"unit": "d", "UNIT": "D", "value": "7", "text": "7"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["week", "weeks", "wks"],
      "printSymbol": "wk"
    },
    {
      "code": "mo_s",
      "CODE": "MO_S",
      "value": {
        "unit": "d",
        "UNIT": "D",
        "value": "29.53059",
        "text": "29.53059"
      },
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "synodal month",
        "Moon",
        "synodic month",
        "lunar month",
        "mo-s",
        "mo s",
        "months",
        "moons"
      ],
      "printSymbol": "mo<sub>s</sub>"
    },
    {
      "code": "mo_j",
      "CODE": "MO_J",
      "value": {
        "unit": "a_j/12",
        "UNIT": "ANN_J/12",
        "value": "1",
        "text": "1"
      },
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["mean Julian month", "mo-julian", "mo Julian", "months"],
      "printSymbol": "mo<sub>j</sub>"
    },
    {
      "code": "mo_g",
      "CODE": "MO_G",
      "value": {
        "unit": "a_g/12",
        "UNIT": "ANN_G/12",
        "value": "1",
        "text": "1"
      },
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "mean Gregorian month",
        "months",
        "month-gregorian",
        "mo-gregorian"
      ],
      "printSymbol": "mo<sub>g</sub>"
    },
    {
      "code": "mo",
      "CODE": "MO",
      "value": {"unit": "mo_j", "UNIT": "MO_J", "value": "1", "text": "1"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["month", "months", "duration"],
      "printSymbol": "mo"
    },
    {
      "code": "t",
      "CODE": "TNE",
      "value": {
        "unit": "kg",
        "UNIT": "KG",
        "value": "1000.0",
        "text": "1000.0"
      },
      "property": "mass",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["metric ton", "tonnes", "megagrams", "tons"],
      "printSymbol": "t"
    },
    {
      "code": "bar",
      "CODE": "BAR",
      "value": {
        "unit": "Pa",
        "UNIT": "PAL",
        "value": "100000.0",
        "text": "100000.0"
      },
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["bar", "bars"],
      "printSymbol": "bar"
    },
    {
      "code": "u",
      "CODE": "AMU",
      "value": {
        "unit": "g",
        "UNIT": "G",
        "value": "0.0000000000000000000000016605402",
        "text": "1.6605402e-24"
      },
      "property": "mass",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "unified atomic mass unit",
        "unified atomic mass units",
        "amu",
        "Dalton",
        "Da"
      ],
      "printSymbol": "u"
    },
    {
      "code": "AU",
      "CODE": "ASU",
      "value": {
        "unit": "Mm",
        "UNIT": "MAM",
        "value": "149597.870691",
        "text": "149597.870691"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["astronomic unit", "AU", "units"],
      "printSymbol": "AU"
    },
    {
      "code": "pc",
      "CODE": "PRS",
      "value": {
        "unit": "m",
        "UNIT": "M",
        "value": "30856780000000000.0",
        "text": "30856780000000000.0"
      },
      "property": "length",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["parsec", "parsecs"],
      "printSymbol": "pc"
    },
    {
      "code": "[c]",
      "CODE": "[C]",
      "value": {
        "unit": "m/s",
        "UNIT": "M/S",
        "value": "299792458",
        "text": "299792458"
      },
      "property": "velocity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["velocity of light in a vacuum", "speed of light"],
      "printSymbol": "<i>c</i>"
    },
    {
      "code": "[h]",
      "CODE": "[H]",
      "value": {
        "unit": "J.s",
        "UNIT": "J.S",
        "value": "0.00000000000000000000000000000000066260755",
        "text": "6.6260755e-34"
      },
      "property": "action",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Planck constant", "Planck's constant"],
      "printSymbol": "<i>h</i>"
    },
    {
      "code": "[k]",
      "CODE": "[K]",
      "value": {
        "unit": "J/K",
        "UNIT": "J/K",
        "value": "0.00000000000000000000001380658",
        "text": "1.380658e-23"
      },
      "property": "(unclassified)",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Boltzmann constant", "k", "kB"],
      "printSymbol": "<i>k</i>"
    },
    {
      "code": "[eps_0]",
      "CODE": "[EPS_0]",
      "value": {
        "unit": "F/m",
        "UNIT": "F/M",
        "value": "0.000000000008854187817",
        "text": "8.854187817e-12"
      },
      "property": "electric permittivity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "permittivity of vacuum - electric",
        "ε0",
        "Electric Constant",
        "vacuum permittivity",
        "permittivity of free space"
      ],
      "printSymbol": "<i>ε<sub><r>0</r></sub></i>"
    },
    {
      "code": "[mu_0]",
      "CODE": "[MU_0]",
      "value": {
        "unit": "N/A2",
        "UNIT": "4.[PI].10*-7.N/A2",
        "value": "1",
        "text": "1"
      },
      "property": "magnetic permeability",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "permeability of vacuum - magnetic",
        "μ0",
        "vacuum permeability",
        "permeability of free space",
        "magnetic constant"
      ],
      "printSymbol": "<i>μ<sub><r>0</r></sub></i>"
    },
    {
      "code": "[e]",
      "CODE": "[E]",
      "value": {
        "unit": "C",
        "UNIT": "C",
        "value": "0.000000000000000000160217733",
        "text": "1.60217733e-19"
      },
      "property": "electric charge",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["elementary charge", "e", "q", "electric charges"],
      "printSymbol": "<i>e</i>"
    },
    {
      "code": "eV",
      "CODE": "EV",
      "value": {"unit": "[e].V", "UNIT": "[E].V", "value": "1", "text": "1"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["electronvolt", "Electron Volts", "electronvolts"],
      "printSymbol": "eV"
    },
    {
      "code": "[m_e]",
      "CODE": "[M_E]",
      "value": {
        "unit": "g",
        "UNIT": "g",
        "value": "0.00000000000000000000000000091093897",
        "text": "9.1093897e-28"
      },
      "property": "mass",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["electron mass", "electron rest mass", "me"],
      "printSymbol": "<i>m<sub><r>e</r></sub></i>"
    },
    {
      "code": "[m_p]",
      "CODE": "[M_P]",
      "value": {
        "unit": "g",
        "UNIT": "g",
        "value": "0.0000000000000000000000016726231",
        "text": "1.6726231e-24"
      },
      "property": "mass",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["proton mass", "mp", "masses"],
      "printSymbol": "<i>m<sub><r>p</r></sub></i>"
    },
    {
      "code": "[G]",
      "CODE": "[GC]",
      "value": {
        "unit": "m3.kg-1.s-2",
        "UNIT": "M3.KG-1.S-2",
        "value": "0.0000000000667259",
        "text": "6.67259e-11"
      },
      "property": "(unclassified)",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "Newtonian constant of gravitation",
        "G",
        "gravitational constant",
        "Newton's constant"
      ],
      "printSymbol": "<i>G</i>"
    },
    {
      "code": "[g]",
      "CODE": "[G]",
      "value": {
        "unit": "m/s2",
        "UNIT": "M/S2",
        "value": "9.80665",
        "text": "9.80665"
      },
      "property": "acceleration",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "standard acceleration of free fall",
        "standard gravity",
        "g",
        "ɡ0",
        "ɡn"
      ],
      "printSymbol": "<i>g<sub>n</sub></i>"
    },
    {
      "code": "Torr",
      "CODE": "Torr",
      "value": {
        "unit": "Pa",
        "UNIT": "PAL",
        "value": "133.322",
        "text": "133.322"
      },
      "property": "pressure",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Torr", "torrs"],
      "printSymbol": "Torr"
    },
    {
      "code": "atm",
      "CODE": "ATM",
      "value": {
        "unit": "Pa",
        "UNIT": "PAL",
        "value": "101325",
        "text": "101325"
      },
      "property": "pressure",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "standard atmosphere",
        "reference pressure",
        "atmos",
        "std atmosphere"
      ],
      "printSymbol": "atm"
    },
    {
      "code": "[ly]",
      "CODE": "[LY]",
      "value": {
        "unit": "[c].a_j",
        "UNIT": "[C].ANN_J",
        "value": "1",
        "text": "1"
      },
      "property": "length",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["light-year", "light years", "ly"],
      "printSymbol": "l.y."
    },
    {
      "code": "gf",
      "CODE": "GF",
      "value": {"unit": "g.[g]", "UNIT": "G.[G]", "value": "1", "text": "1"},
      "property": "force",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["gram-force", "Newtons", "gram forces"],
      "printSymbol": "gf"
    },
    {
      "code": "Ky",
      "CODE": "KY",
      "value": {"unit": "cm-1", "UNIT": "CM-1", "value": "1", "text": "1"},
      "property": "lineic number",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Kayser", "wavenumbers", "kaysers"],
      "printSymbol": "K"
    },
    {
      "code": "Gal",
      "CODE": "GL",
      "value": {"unit": "cm/s2", "UNIT": "CM/S2", "value": "1", "text": "1"},
      "property": "acceleration",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Gal", "galileos", "Gals"],
      "printSymbol": "Gal"
    },
    {
      "code": "dyn",
      "CODE": "DYN",
      "value": {
        "unit": "g.cm/s2",
        "UNIT": "G.CM/S2",
        "value": "1",
        "text": "1"
      },
      "property": "force",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["dyne", "dynes"],
      "printSymbol": "dyn"
    },
    {
      "code": "erg",
      "CODE": "ERG",
      "value": {"unit": "dyn.cm", "UNIT": "DYN.CM", "value": "1", "text": "1"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "erg",
        "10^-7 Joules, 10-7 Joules",
        "100 nJ",
        "100 nanoJoules",
        "1 dyne cm",
        "1 g.cm2/s2"
      ],
      "printSymbol": "erg"
    },
    {
      "code": "P",
      "CODE": "P",
      "value": {
        "unit": "dyn.s/cm2",
        "UNIT": "DYN.S/CM2",
        "value": "1",
        "text": "1"
      },
      "property": "dynamic viscosity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Poise", "dynamic viscosity", "poises"],
      "printSymbol": "P"
    },
    {
      "code": "Bi",
      "CODE": "BI",
      "value": {"unit": "A", "UNIT": "A", "value": "10", "text": "10"},
      "property": "electric current",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Biot", "Bi", "abamperes", "abA"],
      "printSymbol": "Bi"
    },
    {
      "code": "St",
      "CODE": "ST",
      "value": {"unit": "cm2/s", "UNIT": "CM2/S", "value": "1", "text": "1"},
      "property": "kinematic viscosity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Stokes", "kinematic viscosity"],
      "printSymbol": "St"
    },
    {
      "code": "Mx",
      "CODE": "MX",
      "value": {
        "unit": "Wb",
        "UNIT": "WB",
        "value": "0.00000001",
        "text": "1e-8"
      },
      "property": "flux of magnetic induction",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Maxwell", "magnetix flux", "Maxwells"],
      "printSymbol": "Mx"
    },
    {
      "code": "G",
      "CODE": "GS",
      "value": {"unit": "T", "UNIT": "T", "value": "0.0001", "text": "0.0001"},
      "property": "magnetic flux density",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "Gauss",
        "magnetic fields",
        "magnetic flux density",
        "induction",
        "B"
      ],
      "printSymbol": "Gs"
    },
    {
      "code": "Oe",
      "CODE": "OE",
      "value": {
        "unit": "A/m",
        "UNIT": "/[PI].A/M",
        "value": "250",
        "text": "250"
      },
      "property": "magnetic field intensity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Oersted", "H magnetic B field", "Oersteds"],
      "printSymbol": "Oe"
    },
    {
      "code": "Gb",
      "CODE": "GB",
      "value": {"unit": "Oe.cm", "UNIT": "OE.CM", "value": "1", "text": "1"},
      "property": "magnetic tension",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Gilbert", "Gi", "magnetomotive force", "Gilberts"],
      "printSymbol": "Gb"
    },
    {
      "code": "sb",
      "CODE": "SB",
      "value": {"unit": "cd/cm2", "UNIT": "CD/CM2", "value": "1", "text": "1"},
      "property": "lum. intensity density",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["stilb", "stilbs"],
      "printSymbol": "sb"
    },
    {
      "code": "Lmb",
      "CODE": "LMB",
      "value": {
        "unit": "cd/cm2/[pi]",
        "UNIT": "CD/CM2/[PI]",
        "value": "1",
        "text": "1"
      },
      "property": "brightness",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Lambert", "luminance", "lamberts"],
      "printSymbol": "L"
    },
    {
      "code": "ph",
      "CODE": "PHT",
      "value": {
        "unit": "lx",
        "UNIT": "LX",
        "value": "0.0001",
        "text": "0.0001"
      },
      "property": "illuminance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["phot", "phots"],
      "printSymbol": "ph"
    },
    {
      "code": "Ci",
      "CODE": "CI",
      "value": {
        "unit": "Bq",
        "UNIT": "BQ",
        "value": "37000000000.0",
        "text": "37000000000.0"
      },
      "property": "radioactivity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Curie", "curies"],
      "printSymbol": "Ci"
    },
    {
      "code": "R",
      "CODE": "ROE",
      "value": {
        "unit": "C/kg",
        "UNIT": "C/KG",
        "value": "0.000258",
        "text": "0.000258"
      },
      "property": "ion dose",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Roentgen", "röntgen", "Roentgens"],
      "printSymbol": "R"
    },
    {
      "code": "RAD",
      "CODE": "[RAD]",
      "value": {
        "unit": "erg/g",
        "UNIT": "ERG/G",
        "value": "100",
        "text": "100"
      },
      "property": "energy dose",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["radiation absorbed dose", "doses"],
      "printSymbol": "RAD"
    },
    {
      "code": "REM",
      "CODE": "[REM]",
      "value": {"unit": "RAD", "UNIT": "[RAD]", "value": "1", "text": "1"},
      "property": "dose equivalent",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "radiation equivalent man",
        "Roentgen Equivalent in Man",
        "rems",
        "dose equivalents"
      ],
      "printSymbol": "REM"
    },
    {
      "code": "[in_i]",
      "CODE": "[IN_I]",
      "value": {"unit": "cm", "UNIT": "CM", "value": "2.54", "text": "2.54"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["inch", "inches", "in", "international inch", "body height"],
      "printSymbol": "in"
    },
    {
      "code": "[ft_i]",
      "CODE": "[FT_I]",
      "value": {
        "unit": "[in_i]",
        "UNIT": "[IN_I]",
        "value": "12",
        "text": "12"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "foot",
        "ft",
        "fts",
        "foot",
        "international foot",
        "feet",
        "international feet",
        "height"
      ],
      "printSymbol": "ft"
    },
    {
      "code": "[yd_i]",
      "CODE": "[YD_I]",
      "value": {"unit": "[ft_i]", "UNIT": "[FT_I]", "value": "3", "text": "3"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["yard", "international yards", "yds", "distance"],
      "printSymbol": "yd"
    },
    {
      "code": "[mi_i]",
      "CODE": "[MI_I]",
      "value": {
        "unit": "[ft_i]",
        "UNIT": "[FT_I]",
        "value": "5280",
        "text": "5280"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["mile", "international miles", "mi I", "statute mile"],
      "printSymbol": "mi"
    },
    {
      "code": "[fth_i]",
      "CODE": "[FTH_I]",
      "value": {"unit": "[ft_i]", "UNIT": "[FT_I]", "value": "6", "text": "6"},
      "property": "depth of water",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["fathom", "international fathoms"],
      "printSymbol": "fth"
    },
    {
      "code": "[nmi_i]",
      "CODE": "[NMI_I]",
      "value": {"unit": "m", "UNIT": "M", "value": "1852", "text": "1852"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nautical mile",
        "nautical mile",
        "nautical miles",
        "international nautical mile",
        "international nautical miles",
        "nm",
        "n.m.",
        "nmi"
      ],
      "printSymbol": "n.mi"
    },
    {
      "code": "[kn_i]",
      "CODE": "[KN_I]",
      "value": {
        "unit": "[nmi_i]/h",
        "UNIT": "[NMI_I]/H",
        "value": "1",
        "text": "1"
      },
      "property": "velocity",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["knot", "kn", "kt", "international knots"],
      "printSymbol": "knot"
    },
    {
      "code": "[sin_i]",
      "CODE": "[SIN_I]",
      "value": {
        "unit": "[in_i]2",
        "UNIT": "[IN_I]2",
        "value": "1",
        "text": "1"
      },
      "property": "area",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "square inch",
        "in2",
        "in^2",
        "inches squared",
        "sq inch",
        "inches squared",
        "international"
      ],
      "printSymbol": null
    },
    {
      "code": "[sft_i]",
      "CODE": "[SFT_I]",
      "value": {
        "unit": "[ft_i]2",
        "UNIT": "[FT_I]2",
        "value": "1",
        "text": "1"
      },
      "property": "area",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "square foot",
        "ft2",
        "ft^2",
        "ft squared",
        "sq ft",
        "feet",
        "international"
      ],
      "printSymbol": null
    },
    {
      "code": "[syd_i]",
      "CODE": "[SYD_I]",
      "value": {
        "unit": "[yd_i]2",
        "UNIT": "[YD_I]2",
        "value": "1",
        "text": "1"
      },
      "property": "area",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "square yard",
        "yd2",
        "yd^2",
        "sq. yds",
        "yards squared",
        "international"
      ],
      "printSymbol": null
    },
    {
      "code": "[cin_i]",
      "CODE": "[CIN_I]",
      "value": {
        "unit": "[in_i]3",
        "UNIT": "[IN_I]3",
        "value": "1",
        "text": "1"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "cubic inch",
        "in3",
        "in^3",
        "in*3",
        "inches^3",
        "inches*3",
        "cu. in",
        "cu in",
        "cubic inches",
        "inches cubed",
        "cin"
      ],
      "printSymbol": null
    },
    {
      "code": "[cft_i]",
      "CODE": "[CFT_I]",
      "value": {
        "unit": "[ft_i]3",
        "UNIT": "[FT_I]3",
        "value": "1",
        "text": "1"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "cubic foot",
        "ft3",
        "ft^3",
        "ft*3",
        "cu. ft",
        "cubic feet",
        "cubed",
        "[ft_i]3",
        "international"
      ],
      "printSymbol": null
    },
    {
      "code": "[cyd_i]",
      "CODE": "[CYD_I]",
      "value": {
        "unit": "[yd_i]3",
        "UNIT": "[YD_I]3",
        "value": "1",
        "text": "1"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "cubic yard",
        "cubic yards",
        "cubic yds",
        "cu yards",
        "CYs",
        "yards^3",
        "yd^3",
        "yds^3",
        "yd3",
        "yds3"
      ],
      "printSymbol": "cu.yd"
    },
    {
      "code": "[bf_i]",
      "CODE": "[BF_I]",
      "value": {
        "unit": "[in_i]3",
        "UNIT": "[IN_I]3",
        "value": "144",
        "text": "144"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "board foot",
        "BDFT",
        "FBM",
        "BF",
        "board feet",
        "international"
      ],
      "printSymbol": null
    },
    {
      "code": "[cr_i]",
      "CODE": "[CR_I]",
      "value": {
        "unit": "[ft_i]3",
        "UNIT": "[FT_I]3",
        "value": "128",
        "text": "128"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["cord", "crd I", "international cords"],
      "printSymbol": null
    },
    {
      "code": "[mil_i]",
      "CODE": "[MIL_I]",
      "value": {
        "unit": "[in_i]",
        "UNIT": "[IN_I]",
        "value": "0.001",
        "text": "0.001"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["mil", "thou, thousandth", "mils", "international"],
      "printSymbol": "mil"
    },
    {
      "code": "[cml_i]",
      "CODE": "[CML_I]",
      "value": {
        "unit": "[pi]/4.[mil_i]2",
        "UNIT": "[PI]/4.[MIL_I]2",
        "value": "1",
        "text": "1"
      },
      "property": "area",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["circular mil", "circular mils", "cml I", "international"],
      "printSymbol": "circ.mil"
    },
    {
      "code": "[hd_i]",
      "CODE": "[HD_I]",
      "value": {"unit": "[in_i]", "UNIT": "[IN_I]", "value": "4", "text": "4"},
      "property": "height of horses",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["hand", "hands", "international"],
      "printSymbol": "hd"
    },
    {
      "code": "[ft_us]",
      "CODE": "[FT_US]",
      "value": {
        "unit": "m/3937",
        "UNIT": "M/3937",
        "value": "1200",
        "text": "1200"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "foot - US",
        "US foot",
        "foot US",
        "us ft",
        "ft us",
        "height",
        "visual distance",
        "feet"
      ],
      "printSymbol": "ft<sub>us</sub>"
    },
    {
      "code": "[yd_us]",
      "CODE": "[YD_US]",
      "value": {
        "unit": "[ft_us]",
        "UNIT": "[FT_US]",
        "value": "3",
        "text": "3"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["yard - US", "US yards", "us yds", "distance"],
      "printSymbol": null
    },
    {
      "code": "[in_us]",
      "CODE": "[IN_US]",
      "value": {
        "unit": "[ft_us]/12",
        "UNIT": "[FT_US]/12",
        "value": "1",
        "text": "1"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["inch - US", "US inches", "in us", "us in", "inch US"],
      "printSymbol": null
    },
    {
      "code": "[rd_us]",
      "CODE": "[RD_US]",
      "value": {
        "unit": "[ft_us]",
        "UNIT": "[FT_US]",
        "value": "16.5",
        "text": "16.5"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["rod - US", "US rod", "US rods", "rd US", "US rd"],
      "printSymbol": null
    },
    {
      "code": "[ch_us]",
      "CODE": "[CH_US]",
      "value": {
        "unit": "[rd_us]",
        "UNIT": "[RD_US]",
        "value": "4",
        "text": "4"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "Gunter's chain - US",
        "surveyor's chain",
        "Surveyor's chain USA",
        "Gunter’s measurement",
        "surveyor’s measurement",
        "Gunter's Chain USA"
      ],
      "printSymbol": null
    },
    {
      "code": "[lk_us]",
      "CODE": "[LK_US]",
      "value": {
        "unit": "[ch_us]/100",
        "UNIT": "[CH_US]/100",
        "value": "1",
        "text": "1"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["link for Gunter's chain - US", "Links for Gunter's Chain USA"],
      "printSymbol": null
    },
    {
      "code": "[rch_us]",
      "CODE": "[RCH_US]",
      "value": {
        "unit": "[ft_us]",
        "UNIT": "[FT_US]",
        "value": "100",
        "text": "100"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Ramden's chain - US", "Ramsden's chain", "engineer's chains"],
      "printSymbol": null
    },
    {
      "code": "[rlk_us]",
      "CODE": "[RLK_US]",
      "value": {
        "unit": "[rch_us]/100",
        "UNIT": "[RCH_US]/100",
        "value": "1",
        "text": "1"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["link for Ramden's chain - US", "links for Ramsden's chain"],
      "printSymbol": null
    },
    {
      "code": "[fth_us]",
      "CODE": "[FTH_US]",
      "value": {
        "unit": "[ft_us]",
        "UNIT": "[FT_US]",
        "value": "6",
        "text": "6"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["fathom - US", "US fathoms", "fathom USA", "fth us"],
      "printSymbol": null
    },
    {
      "code": "[fur_us]",
      "CODE": "[FUR_US]",
      "value": {
        "unit": "[rd_us]",
        "UNIT": "[RD_US]",
        "value": "40",
        "text": "40"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["furlong - US", "US furlongs", "fur us"],
      "printSymbol": null
    },
    {
      "code": "[mi_us]",
      "CODE": "[MI_US]",
      "value": {
        "unit": "[fur_us]",
        "UNIT": "[FUR_US]",
        "value": "8",
        "text": "8"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "mile - US",
        "U.S. Survey Miles",
        "US statute miles",
        "survey mi",
        "US mi",
        "distance"
      ],
      "printSymbol": null
    },
    {
      "code": "[acr_us]",
      "CODE": "[ACR_US]",
      "value": {
        "unit": "[rd_us]2",
        "UNIT": "[RD_US]2",
        "value": "160",
        "text": "160"
      },
      "property": "area",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["acre - US", "Acre USA Survey", "Acre USA", "survey acres"],
      "printSymbol": null
    },
    {
      "code": "[srd_us]",
      "CODE": "[SRD_US]",
      "value": {
        "unit": "[rd_us]2",
        "UNIT": "[RD_US]2",
        "value": "1",
        "text": "1"
      },
      "property": "area",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["square rod - US", "rod2", "rod^2", "sq. rod", "rods squared"],
      "printSymbol": null
    },
    {
      "code": "[smi_us]",
      "CODE": "[SMI_US]",
      "value": {
        "unit": "[mi_us]2",
        "UNIT": "[MI_US]2",
        "value": "1",
        "text": "1"
      },
      "property": "area",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["square mile - US", "mi2", "mi^2", "sq mi", "miles squared"],
      "printSymbol": null
    },
    {
      "code": "[sct]",
      "CODE": "[SCT]",
      "value": {
        "unit": "[mi_us]2",
        "UNIT": "[MI_US]2",
        "value": "1",
        "text": "1"
      },
      "property": "area",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["section", "sct", "sections"],
      "printSymbol": null
    },
    {
      "code": "[twp]",
      "CODE": "[TWP]",
      "value": {"unit": "[sct]", "UNIT": "[SCT]", "value": "36", "text": "36"},
      "property": "area",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["township", "twp", "townships"],
      "printSymbol": null
    },
    {
      "code": "[mil_us]",
      "CODE": "[MIL_US]",
      "value": {
        "unit": "[in_us]",
        "UNIT": "[IN_US]",
        "value": "0.001",
        "text": "0.001"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["mil - US", "thou, thousandth", "mils"],
      "printSymbol": null
    },
    {
      "code": "[in_br]",
      "CODE": "[IN_BR]",
      "value": {
        "unit": "cm",
        "UNIT": "CM",
        "value": "2.539998",
        "text": "2.539998"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "inch - British",
        "imperial inches",
        "imp in",
        "br in",
        "british inches"
      ],
      "printSymbol": null
    },
    {
      "code": "[ft_br]",
      "CODE": "[FT_BR]",
      "value": {
        "unit": "[in_br]",
        "UNIT": "[IN_BR]",
        "value": "12",
        "text": "12"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "foot - British",
        "British Foot",
        "Imperial Foot",
        "feet",
        "imp fts",
        "br fts"
      ],
      "printSymbol": null
    },
    {
      "code": "[rd_br]",
      "CODE": "[RD_BR]",
      "value": {
        "unit": "[ft_br]",
        "UNIT": "[FT_BR]",
        "value": "16.5",
        "text": "16.5"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["rod - British", "British rods", "br rd"],
      "printSymbol": null
    },
    {
      "code": "[ch_br]",
      "CODE": "[CH_BR]",
      "value": {
        "unit": "[rd_br]",
        "UNIT": "[RD_BR]",
        "value": "4",
        "text": "4"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "Gunter's chain - British",
        "Gunter's Chain British",
        "Gunters Chain British",
        "Surveyor's Chain British"
      ],
      "printSymbol": null
    },
    {
      "code": "[lk_br]",
      "CODE": "[LK_BR]",
      "value": {
        "unit": "[ch_br]/100",
        "UNIT": "[CH_BR]/100",
        "value": "1",
        "text": "1"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "link for Gunter's chain - British",
        "Links for Gunter's Chain British"
      ],
      "printSymbol": null
    },
    {
      "code": "[fth_br]",
      "CODE": "[FTH_BR]",
      "value": {
        "unit": "[ft_br]",
        "UNIT": "[FT_BR]",
        "value": "6",
        "text": "6"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "fathom - British",
        "British fathoms",
        "imperial fathoms",
        "br fth",
        "imp fth"
      ],
      "printSymbol": null
    },
    {
      "code": "[pc_br]",
      "CODE": "[PC_BR]",
      "value": {
        "unit": "[ft_br]",
        "UNIT": "[FT_BR]",
        "value": "2.5",
        "text": "2.5"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["pace - British", "British paces", "br pc"],
      "printSymbol": null
    },
    {
      "code": "[yd_br]",
      "CODE": "[YD_BR]",
      "value": {
        "unit": "[ft_br]",
        "UNIT": "[FT_BR]",
        "value": "3",
        "text": "3"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["yard - British", "British yards", "Br yds", "distance"],
      "printSymbol": null
    },
    {
      "code": "[mi_br]",
      "CODE": "[MI_BR]",
      "value": {
        "unit": "[ft_br]",
        "UNIT": "[FT_BR]",
        "value": "5280",
        "text": "5280"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "mile - British",
        "imperial miles",
        "British miles",
        "English statute miles",
        "imp mi, br mi"
      ],
      "printSymbol": null
    },
    {
      "code": "[nmi_br]",
      "CODE": "[NMI_BR]",
      "value": {
        "unit": "[ft_br]",
        "UNIT": "[FT_BR]",
        "value": "6080",
        "text": "6080"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nautical mile - British",
        "British nautical miles",
        "Imperial nautical miles",
        "Admiralty miles",
        "n.m. br",
        "imp nm"
      ],
      "printSymbol": null
    },
    {
      "code": "[kn_br]",
      "CODE": "[KN_BR]",
      "value": {
        "unit": "[nmi_br]/h",
        "UNIT": "[NMI_BR]/H",
        "value": "1",
        "text": "1"
      },
      "property": "velocity",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["knot - British", "British knots", "kn br", "kt"],
      "printSymbol": null
    },
    {
      "code": "[acr_br]",
      "CODE": "[ACR_BR]",
      "value": {
        "unit": "[yd_br]2",
        "UNIT": "[YD_BR]2",
        "value": "4840",
        "text": "4840"
      },
      "property": "area",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["acre", "Imperial acres", "British", "a", "ac", "ar", "acr"],
      "printSymbol": null
    },
    {
      "code": "[gal_us]",
      "CODE": "[GAL_US]",
      "value": {
        "unit": "[in_i]3",
        "UNIT": "[IN_I]3",
        "value": "231",
        "text": "231"
      },
      "property": "fluid volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gallon - US",
        "US gallons",
        "US liquid gallon",
        "gal us",
        "Queen Anne's wine gallon"
      ],
      "printSymbol": null
    },
    {
      "code": "[bbl_us]",
      "CODE": "[BBL_US]",
      "value": {
        "unit": "[gal_us]",
        "UNIT": "[GAL_US]",
        "value": "42",
        "text": "42"
      },
      "property": "fluid volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["barrel - US", "bbl"],
      "printSymbol": null
    },
    {
      "code": "[qt_us]",
      "CODE": "[QT_US]",
      "value": {
        "unit": "[gal_us]/4",
        "UNIT": "[GAL_US]/4",
        "value": "1",
        "text": "1"
      },
      "property": "fluid volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["quart - US", "US quarts", "us qts"],
      "printSymbol": null
    },
    {
      "code": "[pt_us]",
      "CODE": "[PT_US]",
      "value": {
        "unit": "[qt_us]/2",
        "UNIT": "[QT_US]/2",
        "value": "1",
        "text": "1"
      },
      "property": "fluid volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "pint - US",
        "US pints",
        "pint US",
        "liquid pint",
        "pt us",
        "us pt"
      ],
      "printSymbol": null
    },
    {
      "code": "[gil_us]",
      "CODE": "[GIL_US]",
      "value": {
        "unit": "[pt_us]/4",
        "UNIT": "[PT_US]/4",
        "value": "1",
        "text": "1"
      },
      "property": "fluid volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["gill - US", "US gills", "gil us"],
      "printSymbol": null
    },
    {
      "code": "[foz_us]",
      "CODE": "[FOZ_US]",
      "value": {
        "unit": "[gil_us]/4",
        "UNIT": "[GIL_US]/4",
        "value": "1",
        "text": "1"
      },
      "property": "fluid volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "fluid ounce - US",
        "US fluid ounces",
        "fl ozs",
        "FO",
        "fl. oz.",
        "foz us"
      ],
      "printSymbol": "oz fl"
    },
    {
      "code": "[fdr_us]",
      "CODE": "[FDR_US]",
      "value": {
        "unit": "[foz_us]/8",
        "UNIT": "[FOZ_US]/8",
        "value": "1",
        "text": "1"
      },
      "property": "fluid volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["fluid dram - US", "US fluid drams", "fdr us"],
      "printSymbol": null
    },
    {
      "code": "[min_us]",
      "CODE": "[MIN_US]",
      "value": {
        "unit": "[fdr_us]/60",
        "UNIT": "[FDR_US]/60",
        "value": "1",
        "text": "1"
      },
      "property": "fluid volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["minim - US", "min US", "US min", "♏ US"],
      "printSymbol": null
    },
    {
      "code": "[crd_us]",
      "CODE": "[CRD_US]",
      "value": {
        "unit": "[ft_i]3",
        "UNIT": "[FT_I]3",
        "value": "128",
        "text": "128"
      },
      "property": "fluid volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["cord - US", "US cord", "US cords", "crd us", "us crd"],
      "printSymbol": null
    },
    {
      "code": "[bu_us]",
      "CODE": "[BU_US]",
      "value": {
        "unit": "[in_i]3",
        "UNIT": "[IN_I]3",
        "value": "2150.42",
        "text": "2150.42"
      },
      "property": "dry volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["bushel - US", "US bushels", "US bsh", "US bu"],
      "printSymbol": null
    },
    {
      "code": "[gal_wi]",
      "CODE": "[GAL_WI]",
      "value": {
        "unit": "[bu_us]/8",
        "UNIT": "[BU_US]/8",
        "value": "1",
        "text": "1"
      },
      "property": "dry volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gallon - historical",
        "Corn Gallon British",
        "Dry Gallon US",
        "Gallons Historical",
        "Grain Gallon British",
        "Winchester Corn Gallon",
        "historical winchester gallons",
        "wi gal"
      ],
      "printSymbol": null
    },
    {
      "code": "[pk_us]",
      "CODE": "[PK_US]",
      "value": {
        "unit": "[bu_us]/4",
        "UNIT": "[BU_US]/4",
        "value": "1",
        "text": "1"
      },
      "property": "dry volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["peck - US", "US pecks", "US pk"],
      "printSymbol": null
    },
    {
      "code": "[dqt_us]",
      "CODE": "[DQT_US]",
      "value": {
        "unit": "[pk_us]/8",
        "UNIT": "[PK_US]/8",
        "value": "1",
        "text": "1"
      },
      "property": "dry volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "dry quart - US",
        "dry quarts",
        "dry quart US",
        "US dry quart",
        "dry qt",
        "us dry qt",
        "dqt",
        "dqt us"
      ],
      "printSymbol": null
    },
    {
      "code": "[dpt_us]",
      "CODE": "[DPT_US]",
      "value": {
        "unit": "[dqt_us]/2",
        "UNIT": "[DQT_US]/2",
        "value": "1",
        "text": "1"
      },
      "property": "dry volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "dry pint - US",
        "dry pints",
        "dry pint US",
        "US dry pint",
        "dry pt",
        "dpt",
        "dpt us"
      ],
      "printSymbol": null
    },
    {
      "code": "[tbs_us]",
      "CODE": "[TBS_US]",
      "value": {
        "unit": "[foz_us]/2",
        "UNIT": "[FOZ_US]/2",
        "value": "1",
        "text": "1"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["tablespoon - US", "Tbs", "tbsp", "tbs us", "US tablespoons"],
      "printSymbol": null
    },
    {
      "code": "[tsp_us]",
      "CODE": "[TSP_US]",
      "value": {
        "unit": "[tbs_us]/3",
        "UNIT": "[TBS_US]/3",
        "value": "1",
        "text": "1"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["teaspoon - US", "tsp", "t", "US teaspoons"],
      "printSymbol": null
    },
    {
      "code": "[cup_us]",
      "CODE": "[CUP_US]",
      "value": {
        "unit": "[tbs_us]",
        "UNIT": "[TBS_US]",
        "value": "16",
        "text": "16"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["cup - US customary", "cup us", "us cups"],
      "printSymbol": null
    },
    {
      "code": "[foz_m]",
      "CODE": "[FOZ_M]",
      "value": {"unit": "mL", "UNIT": "ML", "value": "30", "text": "30"},
      "property": "fluid volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "fluid ounce - metric",
        "metric fluid ounces",
        "fozs m",
        "fl ozs m"
      ],
      "printSymbol": "oz fl"
    },
    {
      "code": "[cup_m]",
      "CODE": "[CUP_M]",
      "value": {"unit": "mL", "UNIT": "ML", "value": "240", "text": "240"},
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["cup - US legal", "cup m", "metric cups"],
      "printSymbol": null
    },
    {
      "code": "[tsp_m]",
      "CODE": "[TSP_M]",
      "value": {"unit": "mL", "UNIT": "mL", "value": "5", "text": "5"},
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["teaspoon - metric", "tsp", "t", "metric teaspoons"],
      "printSymbol": null
    },
    {
      "code": "[tbs_m]",
      "CODE": "[TBS_M]",
      "value": {"unit": "mL", "UNIT": "mL", "value": "15", "text": "15"},
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "tablespoon - metric",
        "metric tablespoons",
        "Tbs",
        "tbsp",
        "T",
        "tbs m"
      ],
      "printSymbol": null
    },
    {
      "code": "[gal_br]",
      "CODE": "[GAL_BR]",
      "value": {
        "unit": "l",
        "UNIT": "L",
        "value": "4.54609",
        "text": "4.54609"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gallon- British",
        "imperial gallons, UK gallons",
        "British gallons",
        "br gal",
        "imp gal"
      ],
      "printSymbol": null
    },
    {
      "code": "[pk_br]",
      "CODE": "[PK_BR]",
      "value": {
        "unit": "[gal_br]",
        "UNIT": "[GAL_BR]",
        "value": "2",
        "text": "2"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "peck - British",
        "imperial pecks",
        "British pecks",
        "br pk",
        "imp pk"
      ],
      "printSymbol": null
    },
    {
      "code": "[bu_br]",
      "CODE": "[BU_BR]",
      "value": {
        "unit": "[pk_br]",
        "UNIT": "[PK_BR]",
        "value": "4",
        "text": "4"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "bushel - British",
        "British bushels",
        "imperial",
        "br bsh",
        "br bu",
        "imp"
      ],
      "printSymbol": null
    },
    {
      "code": "[qt_br]",
      "CODE": "[QT_BR]",
      "value": {
        "unit": "[gal_br]/4",
        "UNIT": "[GAL_BR]/4",
        "value": "1",
        "text": "1"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "quart - British",
        "British quarts",
        "imperial quarts",
        "br qts"
      ],
      "printSymbol": null
    },
    {
      "code": "[pt_br]",
      "CODE": "[PT_BR]",
      "value": {
        "unit": "[qt_br]/2",
        "UNIT": "[QT_BR]/2",
        "value": "1",
        "text": "1"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "pint - British",
        "British pints",
        "imperial pints",
        "pt br",
        "br pt",
        "imp pt",
        "pt imp"
      ],
      "printSymbol": null
    },
    {
      "code": "[gil_br]",
      "CODE": "[GIL_BR]",
      "value": {
        "unit": "[pt_br]/4",
        "UNIT": "[PT_BR]/4",
        "value": "1",
        "text": "1"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gill - British",
        "imperial gills",
        "British gills",
        "imp gill, br gill"
      ],
      "printSymbol": null
    },
    {
      "code": "[foz_br]",
      "CODE": "[FOZ_BR]",
      "value": {
        "unit": "[gil_br]/5",
        "UNIT": "[GIL_BR]/5",
        "value": "1",
        "text": "1"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "fluid ounce - British",
        "British fluid ounces",
        "Imperial fluid ounces",
        "br fozs",
        "imp fozs",
        "br fl ozs"
      ],
      "printSymbol": null
    },
    {
      "code": "[fdr_br]",
      "CODE": "[FDR_BR]",
      "value": {
        "unit": "[foz_br]/8",
        "UNIT": "[FOZ_BR]/8",
        "value": "1",
        "text": "1"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["fluid dram - British", "British fluid drams", "fdr br"],
      "printSymbol": null
    },
    {
      "code": "[min_br]",
      "CODE": "[MIN_BR]",
      "value": {
        "unit": "[fdr_br]/60",
        "UNIT": "[FDR_BR]/60",
        "value": "1",
        "text": "1"
      },
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["minim - British", "min br", "br min", "♏ br"],
      "printSymbol": null
    },
    {
      "code": "[gr]",
      "CODE": "[GR]",
      "value": {
        "unit": "mg",
        "UNIT": "MG",
        "value": "64.79891",
        "text": "64.79891"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["grain", "gr", "grains"],
      "printSymbol": null
    },
    {
      "code": "[lb_av]",
      "CODE": "[LB_AV]",
      "value": {
        "unit": "[gr]",
        "UNIT": "[GR]",
        "value": "7000",
        "text": "7000"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "pound",
        "avoirdupois pounds, international pounds",
        "av lbs",
        "pounds"
      ],
      "printSymbol": "lb"
    },
    {
      "code": "[lbf_av]",
      "CODE": "[LBF_AV]",
      "value": {
        "unit": "[lb_av].[g]",
        "UNIT": "[LB_AV].[G]",
        "value": "1",
        "text": "1"
      },
      "property": "force",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["pound force - US", "lbfs", "US lbf", "US pound forces"],
      "printSymbol": "lbf"
    },
    {
      "code": "[oz_av]",
      "CODE": "[OZ_AV]",
      "value": {
        "unit": "[lb_av]/16",
        "UNIT": "[LB_AV]/16",
        "value": "1",
        "text": "1"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "ounce",
        "ounces",
        "international ounces",
        "avoirdupois ounces",
        "av ozs"
      ],
      "printSymbol": "oz"
    },
    {
      "code": "[dr_av]",
      "CODE": "[DR_AV]",
      "value": {
        "unit": "[oz_av]/16",
        "UNIT": "[OZ_AV]/16",
        "value": "1",
        "text": "1"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "Dram mass unit",
        "Dram",
        "drams avoirdupois",
        "avoidupois dram",
        "international dram"
      ],
      "printSymbol": null
    },
    {
      "code": "[scwt_av]",
      "CODE": "[SCWT_AV]",
      "value": {
        "unit": "[lb_av]",
        "UNIT": "[LB_AV]",
        "value": "100",
        "text": "100"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "short hundredweight",
        "hundredweights",
        "s cwt",
        "scwt",
        "avoirdupois"
      ],
      "printSymbol": null
    },
    {
      "code": "[lcwt_av]",
      "CODE": "[LCWT_AV]",
      "value": {
        "unit": "[lb_av]",
        "UNIT": "[LB_AV]",
        "value": "112",
        "text": "112"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "long hundredweight",
        "imperial hundredweights",
        "imp cwt",
        "lcwt",
        "avoirdupois"
      ],
      "printSymbol": null
    },
    {
      "code": "[ston_av]",
      "CODE": "[STON_AV]",
      "value": {
        "unit": "[scwt_av]",
        "UNIT": "[SCWT_AV]",
        "value": "20",
        "text": "20"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["short ton - US", "ton", "US tons", "avoirdupois tons"],
      "printSymbol": null
    },
    {
      "code": "[lton_av]",
      "CODE": "[LTON_AV]",
      "value": {
        "unit": "[lcwt_av]",
        "UNIT": "[LCWT_AV]",
        "value": "20",
        "text": "20"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "long ton - British",
        "imperial tons",
        "weight tons",
        "British long tons",
        "long ton avoirdupois"
      ],
      "printSymbol": null
    },
    {
      "code": "[stone_av]",
      "CODE": "[STONE_AV]",
      "value": {
        "unit": "[lb_av]",
        "UNIT": "[LB_AV]",
        "value": "14",
        "text": "14"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["stone - British", "British stones", "avoirdupois"],
      "printSymbol": null
    },
    {
      "code": "[pwt_tr]",
      "CODE": "[PWT_TR]",
      "value": {"unit": "[gr]", "UNIT": "[GR]", "value": "24", "text": "24"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["pennyweight - troy", "dwt", "denarius weights"],
      "printSymbol": null
    },
    {
      "code": "[oz_tr]",
      "CODE": "[OZ_TR]",
      "value": {
        "unit": "[pwt_tr]",
        "UNIT": "[PWT_TR]",
        "value": "20",
        "text": "20"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["ounce - troy", "troy ounces", "tr ozs"],
      "printSymbol": null
    },
    {
      "code": "[lb_tr]",
      "CODE": "[LB_TR]",
      "value": {
        "unit": "[oz_tr]",
        "UNIT": "[OZ_TR]",
        "value": "12",
        "text": "12"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["pound - troy", "troy pounds", "tr lbs"],
      "printSymbol": null
    },
    {
      "code": "[sc_ap]",
      "CODE": "[SC_AP]",
      "value": {"unit": "[gr]", "UNIT": "[GR]", "value": "20", "text": "20"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["scruple", "scruples", "sc ap"],
      "printSymbol": null
    },
    {
      "code": "[dr_ap]",
      "CODE": "[DR_AP]",
      "value": {
        "unit": "[sc_ap]",
        "UNIT": "[SC_AP]",
        "value": "3",
        "text": "3"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "dram - apothecary",
        "ʒ",
        "drachm",
        "apothecaries drams",
        "dr ap",
        "dram ap"
      ],
      "printSymbol": null
    },
    {
      "code": "[oz_ap]",
      "CODE": "[OZ_AP]",
      "value": {
        "unit": "[dr_ap]",
        "UNIT": "[DR_AP]",
        "value": "8",
        "text": "8"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "ounce - apothecary",
        "apothecary ounces",
        "oz ap",
        "ap ozs",
        "ozs ap"
      ],
      "printSymbol": null
    },
    {
      "code": "[lb_ap]",
      "CODE": "[LB_AP]",
      "value": {
        "unit": "[oz_ap]",
        "UNIT": "[OZ_AP]",
        "value": "12",
        "text": "12"
      },
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "pound - apothecary",
        "apothecary pounds",
        "apothecaries pounds",
        "ap lb",
        "lb ap",
        "ap lbs",
        "lbs ap"
      ],
      "printSymbol": null
    },
    {
      "code": "[oz_m]",
      "CODE": "[OZ_M]",
      "value": {"unit": "g", "UNIT": "g", "value": "28", "text": "28"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["ounce - metric", "metric ounces", "m ozs"],
      "printSymbol": null
    },
    {
      "code": "[lne]",
      "CODE": "[LNE]",
      "value": {
        "unit": "[in_i]/12",
        "UNIT": "[IN_I]/12",
        "value": "1",
        "text": "1"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["line", "British lines", "br L", "L", "l"],
      "printSymbol": null
    },
    {
      "code": "[pnt]",
      "CODE": "[PNT]",
      "value": {
        "unit": "[lne]/6",
        "UNIT": "[LNE]/6",
        "value": "1",
        "text": "1"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "point (typography)",
        "DTP points",
        "desktop publishing point",
        "pt",
        "pnt"
      ],
      "printSymbol": null
    },
    {
      "code": "[pca]",
      "CODE": "[PCA]",
      "value": {"unit": "[pnt]", "UNIT": "[PNT]", "value": "12", "text": "12"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["pica (typography)", "picas"],
      "printSymbol": null
    },
    {
      "code": "[pnt_pr]",
      "CODE": "[PNT_PR]",
      "value": {
        "unit": "[in_i]",
        "UNIT": "[IN_I]",
        "value": "0.013837",
        "text": "0.013837"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Printer's point (typography)", "pnt pr"],
      "printSymbol": null
    },
    {
      "code": "[pca_pr]",
      "CODE": "[PCA_PR]",
      "value": {
        "unit": "[pnt_pr]",
        "UNIT": "[PNT_PR]",
        "value": "12",
        "text": "12"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Printer's pica  (typography)", "pca pr", "Printer's picas"],
      "printSymbol": null
    },
    {
      "code": "[pied]",
      "CODE": "[PIED]",
      "value": {"unit": "cm", "UNIT": "CM", "value": "32.48", "text": "32.48"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["pied", "pieds du roi", "Paris foot", "royal", "French", "feet"],
      "printSymbol": null
    },
    {
      "code": "[pouce]",
      "CODE": "[POUCE]",
      "value": {
        "unit": "[pied]/12",
        "UNIT": "[PIED]/12",
        "value": "1",
        "text": "1"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["pouce", "historical French inches", "French royal inches"],
      "printSymbol": null
    },
    {
      "code": "[ligne]",
      "CODE": "[LIGNE]",
      "value": {
        "unit": "[pouce]/12",
        "UNIT": "[POUCE]/12",
        "value": "1",
        "text": "1"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["ligne", "Paris lines", "lignes"],
      "printSymbol": null
    },
    {
      "code": "[didot]",
      "CODE": "[DIDOT]",
      "value": {
        "unit": "[ligne]/6",
        "UNIT": "[LIGNE]/6",
        "value": "1",
        "text": "1"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "didot",
        "Didot point",
        "dd",
        "Didots Point",
        "didots",
        "points"
      ],
      "printSymbol": null
    },
    {
      "code": "[cicero]",
      "CODE": "[CICERO]",
      "value": {
        "unit": "[didot]",
        "UNIT": "[DIDOT]",
        "value": "12",
        "text": "12"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["cicero", "Didot's pica", "ciceros", "picas"],
      "printSymbol": null
    },
    {
      "code": "[degF]",
      "CODE": "[DEGF]",
      "value": {"unit": "K", "UNIT": null, "value": null, "text": "null"},
      "property": "temperature",
      "isMetric": false,
      "isSpecial": true,
      "class": null,
      "name": ["degrees Fahrenheit", "°F", "deg F"],
      "printSymbol": "°F"
    },
    {
      "code": "[degR]",
      "CODE": "[degR]",
      "value": {"unit": "K/9", "UNIT": "K/9", "value": "5", "text": "5"},
      "property": "temperature",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["degrees Rankine", "°R", "°Ra", "Rankine"],
      "printSymbol": "°R"
    },
    {
      "code": "[degRe]",
      "CODE": "[degRe]",
      "value": {"unit": "K", "UNIT": null, "value": null, "text": "null"},
      "property": "temperature",
      "isMetric": false,
      "isSpecial": true,
      "class": null,
      "name": [
        "degrees Réaumur",
        "°Ré, °Re, °r",
        "Réaumur",
        "degree Reaumur",
        "Reaumur"
      ],
      "printSymbol": "°Ré"
    },
    {
      "code": "cal_[15]",
      "CODE": "CAL_[15]",
      "value": {"unit": "J", "UNIT": "J", "value": "4.1858", "text": "4.1858"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "calorie at 15°C",
        "calorie 15 C",
        "cals 15 C",
        "calories at 15 C"
      ],
      "printSymbol": "cal<sub>15°C</sub>"
    },
    {
      "code": "cal_[20]",
      "CODE": "CAL_[20]",
      "value": {"unit": "J", "UNIT": "J", "value": "4.1819", "text": "4.1819"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "calorie at 20°C",
        "calorie 20 C",
        "cal 20 C",
        "calories at 20 C"
      ],
      "printSymbol": "cal<sub>20°C</sub>"
    },
    {
      "code": "cal_m",
      "CODE": "CAL_M",
      "value": {
        "unit": "J",
        "UNIT": "J",
        "value": "4.19002",
        "text": "4.19002"
      },
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["mean calorie", "mean cals", "mean calories"],
      "printSymbol": "cal<sub>m</sub>"
    },
    {
      "code": "cal_IT",
      "CODE": "CAL_IT",
      "value": {"unit": "J", "UNIT": "J", "value": "4.1868", "text": "4.1868"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international table calorie",
        "calories IT",
        "IT cals",
        "international steam table calories"
      ],
      "printSymbol": "cal<sub>IT</sub>"
    },
    {
      "code": "cal_th",
      "CODE": "CAL_TH",
      "value": {"unit": "J", "UNIT": "J", "value": "4.184", "text": "4.184"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["thermochemical calorie", "thermochemical calories", "th cals"],
      "printSymbol": "cal<sub>th</sub>"
    },
    {
      "code": "cal",
      "CODE": "CAL",
      "value": {"unit": "cal_th", "UNIT": "CAL_TH", "value": "1", "text": "1"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["calorie", "gram calories", "small calories"],
      "printSymbol": "cal"
    },
    {
      "code": "[Cal]",
      "CODE": "[CAL]",
      "value": {
        "unit": "kcal_th",
        "UNIT": "KCAL_TH",
        "value": "1",
        "text": "1"
      },
      "property": "energy",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["nutrition label Calories", "food calories", "Cal", "kcal"],
      "printSymbol": "Cal"
    },
    {
      "code": "[Btu_39]",
      "CODE": "[BTU_39]",
      "value": {
        "unit": "kJ",
        "UNIT": "kJ",
        "value": "1.05967",
        "text": "1.05967"
      },
      "property": "energy",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "British thermal unit at 39°F",
        "BTU 39F",
        "BTU 39 F",
        "B.T.U. 39 F",
        "B.Th.U. 39 F",
        "BThU 39 F",
        "British thermal units"
      ],
      "printSymbol": "Btu<sub>39°F</sub>"
    },
    {
      "code": "[Btu_59]",
      "CODE": "[BTU_59]",
      "value": {
        "unit": "kJ",
        "UNIT": "kJ",
        "value": "1.0548",
        "text": "1.0548"
      },
      "property": "energy",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "British thermal unit at 59°F",
        "BTU 59 F",
        "BTU 59F",
        "B.T.U. 59 F",
        "B.Th.U. 59 F",
        "BThU 59F",
        "British thermal units"
      ],
      "printSymbol": "Btu<sub>59°F</sub>"
    },
    {
      "code": "[Btu_60]",
      "CODE": "[BTU_60]",
      "value": {
        "unit": "kJ",
        "UNIT": "kJ",
        "value": "1.05468",
        "text": "1.05468"
      },
      "property": "energy",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "British thermal unit at 60°F",
        "BTU 60 F",
        "BTU 60F",
        "B.T.U. 60 F",
        "B.Th.U. 60 F",
        "BThU 60 F",
        "British thermal units 60 F"
      ],
      "printSymbol": "Btu<sub>60°F</sub>"
    },
    {
      "code": "[Btu_m]",
      "CODE": "[BTU_M]",
      "value": {
        "unit": "kJ",
        "UNIT": "kJ",
        "value": "1.05587",
        "text": "1.05587"
      },
      "property": "energy",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "mean British thermal unit",
        "BTU mean",
        "B.T.U. mean",
        "B.Th.U. mean",
        "BThU mean",
        "British thermal units mean",
        ""
      ],
      "printSymbol": "Btu<sub>m</sub>"
    },
    {
      "code": "[Btu_IT]",
      "CODE": "[BTU_IT]",
      "value": {
        "unit": "kJ",
        "UNIT": "kJ",
        "value": "1.05505585262",
        "text": "1.05505585262"
      },
      "property": "energy",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "international table British thermal unit",
        "BTU IT",
        "B.T.U. IT",
        "B.Th.U. IT",
        "BThU IT",
        "British thermal units IT"
      ],
      "printSymbol": "Btu<sub>IT</sub>"
    },
    {
      "code": "[Btu_th]",
      "CODE": "[BTU_TH]",
      "value": {
        "unit": "kJ",
        "UNIT": "kJ",
        "value": "1.05435",
        "text": "1.05435"
      },
      "property": "energy",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "thermochemical British thermal unit",
        "BTU Th",
        "B.T.U. Th",
        "B.Th.U. Th",
        "BThU Th",
        "thermochemical British thermal units"
      ],
      "printSymbol": "Btu<sub>th</sub>"
    },
    {
      "code": "[Btu]",
      "CODE": "[BTU]",
      "value": {
        "unit": "[Btu_th]",
        "UNIT": "[BTU_TH]",
        "value": "1",
        "text": "1"
      },
      "property": "energy",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "British thermal unit",
        "BTU",
        "B.T.U.",
        "B.Th.U.",
        "BThU",
        "British thermal units"
      ],
      "printSymbol": "btu"
    },
    {
      "code": "[HP]",
      "CODE": "[HP]",
      "value": {
        "unit": "[ft_i].[lbf_av]/s",
        "UNIT": "[FT_I].[LBF_AV]/S",
        "value": "550",
        "text": "550"
      },
      "property": "power",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["horsepower - mechanical", "imperial horsepowers"],
      "printSymbol": null
    },
    {
      "code": "tex",
      "CODE": "TEX",
      "value": {"unit": "g/km", "UNIT": "G/KM", "value": "1", "text": "1"},
      "property": "linear mass density (of textile thread)",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["tex", "linear mass density", "texes"],
      "printSymbol": "tex"
    },
    {
      "code": "[den]",
      "CODE": "[DEN]",
      "value": {"unit": "g/9/km", "UNIT": "G/9/KM", "value": "1", "text": "1"},
      "property": "linear mass density (of textile thread)",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Denier (linear mass density)", "den", "deniers"],
      "printSymbol": "den"
    },
    {
      "code": "m[H2O]",
      "CODE": "M[H2O]",
      "value": {
        "unit": "kPa",
        "UNIT": "KPAL",
        "value": "9.80665",
        "text": "9.80665"
      },
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "meter of water column",
        "mH2O",
        "m H2O",
        "meters of water column",
        "metres",
        "pressure"
      ],
      "printSymbol": "m HO<sub><r>2</r></sub>"
    },
    {
      "code": "m[Hg]",
      "CODE": "M[HG]",
      "value": {
        "unit": "kPa",
        "UNIT": "KPAL",
        "value": "133.322",
        "text": "133.322"
      },
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "meter of mercury column",
        "mHg",
        "m Hg",
        "meters of mercury column",
        "metres",
        "pressure"
      ],
      "printSymbol": "m Hg"
    },
    {
      "code": "[in_i'H2O]",
      "CODE": "[IN_I'H2O]",
      "value": {
        "unit": "m[H2O].[in_i]/m",
        "UNIT": "M[H2O].[IN_I]/M",
        "value": "1",
        "text": "1"
      },
      "property": "pressure",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "inch of water column",
        "inches WC",
        "inAq",
        "in H2O",
        "inch of water gauge",
        "iwg",
        "pressure"
      ],
      "printSymbol": "in HO<sub><r>2</r></sub>"
    },
    {
      "code": "[in_i'Hg]",
      "CODE": "[IN_I'HG]",
      "value": {
        "unit": "m[Hg].[in_i]/m",
        "UNIT": "M[HG].[IN_I]/M",
        "value": "1",
        "text": "1"
      },
      "property": "pressure",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["inch of mercury column", "inHg", "in Hg", "pressure", "inches"],
      "printSymbol": "in Hg"
    },
    {
      "code": "[PRU]",
      "CODE": "[PRU]",
      "value": {
        "unit": "mm[Hg].s/ml",
        "UNIT": "MM[HG].S/ML",
        "value": "1",
        "text": "1"
      },
      "property": "fluid resistance",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "peripheral vascular resistance unit",
        "peripheral vascular resistance units",
        "peripheral resistance unit",
        "peripheral resistance units",
        "PRU"
      ],
      "printSymbol": "P.R.U."
    },
    {
      "code": "[wood'U]",
      "CODE": "[WOOD'U]",
      "value": {
        "unit": "mm[Hg].min/L",
        "UNIT": "MM[HG].MIN/L",
        "value": "1",
        "text": "1"
      },
      "property": "fluid resistance",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "Wood unit",
        "hybrid reference units",
        "HRU",
        "mmHg.min/L",
        "vascular resistance"
      ],
      "printSymbol": "Wood U."
    },
    {
      "code": "[diop]",
      "CODE": "[DIOP]",
      "value": {"unit": "m", "UNIT": "/M", "value": "1", "text": "1"},
      "property": "refraction of a lens",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "diopter (lens)",
        "diopters",
        "diop",
        "dioptre",
        "dpt",
        "refractive power"
      ],
      "printSymbol": "dpt"
    },
    {
      "code": "[p'diop]",
      "CODE": "[P'DIOP]",
      "value": {"unit": "rad", "UNIT": null, "value": null, "text": "null"},
      "property": "refraction of a prism",
      "isMetric": false,
      "isSpecial": true,
      "class": null,
      "name": [
        "prism diopter (magnifying power)",
        "diopters",
        "dioptres",
        "p diops",
        "pdiop",
        "dpt",
        "pdptr",
        "Δ",
        "cm/m",
        "centimeter per meter",
        "centimetre",
        "metre"
      ],
      "printSymbol": "PD"
    },
    {
      "code": "%[slope]",
      "CODE": "%[SLOPE]",
      "value": {"unit": "deg", "UNIT": null, "value": null, "text": "null"},
      "property": "slope",
      "isMetric": false,
      "isSpecial": true,
      "class": null,
      "name": ["percent of slope", "% slope", "%slope", "percents slopes"],
      "printSymbol": "%"
    },
    {
      "code": "[mesh_i]",
      "CODE": "[MESH_I]",
      "value": {"unit": "[in_i]", "UNIT": "/[IN_I]", "value": "1", "text": "1"},
      "property": "lineic number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["mesh", "meshes"],
      "printSymbol": null
    },
    {
      "code": "[Ch]",
      "CODE": "[CH]",
      "value": {"unit": "mm/3", "UNIT": "MM/3", "value": "1", "text": "1"},
      "property": "gauge of catheters",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "French (catheter gauge) ",
        "Charrières, French scales",
        "French gauges",
        "Fr, Fg, Ga, FR, Ch"
      ],
      "printSymbol": "Ch"
    },
    {
      "code": "[drp]",
      "CODE": "[DRP]",
      "value": {"unit": "ml/20", "UNIT": "ML/20", "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "drop - metric (1/20 mL)",
        "drop dosing units",
        "metric drops",
        "gtt"
      ],
      "printSymbol": "drp"
    },
    {
      "code": "[hnsf'U]",
      "CODE": "[HNSF'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "x-ray attenuation",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Hounsfield unit", "HU", "units"],
      "printSymbol": "HF"
    },
    {
      "code": "[MET]",
      "CODE": "[MET]",
      "value": {
        "unit": "mL/min/kg",
        "UNIT": "ML/MIN/KG",
        "value": "3.5",
        "text": "3.5"
      },
      "property": "metabolic cost of physical activity",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Metabolic Equivalent of Task ", "metabolic equivalents"],
      "printSymbol": "MET"
    },
    {
      "code": "[hp'_X]",
      "CODE": "[HP'_X]",
      "value": {"unit": "1", "UNIT": null, "value": null, "text": "null"},
      "property": "homeopathic potency (retired)",
      "isMetric": false,
      "isSpecial": true,
      "class": null,
      "name": ["homeopathic potency of decimal series (retired)"],
      "printSymbol": "X"
    },
    {
      "code": "[hp'_C]",
      "CODE": "[HP'_C]",
      "value": {"unit": "1", "UNIT": null, "value": null, "text": "null"},
      "property": "homeopathic potency (retired)",
      "isMetric": false,
      "isSpecial": true,
      "class": null,
      "name": ["homeopathic potency of centesimal series (retired)"],
      "printSymbol": "C"
    },
    {
      "code": "[hp'_M]",
      "CODE": "[HP'_M]",
      "value": {"unit": "1", "UNIT": null, "value": null, "text": "null"},
      "property": "homeopathic potency (retired)",
      "isMetric": false,
      "isSpecial": true,
      "class": null,
      "name": ["homeopathic potency of millesimal series (retired)"],
      "printSymbol": "M"
    },
    {
      "code": "[hp'_Q]",
      "CODE": "[HP'_Q]",
      "value": {"unit": "1", "UNIT": null, "value": null, "text": "null"},
      "property": "homeopathic potency (retired)",
      "isMetric": false,
      "isSpecial": true,
      "class": null,
      "name": ["homeopathic potency of quintamillesimal series (retired)"],
      "printSymbol": "Q"
    },
    {
      "code": "[hp_X]",
      "CODE": "[HP_X]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "homeopathic potency (Hahnemann)",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["homeopathic potency of decimal hahnemannian series"],
      "printSymbol": "X"
    },
    {
      "code": "[hp_C]",
      "CODE": "[HP_C]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "homeopathic potency (Hahnemann)",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["homeopathic potency of centesimal hahnemannian series"],
      "printSymbol": "C"
    },
    {
      "code": "[hp_M]",
      "CODE": "[HP_M]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "homeopathic potency (Hahnemann)",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["homeopathic potency of millesimal hahnemannian series"],
      "printSymbol": "M"
    },
    {
      "code": "[hp_Q]",
      "CODE": "[HP_Q]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "homeopathic potency (Hahnemann)",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["homeopathic potency of quintamillesimal hahnemannian series"],
      "printSymbol": "Q"
    },
    {
      "code": "[kp_X]",
      "CODE": "[KP_X]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "homeopathic potency (Korsakov)",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["homeopathic potency of decimal korsakovian series"],
      "printSymbol": "X"
    },
    {
      "code": "[kp_C]",
      "CODE": "[KP_C]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "homeopathic potency (Korsakov)",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["homeopathic potency of centesimal korsakovian series"],
      "printSymbol": "C"
    },
    {
      "code": "[kp_M]",
      "CODE": "[KP_M]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "homeopathic potency (Korsakov)",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["homeopathic potency of millesimal korsakovian series"],
      "printSymbol": "M"
    },
    {
      "code": "[kp_Q]",
      "CODE": "[KP_Q]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "homeopathic potency (Korsakov)",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["homeopathic potency of quintamillesimal korsakovian series"],
      "printSymbol": "Q"
    },
    {
      "code": "eq",
      "CODE": "EQ",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["equivalent", "equivalents"],
      "printSymbol": "eq"
    },
    {
      "code": "osm",
      "CODE": "OSM",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance (dissolved particles)",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["osmole", "osmoles", "osmols"],
      "printSymbol": "osm"
    },
    {
      "code": "[pH]",
      "CODE": "[PH]",
      "value": {"unit": "mol/l", "UNIT": null, "value": null, "text": "null"},
      "property": "acidity",
      "isMetric": false,
      "isSpecial": true,
      "class": null,
      "name": ["pH", "pH scale"],
      "printSymbol": "pH"
    },
    {
      "code": "g%",
      "CODE": "G%",
      "value": {"unit": "g/dl", "UNIT": "G/DL", "value": "1", "text": "1"},
      "property": "mass concentration",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram percent",
        "gram %",
        "gram%",
        "grams per deciliter",
        "g/dL",
        "gm per dL",
        "gram percents"
      ],
      "printSymbol": "g%"
    },
    {
      "code": "[S]",
      "CODE": "[S]",
      "value": {"unit": "s", "UNIT": "10*-13.S", "value": "1", "text": "1"},
      "property": "sedimentation coefficient",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "Svedberg unit",
        "Sv",
        "10^-13 seconds",
        "100 fs",
        "100 femtoseconds"
      ],
      "printSymbol": "S"
    },
    {
      "code": "[HPF]",
      "CODE": "[HPF]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "view area in microscope",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["high power field (microscope)", "HPF"],
      "printSymbol": "HPF"
    },
    {
      "code": "[LPF]",
      "CODE": "[LPF]",
      "value": {"unit": "1", "UNIT": "1", "value": "100", "text": "100"},
      "property": "view area in microscope",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["low power field (microscope)", "LPF", "fields"],
      "printSymbol": "LPF"
    },
    {
      "code": "kat",
      "CODE": "KAT",
      "value": {"unit": "mol/s", "UNIT": "MOL/S", "value": "1", "text": "1"},
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "katal",
        "mol/secs",
        "moles per second",
        "mol*sec-1",
        "mol*s-1",
        "mol.s-1",
        "katals",
        "catalytic activity",
        "enzymatic",
        "enzyme units",
        "activities"
      ],
      "printSymbol": "kat"
    },
    {
      "code": "U",
      "CODE": "U",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit",
        "micromoles per minute",
        "umol/min",
        "umol per minute",
        "umol min-1",
        "enzymatic activity",
        "enzyme activity"
      ],
      "printSymbol": "U"
    },
    {
      "code": "[iU]",
      "CODE": "[IU]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit - arbitrary",
        "international units",
        "IE",
        "F2"
      ],
      "printSymbol": "IU"
    },
    {
      "code": "[IU]",
      "CODE": "[IU]",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit - arbitrary",
        "international units",
        "IE",
        "F2"
      ],
      "printSymbol": "i.U."
    },
    {
      "code": "[arb'U]",
      "CODE": "[ARB'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["arbitary unit", "arbitary units", "arb units", "arbU"],
      "printSymbol": "arb. U"
    },
    {
      "code": "[USP'U]",
      "CODE": "[USP'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["United States Pharmacopeia unit", "USP U", "USP'U"],
      "printSymbol": "U.S.P."
    },
    {
      "code": "[GPL'U]",
      "CODE": "[GPL'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of anticardiolipin IgG",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "GPL unit",
        "GPL Units",
        "GPL U",
        "IgG anticardiolipin units",
        "IgG Phospholipid"
      ],
      "printSymbol": null
    },
    {
      "code": "[MPL'U]",
      "CODE": "[MPL'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of anticardiolipin IgM",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "MPL unit",
        "MPL units",
        "MPL U",
        "MPL'U",
        "IgM anticardiolipin units",
        "IgM Phospholipid Units"
      ],
      "printSymbol": null
    },
    {
      "code": "[APL'U]",
      "CODE": "[APL'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of anticardiolipin IgA",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "APL unit",
        "APL units",
        "APL U",
        "IgA anticardiolipin",
        "IgA Phospholipid",
        "biologic activity of"
      ],
      "printSymbol": null
    },
    {
      "code": "[beth'U]",
      "CODE": "[BETH'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of factor VIII inhibitor",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Bethesda unit", "BU"],
      "printSymbol": null
    },
    {
      "code": "[anti'Xa'U]",
      "CODE": "[ANTI'XA'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of factor Xa inhibitor (heparin)",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["anti factor Xa unit", "units"],
      "printSymbol": null
    },
    {
      "code": "[todd'U]",
      "CODE": "[TODD'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity antistreptolysin O",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Todd unit", "units"],
      "printSymbol": null
    },
    {
      "code": "[dye'U]",
      "CODE": "[DYE'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of amylase",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Dye unit", "units"],
      "printSymbol": null
    },
    {
      "code": "[smgy'U]",
      "CODE": "[SMGY'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of amylase",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Somogyi unit", "Somogyi units", "smgy U"],
      "printSymbol": null
    },
    {
      "code": "[bdsk'U]",
      "CODE": "[BDSK'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of phosphatase",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Bodansky unit", ""],
      "printSymbol": null
    },
    {
      "code": "[ka'U]",
      "CODE": "[KA'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of phosphatase",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["King-Armstrong unit", "King-Armstrong Units", "King units"],
      "printSymbol": null
    },
    {
      "code": "[knk'U]",
      "CODE": "[KNK'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "arbitrary biologic activity",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Kunkel unit"],
      "printSymbol": null
    },
    {
      "code": "[mclg'U]",
      "CODE": "[MCLG'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "arbitrary biologic activity",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "Mac Lagan unit",
        "galactose index",
        "galactose tolerance test",
        "thymol turbidity test unit",
        "mclg U",
        "units",
        "indexes"
      ],
      "printSymbol": null
    },
    {
      "code": "[tb'U]",
      "CODE": "[TB'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of tuberculin",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["tuberculin unit", "TU", "units"],
      "printSymbol": null
    },
    {
      "code": "[CCID_50]",
      "CODE": "[CCID_50]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property":
          "biologic activity (infectivity) of an infectious agent preparation",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "50% cell culture infectious dose",
        "CCID50",
        "50% cell culture infective doses"
      ],
      "printSymbol": "CCID<sub>50</sub>"
    },
    {
      "code": "[TCID_50]",
      "CODE": "[TCID_50]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property":
          "biologic activity (infectivity) of an infectious agent preparation",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "50% tissue culture infectious dose",
        "TCID50",
        "50% tissue culture infective dose"
      ],
      "printSymbol": "TCID<sub>50</sub>"
    },
    {
      "code": "[EID_50]",
      "CODE": "[EID_50]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property":
          "biologic activity (infectivity) of an infectious agent preparation",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "50% embryo infectious dose",
        "EID50",
        "50% embryo infective doses",
        "EID50 Egg Infective Dosage"
      ],
      "printSymbol": "EID<sub>50</sub>"
    },
    {
      "code": "[PFU]",
      "CODE": "[PFU]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "amount of an infectious agent",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["plaque forming units", "PFU"],
      "printSymbol": "PFU"
    },
    {
      "code": "[FFU]",
      "CODE": "[FFU]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "amount of an infectious agent",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["focus forming units (cells)", "FFU"],
      "printSymbol": "FFU"
    },
    {
      "code": "[CFU]",
      "CODE": "[CFU]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "amount of a proliferating organism",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["colony forming units", "CFU"],
      "printSymbol": "CFU"
    },
    {
      "code": "[IR]",
      "CODE": "[IR]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property":
          "amount of an allergen callibrated through in-vivo testing using the Stallergenes® method.",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["index of reactivity (allergen)", "IR", "indexes"],
      "printSymbol": "IR"
    },
    {
      "code": "[BAU]",
      "CODE": "[BAU]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property":
          "amount of an allergen callibrated through in-vivo testing based on the ID50EAL method of (intradermal dilution for 50mm sum of erythema diameters",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "bioequivalent allergen unit",
        "BAU",
        "Bioequivalent Allergy Units",
        "bioequivalent allergen units"
      ],
      "printSymbol": "BAU"
    },
    {
      "code": "[AU]",
      "CODE": "[AU]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property":
          "procedure defined amount of an allergen using some reference standard",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["allergy unit", "allergy units", "allergen units", "AU"],
      "printSymbol": "AU"
    },
    {
      "code": "[Amb'a'1'U]",
      "CODE": "[AMB'A'1'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "procedure defined amount of the major allergen of ragweed.",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "allergen unit for Ambrosia artemisiifolia",
        "Amb a 1 unit",
        "Antigen E",
        "AgE U",
        "allergen units"
      ],
      "printSymbol": "Amb a 1 U"
    },
    {
      "code": "[PNU]",
      "CODE": "[PNU]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "procedure defined amount of a protein substance",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "protein nitrogen unit (allergen testing)",
        "protein nitrogen units",
        "PNU"
      ],
      "printSymbol": "PNU"
    },
    {
      "code": "[Lf]",
      "CODE": "[LF]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "procedure defined amount of an antigen substance",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Limit of flocculation", "Lf doses"],
      "printSymbol": "Lf"
    },
    {
      "code": "[D'ag'U]",
      "CODE": "[D'AG'U]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property":
          "procedure defined amount of a poliomyelitis d-antigen substance",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["D-antigen unit (polio)", "DAgU", "units"],
      "printSymbol": null
    },
    {
      "code": "[FEU]",
      "CODE": "[FEU]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "amount of fibrinogen broken down into the measured d-dimers",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["fibrinogen equivalent units", "FEU"],
      "printSymbol": null
    },
    {
      "code": "[ELU]",
      "CODE": "[ELU]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "arbitrary ELISA unit",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "ELISA unit",
        "Enzyme-Linked Immunosorbent Assay Units",
        "ELU",
        "EL. U"
      ],
      "printSymbol": null
    },
    {
      "code": "[EU]",
      "CODE": "[EU]",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "Ehrlich unit",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Ehrlich units (urobilinogen)", "EU/dL", "mg{urobilinogen}/dL"],
      "printSymbol": null
    },
    {
      "code": "Np",
      "CODE": "NEP",
      "value": {"unit": "1", "UNIT": null, "value": null, "text": "null"},
      "property": "level",
      "isMetric": true,
      "isSpecial": true,
      "class": null,
      "name": ["neper", "nepers"],
      "printSymbol": "Np"
    },
    {
      "code": "B",
      "CODE": "B",
      "value": {"unit": "1", "UNIT": null, "value": null, "text": "null"},
      "property": "level",
      "isMetric": true,
      "isSpecial": true,
      "class": null,
      "name": ["bel", "bels"],
      "printSymbol": "B"
    },
    {
      "code": "B[SPL]",
      "CODE": "B[SPL]",
      "value": {"unit": "Pa", "UNIT": null, "value": null, "text": "null"},
      "property": "pressure level",
      "isMetric": true,
      "isSpecial": true,
      "class": null,
      "name": ["bel sound pressure", "bel SPL", "B SPL", "sound pressure bels"],
      "printSymbol": "B(SPL)"
    },
    {
      "code": "B[V]",
      "CODE": "B[V]",
      "value": {"unit": "V", "UNIT": null, "value": null, "text": "null"},
      "property": "electric potential level",
      "isMetric": true,
      "isSpecial": true,
      "class": null,
      "name": ["bel volt", "bel V", "B V", "volts bels"],
      "printSymbol": "B(V)"
    },
    {
      "code": "B[mV]",
      "CODE": "B[MV]",
      "value": {"unit": "mV", "UNIT": null, "value": null, "text": "null"},
      "property": "electric potential level",
      "isMetric": true,
      "isSpecial": true,
      "class": null,
      "name": [
        "bel millivolt",
        "bel mV",
        "B mV",
        "millivolt bels",
        "10^-3V bels",
        "10*-3V"
      ],
      "printSymbol": "B(mV)"
    },
    {
      "code": "B[uV]",
      "CODE": "B[UV]",
      "value": {"unit": "uV", "UNIT": null, "value": null, "text": "null"},
      "property": "electric potential level",
      "isMetric": true,
      "isSpecial": true,
      "class": null,
      "name": [
        "bel microvolt",
        "bel uV",
        "B uV",
        "microvolts bels",
        "10^-6V bel",
        "10*-6V bel"
      ],
      "printSymbol": "B(μV)"
    },
    {
      "code": "B[10.nV]",
      "CODE": "B[10.NV]",
      "value": {"unit": "nV", "UNIT": null, "value": null, "text": "null"},
      "property": "electric potential level",
      "isMetric": true,
      "isSpecial": true,
      "class": null,
      "name": ["bel 10 nanovolt", "bel 10 nV", "B 10 nV", "10 nanovolts bels"],
      "printSymbol": "B(10 nV)"
    },
    {
      "code": "B[W]",
      "CODE": "B[W]",
      "value": {"unit": "W", "UNIT": null, "value": null, "text": "null"},
      "property": "power level",
      "isMetric": true,
      "isSpecial": true,
      "class": null,
      "name": ["bel watt", "bel W", "b W", "b Watt", "Watts bels"],
      "printSymbol": "B(W)"
    },
    {
      "code": "B[kW]",
      "CODE": "B[KW]",
      "value": {"unit": "kW", "UNIT": null, "value": null, "text": "null"},
      "property": "power level",
      "isMetric": true,
      "isSpecial": true,
      "class": null,
      "name": [
        "bel kilowatt",
        "bel kW",
        "B kW",
        "kilowatt bel",
        "kW bel",
        "kW B"
      ],
      "printSymbol": "B(kW)"
    },
    {
      "code": "st",
      "CODE": "STR",
      "value": {"unit": "m3", "UNIT": "M3", "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "stere",
        "stère",
        "m3",
        "cubic meter",
        "m^3",
        "meters cubed",
        "metre"
      ],
      "printSymbol": "st"
    },
    {
      "code": "Ao",
      "CODE": "AO",
      "value": {"unit": "nm", "UNIT": "NM", "value": "0.1", "text": "0.1"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Ångström", "Å", "Angstroms", "Ao", "Ångströms"],
      "printSymbol": "Å"
    },
    {
      "code": "b",
      "CODE": "BRN",
      "value": {"unit": "fm2", "UNIT": "FM2", "value": "100", "text": "100"},
      "property": "action area",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["barn", "barns"],
      "printSymbol": "b"
    },
    {
      "code": "att",
      "CODE": "ATT",
      "value": {
        "unit": "kgf/cm2",
        "UNIT": "KGF/CM2",
        "value": "1",
        "text": "1"
      },
      "property": "pressure",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "technical atmosphere",
        "at",
        "tech atm",
        "tech atmosphere",
        "kgf/cm2",
        "atms",
        "atmospheres"
      ],
      "printSymbol": "at"
    },
    {
      "code": "mho",
      "CODE": "MHO",
      "value": {"unit": "S", "UNIT": "S", "value": "1", "text": "1"},
      "property": "electric conductance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["mho", "siemens", "ohm reciprocals", "Ω^−1", "Ω-1"],
      "printSymbol": "mho"
    },
    {
      "code": "[psi]",
      "CODE": "[PSI]",
      "value": {
        "unit": "[lbf_av]/[in_i]2",
        "UNIT": "[LBF_AV]/[IN_I]2",
        "value": "1",
        "text": "1"
      },
      "property": "pressure",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["pound per square inch", "psi", "lb/in2", "lb per in2"],
      "printSymbol": "psi"
    },
    {
      "code": "circ",
      "CODE": "CIRC",
      "value": {
        "unit": "[pi].rad",
        "UNIT": "[PI].RAD",
        "value": "2",
        "text": "2"
      },
      "property": "plane angle",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["circle - plane angle", "angles", "circles"],
      "printSymbol": "circ"
    },
    {
      "code": "sph",
      "CODE": "SPH",
      "value": {
        "unit": "[pi].sr",
        "UNIT": "[PI].SR",
        "value": "4",
        "text": "4"
      },
      "property": "solid angle",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["spere - solid angle", "speres"],
      "printSymbol": "sph"
    },
    {
      "code": "[car_m]",
      "CODE": "[CAR_M]",
      "value": {"unit": "g", "UNIT": "G", "value": "0.2", "text": "0.2"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["metric carat", "carats", "ct", "car m"],
      "printSymbol": "ct<sub>m</sub>"
    },
    {
      "code": "[car_Au]",
      "CODE": "[CAR_AU]",
      "value": {"unit": "/24", "UNIT": "/24", "value": "1", "text": "1"},
      "property": "mass fraction",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["carat of gold alloys", "karats", "k", "kt", "car au", "carats"],
      "printSymbol": "ct<sub><r>Au</r></sub>"
    },
    {
      "code": "[smoot]",
      "CODE": "[SMOOT]",
      "value": {
        "unit": "[in_i]",
        "UNIT": "[IN_I]",
        "value": "67",
        "text": "67"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["Smoot", ""],
      "printSymbol": null
    },
    {
      "code": "[m/s2/Hz^(1/2)]",
      "CODE": "[M/S2/HZ^(1/2)]",
      "value": {
        "unit": "m2/s4/Hz",
        "UNIT": null,
        "value": null,
        "text": "null"
      },
      "property": "amplitude spectral density",
      "isMetric": false,
      "isSpecial": true,
      "class": null,
      "name": [
        "meter per square seconds per square root of hertz",
        "m/s2/(Hz^.5)",
        "m/s2/(Hz^(1/2))",
        "m per s2 per Hz^1/2"
      ],
      "printSymbol": null
    },
    {
      "code": "bit_s",
      "CODE": "BIT_S",
      "value": {"unit": "1", "UNIT": null, "value": null, "text": "null"},
      "property": "amount of information",
      "isMetric": false,
      "isSpecial": true,
      "class": null,
      "name": ["bit - logarithmic", "bit-s", "bit s", "bit logarithmic"],
      "printSymbol": "bit<sub>s</sub>"
    },
    {
      "code": "bit",
      "CODE": "BIT",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "amount of information",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["bit", "bits"],
      "printSymbol": "bit"
    },
    {
      "code": "By",
      "CODE": "BY",
      "value": {"unit": "bit", "UNIT": "bit", "value": "8", "text": "8"},
      "property": "amount of information",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["byte", "bytes"],
      "printSymbol": "B"
    },
    {
      "code": "Bd",
      "CODE": "BD",
      "value": {"unit": "s", "UNIT": "/s", "value": "1", "text": "1"},
      "property": "signal transmission rate",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["baud", "Bd", "bauds"],
      "printSymbol": "Bd"
    },
    {
      "code": "/(12.h)",
      "CODE": "/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per twelve hour", "per 12 hours", "12hrs", "12 hrs", "/12hrs"],
      "printSymbol": "/h"
    },
    {
      "code": "/[arb'U]",
      "CODE": "/[ARB'U]",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per arbitrary unit", "/arbU"],
      "printSymbol": "/arb/ U"
    },
    {
      "code": "/[HPF]",
      "CODE": "/[HPF]",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per high power field", "/HPF", "per HPF"],
      "printSymbol": "/HPF"
    },
    {
      "code": "/[IU]",
      "CODE": "/[IU]",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "per international unit",
        "international units",
        "/IU",
        "per IU"
      ],
      "printSymbol": "/i/U."
    },
    {
      "code": "/[LPF]",
      "CODE": "/[LPF]",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per low power field", "/LPF", "per LPF"],
      "printSymbol": "/LPF"
    },
    {
      "code": "/10*10",
      "CODE": "/10*10",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per 10 billion  ", "/10^10", "per 10*10"],
      "printSymbol": "/10<sup>10<.sup>"
    },
    {
      "code": "/10*12",
      "CODE": "/10*12",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per trillion ", "/10^12", "per 10*12"],
      "printSymbol": "/10<sup>12<.sup>"
    },
    {
      "code": "/10*3",
      "CODE": "/10*3",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per thousand", "/10^3", "per 10*3"],
      "printSymbol": "/10<sup>3<.sup>"
    },
    {
      "code": "/10*6",
      "CODE": "/10*6",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per million", "/10^6", "per 10*6", ""],
      "printSymbol": "/10<sup>6<.sup>"
    },
    {
      "code": "/10*9",
      "CODE": "/10*9",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per billion", "/10^9", "per 10*9"],
      "printSymbol": "/10<sup>9<.sup>"
    },
    {
      "code": "/100",
      "CODE": "",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per 100", "per hundred", "10^2", "10*2"],
      "printSymbol": null
    },
    {
      "code": "/100{cells}",
      "CODE": "",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per 100 cells", "/100 cells", "/100cells", "per hundred"],
      "printSymbol": null
    },
    {
      "code": "/100{neutrophils}",
      "CODE": "",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "per 100 neutrophils",
        "/100 neutrophils",
        "/100neutrophils",
        "per hundred"
      ],
      "printSymbol": null
    },
    {
      "code": "/100{spermatozoa}",
      "CODE": "",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "per 100 spermatozoa",
        "/100 spermatozoa",
        "/100spermatozoa",
        "per hundred"
      ],
      "printSymbol": null
    },
    {
      "code": "/100{WBCs}",
      "CODE": "",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "per 100 white blood cells",
        "/100 WBCs",
        "/100WBCs",
        "per hundred"
      ],
      "printSymbol": null
    },
    {
      "code": "/a",
      "CODE": "/ANN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per year", "/Years", "/yrs", "yearly"],
      "printSymbol": "/a"
    },
    {
      "code": "/cm[H2O]",
      "CODE": "/CM[H2O]",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "per centimeter of water",
        "/cmH2O",
        "/cm H2O",
        "centimeters",
        "centimetres"
      ],
      "printSymbol": "/cm HO<sub><r>2<.r></sub>"
    },
    {
      "code": "/d",
      "CODE": "/D",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per day", "/dy", "per day"],
      "printSymbol": "/d"
    },
    {
      "code": "/dL",
      "CODE": "/DL",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per deciliter", "per dL", "/deciliter", "decilitre"],
      "printSymbol": "/dL"
    },
    {
      "code": "/g",
      "CODE": "/G",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per gram", "/gm", "/gram", "per g"],
      "printSymbol": "/g"
    },
    {
      "code": "/h",
      "CODE": "/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per hour", "/hr", "/hour", "per hr"],
      "printSymbol": "/h"
    },
    {
      "code": "/kg",
      "CODE": "/KG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per kilogram", "per kg", "per kilogram"],
      "printSymbol": "/kg"
    },
    {
      "code": "/L",
      "CODE": "/L",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per liter", "/liter", "litre"],
      "printSymbol": "/L"
    },
    {
      "code": "/m2",
      "CODE": "/M2",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "per square meter",
        "/m^2",
        "/m*2",
        "/sq. m",
        "per square meter",
        "meter squared",
        "metre"
      ],
      "printSymbol": "/m<sup>2<.sup>"
    },
    {
      "code": "/m3",
      "CODE": "/M3",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "per cubic meter",
        "/m^3",
        "/m*3",
        "/cu. m",
        "per cubic meter",
        "meter cubed",
        "per m3",
        "metre"
      ],
      "printSymbol": "/m<sup>3<.sup>"
    },
    {
      "code": "/mg",
      "CODE": "/MG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per milligram", "/milligram", "per mg"],
      "printSymbol": "/mg"
    },
    {
      "code": "/min",
      "CODE": "/MIN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per minute", "/minute", "per mins", "breaths beats per minute"],
      "printSymbol": "/min"
    },
    {
      "code": "/mL",
      "CODE": "/ML",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per milliliter", "/milliliter", "per mL", "millilitre"],
      "printSymbol": "/mL"
    },
    {
      "code": "/mm",
      "CODE": "/MM",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per millimeter", "/millimeter", "per mm", "millimetre"],
      "printSymbol": "/mm"
    },
    {
      "code": "/mo",
      "CODE": "/MO",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per month", "/month", "per mo", "monthly", "month"],
      "printSymbol": "/mo"
    },
    {
      "code": "/s",
      "CODE": "/S",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "per second",
        "/second",
        "/sec",
        "per sec",
        "frequency",
        "Hertz",
        "Herz",
        "Hz",
        "becquerels",
        "Bq",
        "s-1",
        "s^-1"
      ],
      "printSymbol": "/s"
    },
    {
      "code": "/U",
      "CODE": "/U",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per enzyme unit", "/enzyme units", "per U"],
      "printSymbol": "/U"
    },
    {
      "code": "/uL",
      "CODE": "/UL",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per microliter", "/microliter", "microlitre", "/mcl", "per uL"],
      "printSymbol": "/μL"
    },
    {
      "code": "/wk",
      "CODE": "/WK",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["per week", "/week", "per wk", "weekly, weeks"],
      "printSymbol": "/wk"
    },
    {
      "code": "[APL'U]/mL",
      "CODE": "[APL'U]/ML",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of anticardiolipin IgA",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "APL unit per milliliter",
        "APL/mL",
        "APL'U/mL",
        "APL U/mL",
        "APL/milliliter",
        "IgA anticardiolipin units per milliliter",
        "IgA Phospholipid Units",
        "millilitre",
        "biologic activity of"
      ],
      "printSymbol": "/mL"
    },
    {
      "code": "[arb'U]/mL",
      "CODE": "[ARB'U]/ML",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "arbitrary unit per milliliter",
        "arb'U/mL",
        "arbU/mL",
        "arb U/mL",
        "arbitrary units per milliliter",
        "millilitre"
      ],
      "printSymbol": "(arb. U)/mL"
    },
    {
      "code": "[CFU]/L",
      "CODE": "[CFU]/L",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "amount of a proliferating organism",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["colony forming units per liter", "CFU per Liter", "CFU/L"],
      "printSymbol": "CFU/L"
    },
    {
      "code": "[CFU]/mL",
      "CODE": "[CFU]/ML",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "amount of a proliferating organism",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["colony forming units per milliliter", "CFU per mL", "CFU/mL"],
      "printSymbol": "CFU/mL"
    },
    {
      "code": "[ft_us]/[ft_us]",
      "CODE": "[FT_US]/[FT_US]",
      "value": {
        "unit": "m/3937",
        "UNIT": "M/3937",
        "value": "1200",
        "text": "1200"
      },
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "foot per foot - US",
        "ft/ft",
        "ft per ft",
        "feet per feet",
        "visual acuity"
      ],
      "printSymbol": "(ft<sub>us</sub>)/(ft<sub>us</sub>)"
    },
    {
      "code": "[GPL'U]/mL",
      "CODE": "[GPL'U]/ML",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of anticardiolipin IgG",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "GPL unit per milliliter",
        "GPL U/mL",
        "GPL'U/mL",
        "GPL/mL",
        "GPL U per mL",
        "IgG Phospholipid Units per milliliters",
        "IgG anticardiolipin units",
        "millilitres"
      ],
      "printSymbol": "/mL"
    },
    {
      "code": "[IU]/(2.h)",
      "CODE": "[IU]/HR",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit per 2 hour",
        "IU/2hrs",
        "IU/2 hours",
        "IU per 2 hrs",
        "international units per 2 hours"
      ],
      "printSymbol": "(i.U.)/h"
    },
    {
      "code": "[IU]/(24.h)",
      "CODE": "[IU]/HR",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit per 24 hour",
        "IU/24hr",
        "IU/24 hours",
        "IU per 24 hrs",
        "international units per 24 hours"
      ],
      "printSymbol": "(i.U.)/h"
    },
    {
      "code": "[IU]/d",
      "CODE": "[IU]/D",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit per day",
        "IU/dy",
        "IU/days",
        "IU per dys",
        "international units per day"
      ],
      "printSymbol": "(i.U.)/d"
    },
    {
      "code": "[IU]/dL",
      "CODE": "[IU]/DL",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit per deciliter",
        "IU/dL",
        "IU per dL",
        "international units per deciliters",
        "decilitres"
      ],
      "printSymbol": "(i.U.)/dL"
    },
    {
      "code": "[IU]/g",
      "CODE": "[IU]/G",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit per gram",
        "IU/gm",
        "IU/gram",
        "IU per gm",
        "IU per g",
        "international units per gram"
      ],
      "printSymbol": "(i.U.)/g"
    },
    {
      "code": "[IU]/h",
      "CODE": "[IU]/HR",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit per hour",
        "IU/hrs",
        "IU per hours",
        "international units per hour"
      ],
      "printSymbol": "(i.U.)/h"
    },
    {
      "code": "[IU]/kg",
      "CODE": "[IU]/KG",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit per kilogram",
        "IU/kg",
        "IU/kilogram",
        "IU per kg",
        "units"
      ],
      "printSymbol": "(i.U.)/kg"
    },
    {
      "code": "[IU]/kg/d",
      "CODE": "([IU]/KG)/D",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit per kilogram per day",
        "IU/kg/dy",
        "IU/kg/day",
        "IU/kilogram/day",
        "IU per kg per day",
        "units"
      ],
      "printSymbol": "((i.U.)/kg)/d"
    },
    {
      "code": "[IU]/L",
      "CODE": "[IU]/L",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit per liter",
        "IU/L",
        "IU/liter",
        "IU per liter",
        "units",
        "litre"
      ],
      "printSymbol": "(i.U.)/L"
    },
    {
      "code": "[IU]/min",
      "CODE": "[IU]/MIN",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit per minute",
        "IU/min",
        "IU/minute",
        "IU per minute",
        "international units"
      ],
      "printSymbol": "(i.U.)/min"
    },
    {
      "code": "[IU]/mL",
      "CODE": "[IU]/ML",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "international unit per milliliter",
        "IU/mL",
        "IU per mL",
        "international units per milliliter",
        "millilitre"
      ],
      "printSymbol": "(i.U.)/mL"
    },
    {
      "code": "[MPL'U]/mL",
      "CODE": "[MPL'U]/ML",
      "value": {"unit": "1", "UNIT": "1", "value": "1", "text": "1"},
      "property": "biologic activity of anticardiolipin IgM",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "MPL unit per milliliter",
        "MPL/mL",
        "MPL U/mL",
        "MPL'U/mL",
        "IgM anticardiolipin units",
        "IgM Phospholipid Units",
        "millilitre"
      ],
      "printSymbol": "/mL"
    },
    {
      "code": "{#}/[HPF]",
      "CODE": "/[HPF]",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "number per high power field",
        "#/HPF",
        "# per HPF",
        "number/HPF",
        "numbers per high power field"
      ],
      "printSymbol": "/HPF"
    },
    {
      "code": "{#}/[LPF]",
      "CODE": "/[LPF]",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "number per low power field",
        "#/LPF",
        "# per LPF",
        "number/LPF",
        "numbers per low power field"
      ],
      "printSymbol": "/LPF"
    },
    {
      "code": "{APS'U}",
      "CODE": "",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "IgA antiphosphatidylserine unit ",
        "APS Unit",
        "Phosphatidylserine Antibody IgA Units"
      ],
      "printSymbol": null
    },
    {
      "code": "{EIA_index}",
      "CODE": "",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["EIA index", "enzyme immunoassay index"],
      "printSymbol": null
    },
    {
      "code": "{KCT'U}",
      "CODE": "",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["kaolin clotting time", "KCT"],
      "printSymbol": null
    },
    {
      "code": "{MPS'U}",
      "CODE": "",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "IgM antiphosphatidylserine unit",
        "Phosphatidylserine Antibody IgM Measurement"
      ],
      "printSymbol": null
    },
    {
      "code": "10*12/L",
      "CODE": "(10*12)/L",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "trillion per liter",
        "10^12/L",
        "10*12 per Liter",
        "trillion per liter",
        "litre"
      ],
      "printSymbol": "(10<sup>12</sup>)/L"
    },
    {
      "code": "10*3",
      "CODE": "10*3",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["10^3 (used for cell count)", "10^3", "thousand"],
      "printSymbol": "10<sup>3</sup>"
    },
    {
      "code": "10*3/L",
      "CODE": "(10*3)/L",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["thousand per liter", "10^3/L", "10*3 per liter", "litre"],
      "printSymbol": "(10<sup>3</sup>)/L"
    },
    {
      "code": "10*3/mL",
      "CODE": "(10*3)/ML",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "thousand per milliliter",
        "10^3/mL",
        "10*3 per mL",
        "thousand per milliliter",
        "millilitre"
      ],
      "printSymbol": "(10<sup>3</sup>)/mL"
    },
    {
      "code": "10*3/uL",
      "CODE": "(10*3)/UL",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "thousand per microliter",
        "10^3/uL",
        "10*3 per uL",
        "thousand per microliter",
        "microlitre"
      ],
      "printSymbol": "(10<sup>3</sup>)/μL"
    },
    {
      "code": "10*4/uL",
      "CODE": "(10*4)/UL",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "10 thousand per microliter",
        "10^4/uL",
        "10*4 per uL",
        "microlitre"
      ],
      "printSymbol": "(10<sup>4</sup>)/μL"
    },
    {
      "code": "10*5",
      "CODE": "10*5",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["10^5 ", "one hundred thousand"],
      "printSymbol": "10<sup>5</sup>"
    },
    {
      "code": "10*6",
      "CODE": "10*6",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["10^6", ""],
      "printSymbol": "10<sup>6</sup>"
    },
    {
      "code": "10*6.[CFU]/L",
      "CODE": "((10*6).[CFU])/L",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "million colony forming unit per liter",
        "10*6 CFU/L",
        "10^6 CFU/L",
        "10^6CFU",
        "10^6 CFU per liter",
        "million colony forming units",
        "litre"
      ],
      "printSymbol": "((10<sup>6</sup>).CFU)/L"
    },
    {
      "code": "10*6.[IU]",
      "CODE": "(10*6).[IU]",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "million international unit",
        "10*6 IU",
        "10^6 IU",
        "international units"
      ],
      "printSymbol": "(10<sup>6</sup>).(i.U.)"
    },
    {
      "code": "10*6/(24.h)",
      "CODE": "(10*6)/HR",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "million per 24 hour",
        "10*6/24hrs",
        "10^6/24 hrs",
        "10*6 per 24 hrs",
        "10^6 per 24 hours"
      ],
      "printSymbol": "(10<sup>6</sup>)/h"
    },
    {
      "code": "10*6/kg",
      "CODE": "(10*6)/KG",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "million per kilogram",
        "10^6/kg",
        "10*6 per kg",
        "10*6 per kilogram",
        "millions"
      ],
      "printSymbol": "(10<sup>6</sup>)/kg"
    },
    {
      "code": "10*6/L",
      "CODE": "(10*6)/L",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "million per liter",
        "10^6/L",
        "10*6 per Liter",
        "10^6 per Liter",
        "litre"
      ],
      "printSymbol": "(10<sup>6</sup>)/L"
    },
    {
      "code": "10*6/mL",
      "CODE": "(10*6)/ML",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "million per milliliter",
        "10^6/mL",
        "10*6 per mL",
        "10*6 per milliliter",
        "millilitre"
      ],
      "printSymbol": "(10<sup>6</sup>)/mL"
    },
    {
      "code": "10*6/uL",
      "CODE": "(10*6)/UL",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "million per microliter",
        "10^6/uL",
        "10^6 per uL",
        "10^6/mcl",
        "10^6 per mcl",
        "10^6 per microliter",
        "microlitre"
      ],
      "printSymbol": "(10<sup>6</sup>)/μL"
    },
    {
      "code": "10*8",
      "CODE": "10*8",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["10^8", "100 million", "one hundred million", "10^8"],
      "printSymbol": "10<sup>8</sup>"
    },
    {
      "code": "10*9/L",
      "CODE": "(10*9)/L",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["billion per liter", "10^9/L", "10*9 per Liter", "litre"],
      "printSymbol": "(10<sup>9</sup>)/L"
    },
    {
      "code": "10*9/mL",
      "CODE": "(10*9)/ML",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "billion per milliliter",
        "10^9/mL",
        "10*9 per mL",
        "10^9 per mL",
        "10*9 per milliliter",
        "millilitre"
      ],
      "printSymbol": "(10<sup>9</sup>)/mL"
    },
    {
      "code": "10*9/uL",
      "CODE": "(10*9)/UL",
      "value": {"unit": "1", "UNIT": "1", "value": "10", "text": "10"},
      "property": "number",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "billion per microliter",
        "10^9/uL",
        "10^9 per uL",
        "10^9/mcl",
        "10^9 per mcl",
        "10*9 per uL",
        "10*9 per mcl",
        "10*9/mcl",
        "10^9 per microliter",
        "microlitre"
      ],
      "printSymbol": "(10<sup>9</sup>)/μL"
    },
    {
      "code": "10.L/(min.m2)",
      "CODE": "L/(MIN.M2)",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "10 liter per minute per square meter",
        "10 liters per minutes per square meter",
        "10 L per min per m2",
        "m^2",
        "10 L/(min*m2)",
        "10L/(min*m^2)",
        "litres",
        "sq. meter",
        "metre",
        "meters squared"
      ],
      "printSymbol": "L/(min.(m<sup>2</sup>))"
    },
    {
      "code": "10.L/min",
      "CODE": "L/MIN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "10 liter per minute",
        "10 liters per minute",
        "10 L per min",
        "10L",
        "10 L/min",
        "litre"
      ],
      "printSymbol": "L/min"
    },
    {
      "code": "10.uN.s/(cm5.m2)",
      "CODE": "(UN.S)/(CM5.M2)",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "10 micronewton second per centimeter to the fifth power per square meter",
        "dyne seconds per centimeter5 and square meter",
        "dyn.s/(cm5.m2)",
        "dyn.s/cm5/m2",
        "cm^5",
        "m^2"
      ],
      "printSymbol": "(μN.s)/(cm<sup>5</sup>).(m<sup>2</sup>)"
    },
    {
      "code": "24.h",
      "CODE": "HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["24 hour", "24hrs", "24 hrs", "24 hours", "days", "dy"],
      "printSymbol": "h"
    },
    {
      "code": "A/m",
      "CODE": "A/M",
      "value": {"unit": "C/s", "UNIT": "C/S", "value": "1", "text": "1"},
      "property": "electric current",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "ampere per meter",
        "A/m",
        "amp/meter",
        "magnetic field strength",
        "H",
        "B",
        "amperes per meter",
        "metre"
      ],
      "printSymbol": "A/m"
    },
    {
      "code": "cg",
      "CODE": "CG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["centigram", "centigrams", "cg", "cgm"],
      "printSymbol": "cg"
    },
    {
      "code": "cL",
      "CODE": "CL",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["centiliter", "centiliters", "centilitres"],
      "printSymbol": "cL"
    },
    {
      "code": "cm",
      "CODE": "CM",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["centimeter", "centimeters", "centimetres"],
      "printSymbol": "cm"
    },
    {
      "code": "cm[H2O]",
      "CODE": "CM[H2O]",
      "value": {
        "unit": "kPa",
        "UNIT": "KPAL",
        "value": "9.80665",
        "text": "9.80665"
      },
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "centimeter of water",
        "cm H2O",
        "cmH2O",
        "centimetres",
        "pressure"
      ],
      "printSymbol": "cm HO<sub><r>2</r></sub>"
    },
    {
      "code": "cm[H2O]/L/s",
      "CODE": "(CM[H2O]/L)/S",
      "value": {
        "unit": "kPa",
        "UNIT": "KPAL",
        "value": "9.80665",
        "text": "9.80665"
      },
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "centimeter of water per liter per second",
        "cm[H2O]/(L/s)",
        "cm[H2O].s/L",
        "cm H2O/L/sec",
        "cmH2O/L/sec",
        "cmH2O/Liter",
        "cmH2O per L per secs",
        "centimeters of water per liters per second",
        "centimetres",
        "litres",
        "cm[H2O]/(L/s)"
      ],
      "printSymbol": "((cm HO<sub><r>2</r></sub>)/L)/s"
    },
    {
      "code": "cm[H2O]/s/m",
      "CODE": "(CM[H2O]/S)/M",
      "value": {
        "unit": "kPa",
        "UNIT": "KPAL",
        "value": "9.80665",
        "text": "9.80665"
      },
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "centimeter of water per second per meter",
        "cm[H2O]/(s.m)",
        "cm H2O/s/m",
        "cmH2O",
        "cmH2O/sec/m",
        "cmH2O per secs per meters",
        "centimeters of water per seconds per meter",
        "centimetres",
        "metre"
      ],
      "printSymbol": "((cm HO<sub><r>2</r></sub>)/s)/m"
    },
    {
      "code": "cm[Hg]",
      "CODE": "CM[HG]",
      "value": {
        "unit": "kPa",
        "UNIT": "KPAL",
        "value": "133.322",
        "text": "133.322"
      },
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "centimeter of mercury",
        "centimeters of mercury",
        "centimetres",
        "cmHg",
        "cm Hg"
      ],
      "printSymbol": "cm Hg"
    },
    {
      "code": "cm2",
      "CODE": "CM2",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "square centimeter",
        "cm^2",
        "sq cm",
        "centimeters squared",
        "square centimeters",
        "centimetre",
        "area"
      ],
      "printSymbol": "cm<sup>2</sup>"
    },
    {
      "code": "cm2/s",
      "CODE": "CM2/S",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "square centimeter per second",
        "cm^2/sec",
        "square centimeters per second",
        "sq cm per sec",
        "cm2",
        "centimeters squared",
        "centimetres"
      ],
      "printSymbol": "(cm<sup>2</sup>)/s"
    },
    {
      "code": "cP",
      "CODE": "CP",
      "value": {
        "unit": "dyn.s/cm2",
        "UNIT": "DYN.S/CM2",
        "value": "1",
        "text": "1"
      },
      "property": "dynamic viscosity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["centipoise", "cps", "centiposes"],
      "printSymbol": "cP"
    },
    {
      "code": "cSt",
      "CODE": "CST",
      "value": {"unit": "cm2/s", "UNIT": "CM2/S", "value": "1", "text": "1"},
      "property": "kinematic viscosity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["centistoke", "centistokes"],
      "printSymbol": "cSt"
    },
    {
      "code": "daL/min",
      "CODE": "DAL/MIN",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "dekaliter per minute",
        "dekalitres",
        "dekaliters per minute",
        "per min"
      ],
      "printSymbol": "daL/min"
    },
    {
      "code": "daL/min/m2",
      "CODE": "(DAL/MIN)/M2",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "dekaliter per minute per square meter",
        "daL/min/m^2",
        "daL/minute/m2",
        "sq. meter",
        "dekaliters per minutes per square meter",
        "meter squared",
        "dekalitres",
        "metre"
      ],
      "printSymbol": "(daL/min)/(m<sup>2</sup>)"
    },
    {
      "code": "dB",
      "CODE": "DB",
      "value": {"unit": "1", "UNIT": null, "value": null, "text": "null"},
      "property": "level",
      "isMetric": true,
      "isSpecial": true,
      "class": null,
      "name": ["decibel", "decibels"],
      "printSymbol": "dB"
    },
    {
      "code": "deg/s",
      "CODE": "DEG/S",
      "value": {
        "unit": "[pi].rad/360",
        "UNIT": "[PI].RAD/360",
        "value": "2",
        "text": "2"
      },
      "property": "plane angle",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "degree per second",
        "deg/sec",
        "deg per sec",
        "°/sec",
        "twist rate",
        "angular speed",
        "rotational speed"
      ],
      "printSymbol": "°/s"
    },
    {
      "code": "dg",
      "CODE": "DG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["decigram", "decigrams", "dgm", "0.1 grams", "1/10 gm"],
      "printSymbol": "dg"
    },
    {
      "code": "dL",
      "CODE": "DL",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["deciliter", "deciliters", "decilitres", "0.1 liters", "1/10 L"],
      "printSymbol": "dL"
    },
    {
      "code": "dm",
      "CODE": "DM",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "decimeter",
        "decimeters",
        "decimetres",
        "0.1 meters",
        "1/10 m",
        "10 cm",
        "centimeters"
      ],
      "printSymbol": "dm"
    },
    {
      "code": "dm2/s2",
      "CODE": "DM2/S2",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "square decimeter per square second",
        "dm2 per s2",
        "dm^2/s^2",
        "decimeters squared per second squared",
        "sq dm",
        "sq sec"
      ],
      "printSymbol": "(dm<sup>2</sup>)/(s<sup>2</sup>)"
    },
    {
      "code": "dyn.s/(cm.m2)",
      "CODE": "(DYN.S)/(CM.M2)",
      "value": {
        "unit": "g.cm/s2",
        "UNIT": "G.CM/S2",
        "value": "1",
        "text": "1"
      },
      "property": "force",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "dyne second per centimeter per square meter",
        "(dyn*s)/(cm*m2)",
        "(dyn*s)/(cm*m^2)",
        "dyn s per cm per m2",
        "m^2",
        "dyne seconds per centimeters per square meter",
        "centimetres",
        "sq. meter",
        "squared"
      ],
      "printSymbol": "(dyn.s)/(cm.(m<sup>2</sup>))"
    },
    {
      "code": "dyn.s/cm",
      "CODE": "(DYN.S)/CM",
      "value": {
        "unit": "g.cm/s2",
        "UNIT": "G.CM/S2",
        "value": "1",
        "text": "1"
      },
      "property": "force",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "dyne second per centimeter",
        "(dyn*s)/cm",
        "dyn sec per cm",
        "seconds",
        "centimetre",
        "dyne seconds"
      ],
      "printSymbol": "(dyn.s)/cm"
    },
    {
      "code": "eq/L",
      "CODE": "EQ/L",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "equivalent per liter",
        "eq/liter",
        "eq/litre",
        "eqs",
        "equivalents per liter",
        "litre"
      ],
      "printSymbol": "eq/L"
    },
    {
      "code": "eq/mL",
      "CODE": "EQ/ML",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "equivalent per milliliter",
        "equivalent/milliliter",
        "equivalents per milliliter",
        "eq per mL",
        "millilitre"
      ],
      "printSymbol": "eq/mL"
    },
    {
      "code": "eq/mmol",
      "CODE": "EQ/MMOL",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "equivalent per millimole",
        "equivalent/millimole",
        "equivalents per millimole",
        "eq per mmol"
      ],
      "printSymbol": "eq/mmol"
    },
    {
      "code": "eq/umol",
      "CODE": "EQ/UMOL",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "equivalent per micromole",
        "equivalent/micromole",
        "equivalents per micromole",
        "eq per umol"
      ],
      "printSymbol": "eq/μmol"
    },
    {
      "code": "fg",
      "CODE": "FG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["femtogram", "fg", "fgm", "femtograms", "weight"],
      "printSymbol": "fg"
    },
    {
      "code": "fL",
      "CODE": "FL",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["femtoliter", "femtolitres", "femtoliters"],
      "printSymbol": "fL"
    },
    {
      "code": "fm",
      "CODE": "FM",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["femtometer", "femtometres", "femtometers"],
      "printSymbol": "fm"
    },
    {
      "code": "fmol",
      "CODE": "FMOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["femtomole", "femtomoles"],
      "printSymbol": "fmol"
    },
    {
      "code": "fmol/g",
      "CODE": "FMOL/G",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["femtomole per gram", "femtomoles", "fmol/gm", "fmol per gm"],
      "printSymbol": "fmol/g"
    },
    {
      "code": "fmol/L",
      "CODE": "FMOL/L",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["femtomole per liter", "femtomoles", "fmol per liter", "litre"],
      "printSymbol": "fmol/L"
    },
    {
      "code": "fmol/mg",
      "CODE": "FMOL/MG",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["femtomole per milligram", "fmol per mg", "femtomoles"],
      "printSymbol": "fmol/mg"
    },
    {
      "code": "fmol/mL",
      "CODE": "FMOL/ML",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "femtomole per milliliter",
        "femtomoles",
        "millilitre",
        "fmol per mL",
        "fmol per milliliter"
      ],
      "printSymbol": "fmol/mL"
    },
    {
      "code": "g.m",
      "CODE": "G.M",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["gram meter", "g*m", "gxm", "meters", "metres"],
      "printSymbol": "g.m"
    },
    {
      "code": "g/(100.g)",
      "CODE": "G/G",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per 100 gram",
        "g/100 gm",
        "100gm",
        "grams per 100 grams",
        "gm per 100 gm"
      ],
      "printSymbol": "g/g"
    },
    {
      "code": "g/(12.h)",
      "CODE": "G/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per 12 hour",
        "gm/12hrs",
        "12 hrs",
        "gm per 12 hrs",
        "12hrs",
        "grams per 12 hours"
      ],
      "printSymbol": "g/h"
    },
    {
      "code": "g/(24.h)",
      "CODE": "G/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per 24 hour",
        "gm/24hrs",
        "gm/24 hrs",
        "gm per 24 hrs",
        "24hrs",
        "grams per 24 hours",
        "gm/dy",
        "gm per dy",
        "grams per day"
      ],
      "printSymbol": "g/h"
    },
    {
      "code": "g/(3.d)",
      "CODE": "G/D",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per 3 days",
        "gm/3dy",
        "gm/3 dy",
        "gm per 3 days",
        "grams"
      ],
      "printSymbol": "g/d"
    },
    {
      "code": "g/(4.h)",
      "CODE": "G/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per 4 hour",
        "gm/4hrs",
        "gm/4 hrs",
        "gm per 4 hrs",
        "4hrs",
        "grams per 4 hours"
      ],
      "printSymbol": "g/h"
    },
    {
      "code": "g/(48.h)",
      "CODE": "G/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per 48 hour",
        "gm/48hrs",
        "gm/48 hrs",
        "gm per 48 hrs",
        "48hrs",
        "grams per 48 hours"
      ],
      "printSymbol": "g/h"
    },
    {
      "code": "g/(5.h)",
      "CODE": "G/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per 5 hour",
        "gm/5hrs",
        "gm/5 hrs",
        "gm per 5 hrs",
        "5hrs",
        "grams per 5 hours"
      ],
      "printSymbol": "g/h"
    },
    {
      "code": "g/(6.h)",
      "CODE": "G/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per 6 hour",
        "gm/6hrs",
        "gm/6 hrs",
        "gm per 6 hrs",
        "6hrs",
        "grams per 6 hours"
      ],
      "printSymbol": "g/h"
    },
    {
      "code": "g/(72.h)",
      "CODE": "G/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per 72 hour",
        "gm/72hrs",
        "gm/72 hrs",
        "gm per 72 hrs",
        "72hrs",
        "grams per 72 hours"
      ],
      "printSymbol": "g/h"
    },
    {
      "code": "g/cm3",
      "CODE": "G/CM3",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per cubic centimeter",
        "g/cm^3",
        "gm per cm3",
        "g per cm^3",
        "grams per centimeter cubed",
        "cu. cm",
        "centimetre",
        "g/mL",
        "gram per milliliter",
        "millilitre"
      ],
      "printSymbol": "g/(cm<sup>3</sup>)"
    },
    {
      "code": "g/d",
      "CODE": "G/D",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per day",
        "gm/dy",
        "gm per dy",
        "grams per day",
        "gm/24hrs",
        "gm/24 hrs",
        "gm per 24 hrs",
        "24hrs",
        "grams per 24 hours",
        "serving"
      ],
      "printSymbol": "g/d"
    },
    {
      "code": "g/dL",
      "CODE": "G/DL",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per deciliter",
        "gm/dL",
        "gm per dL",
        "grams per deciliter",
        "decilitre"
      ],
      "printSymbol": "g/dL"
    },
    {
      "code": "g/g",
      "CODE": "G/G",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["gram per gram", "gm", "grams"],
      "printSymbol": "g/g"
    },
    {
      "code": "g/h",
      "CODE": "G/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per hour",
        "gm/hr",
        "gm per hr",
        "grams",
        "intake",
        "output"
      ],
      "printSymbol": "g/h"
    },
    {
      "code": "g/h/m2",
      "CODE": "(G/HR)/M2",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per hour per square meter",
        "gm/hr/m2",
        "gm/h/m2",
        "/m^2",
        "sq. m",
        "g per hr per m2",
        "grams per hours per square meter",
        "meter squared",
        "metre"
      ],
      "printSymbol": "(g/h)/(m<sup>2</sup>)"
    },
    {
      "code": "g/kg ",
      "CODE": "G/KG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["gram per kilogram", "g per kg", "gram per kilograms"],
      "printSymbol": "g/kg"
    },
    {
      "code": "g/kg/(8.h)",
      "CODE": "(G/KG)/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per kilogram per 8 hour ",
        "g/(8.kg.h)",
        "gm/kg/8hrs",
        "8 hrs",
        "g per kg per 8 hrs",
        "8hrs",
        "grams per kilograms per 8 hours",
        "shift"
      ],
      "printSymbol": "(g/kg)/h"
    },
    {
      "code": "g/kg/d",
      "CODE": "(G/KG)/D",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per kilogram per day",
        "g/(kg.d)",
        "gm/kg/dy",
        "gm per kg per dy",
        "grams per kilograms per day"
      ],
      "printSymbol": "(g/kg)/d"
    },
    {
      "code": "g/kg/h",
      "CODE": "(G/KG)/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per kilogram per hour",
        "g/(kg.h)",
        "g/kg/hr",
        "g per kg per hrs",
        "grams per kilograms per hour"
      ],
      "printSymbol": "(g/kg)/h"
    },
    {
      "code": "g/kg/min",
      "CODE": "(G/KG)/MIN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per kilogram per minute",
        "g/(kg.min)",
        "g/kg/min",
        "g per kg per min",
        "grams per kilograms per minute"
      ],
      "printSymbol": "(g/kg)/min"
    },
    {
      "code": "g/L",
      "CODE": "G/L",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per liter",
        "gm per liter",
        "g/liter",
        "grams per liter",
        "litre"
      ],
      "printSymbol": "g/L"
    },
    {
      "code": "g/m2",
      "CODE": "G/M2",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per square meter",
        "g/m^2",
        "gram/square meter",
        "g/sq m",
        "g per m2",
        "g per m^2",
        "grams per square meter",
        "meters squared",
        "metre"
      ],
      "printSymbol": "g/(m<sup>2</sup>)"
    },
    {
      "code": "g/mg",
      "CODE": "G/MG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["gram per milligram", "g per mg", "grams per milligram"],
      "printSymbol": "g/mg"
    },
    {
      "code": "g/min",
      "CODE": "G/MIN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per minute",
        "g per min",
        "grams per minute",
        "gram/minute"
      ],
      "printSymbol": "g/min"
    },
    {
      "code": "g/mL",
      "CODE": "G/ML",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "gram per milliliter",
        "g per mL",
        "grams per milliliter",
        "millilitre"
      ],
      "printSymbol": "g/mL"
    },
    {
      "code": "g/mmol",
      "CODE": "G/MMOL",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["gram per millimole", "grams per millimole", "g per mmol"],
      "printSymbol": "g/mmol"
    },
    {
      "code": "J/L",
      "CODE": "J/L",
      "value": {"unit": "N.m", "UNIT": "N.M", "value": "1", "text": "1"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["joule per liter", "joules per liter", "litre", "J per L"],
      "printSymbol": "J/L"
    },
    {
      "code": "K/W",
      "CODE": "K/W",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "temperature",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "degree Kelvin per Watt",
        "degree Kelvin/Watt",
        "K per W",
        "thermal ohm",
        "thermal resistance",
        "degrees"
      ],
      "printSymbol": "K/W"
    },
    {
      "code": "k[IU]/L",
      "CODE": "K[IU]/L",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilo international unit per liter",
        "kIU/L",
        "kIU per L",
        "kIU per liter",
        "kilo international units",
        "litre",
        "allergens",
        "allergy units"
      ],
      "printSymbol": "(ki.U.)/L"
    },
    {
      "code": "k[IU]/mL",
      "CODE": "K[IU]/ML",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilo international unit per milliliter",
        "kIU/mL",
        "kIU per mL",
        "kIU per milliliter",
        "kilo international units",
        "millilitre",
        "allergens",
        "allergy units"
      ],
      "printSymbol": "(ki.U.)/mL"
    },
    {
      "code": "kat/kg",
      "CODE": "KAT/KG",
      "value": {"unit": "mol/s", "UNIT": "MOL/S", "value": "1", "text": "1"},
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "katal per kilogram",
        "kat per kg",
        "katals per kilogram",
        "mol/s/kg",
        "moles per seconds per kilogram"
      ],
      "printSymbol": "kat/kg"
    },
    {
      "code": "kat/L",
      "CODE": "KAT/L",
      "value": {"unit": "mol/s", "UNIT": "MOL/S", "value": "1", "text": "1"},
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "katal per liter",
        "kat per L",
        "katals per liter",
        "litre",
        "mol/s/L",
        "moles per seconds per liter"
      ],
      "printSymbol": "kat/L"
    },
    {
      "code": "kcal",
      "CODE": "KCAL",
      "value": {"unit": "cal_th", "UNIT": "CAL_TH", "value": "1", "text": "1"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilocalorie",
        "kilogram calories",
        "large calories",
        "food calories",
        "kcals"
      ],
      "printSymbol": "kcal"
    },
    {
      "code": "kcal/(24.h)",
      "CODE": "KCAL/HR",
      "value": {"unit": "cal_th", "UNIT": "CAL_TH", "value": "1", "text": "1"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilocalorie per 24 hour",
        "kcal/24hrs",
        "kcal/24 hrs",
        "kcal per 24hrs",
        "kilocalories per 24 hours",
        "kilojoules",
        "kJ/24hr",
        "kJ/(24.h)",
        "kJ/dy",
        "kilojoules per days",
        "intake",
        "calories burned",
        "metabolic rate",
        "food calories"
      ],
      "printSymbol": "kcal/h"
    },
    {
      "code": "kcal/[oz_av]",
      "CODE": "KCAL/[OZ_AV]",
      "value": {"unit": "cal_th", "UNIT": "CAL_TH", "value": "1", "text": "1"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilocalorie per ounce",
        "kcal/oz",
        "kcal per ozs",
        "large calories per ounces",
        "food calories",
        "servings",
        "international"
      ],
      "printSymbol": "kcal/oz"
    },
    {
      "code": "kcal/d",
      "CODE": "KCAL/D",
      "value": {"unit": "cal_th", "UNIT": "CAL_TH", "value": "1", "text": "1"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilocalorie per day",
        "kcal/dy",
        "kcal per day",
        "kilocalories per days",
        "kilojoules",
        "kJ/dy",
        "kilojoules per days",
        "intake",
        "calories burned",
        "metabolic rate",
        "food calories"
      ],
      "printSymbol": "kcal/d"
    },
    {
      "code": "kcal/h",
      "CODE": "KCAL/HR",
      "value": {"unit": "cal_th", "UNIT": "CAL_TH", "value": "1", "text": "1"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilocalorie per hour",
        "kcal/hrs",
        "kcals per hr",
        "intake",
        "kilocalories per hours",
        "kilojoules"
      ],
      "printSymbol": "kcal/h"
    },
    {
      "code": "kcal/kg/(24.h)",
      "CODE": "(KCAL/KG)/HR",
      "value": {"unit": "cal_th", "UNIT": "CAL_TH", "value": "1", "text": "1"},
      "property": "energy",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilocalorie per kilogram per 24 hour",
        "kcal/kg/24hrs",
        "24 hrs",
        "kcal per kg per 24hrs",
        "kilocalories per kilograms per 24 hours",
        "kilojoules"
      ],
      "printSymbol": "(kcal/kg)/h"
    },
    {
      "code": "kg",
      "CODE": "KG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["kilogram", "kilograms", "kgs"],
      "printSymbol": "kg"
    },
    {
      "code": "kg.m/s",
      "CODE": "(KG.M)/S",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilogram meter per second",
        "kg*m/s",
        "kg.m per sec",
        "kg*m per sec",
        "p",
        "momentum"
      ],
      "printSymbol": "(kg.m)/s"
    },
    {
      "code": "kg/(s.m2)",
      "CODE": "KG/(S.M2)",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilogram per second per square meter",
        "kg/(s*m2)",
        "kg/(s*m^2)",
        "kg per s per m2",
        "per sec",
        "per m^2",
        "kilograms per seconds per square meter",
        "meter squared",
        "metre"
      ],
      "printSymbol": "kg/(s.(m<sup>2</sup>))"
    },
    {
      "code": "kg/h",
      "CODE": "KG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["kilogram per hour", "kg/hr", "kg per hr", "kilograms per hour"],
      "printSymbol": "kg/h"
    },
    {
      "code": "kg/L",
      "CODE": "KG/L",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["kilogram per liter", "kg per liter", "litre", "kilograms"],
      "printSymbol": "kg/L"
    },
    {
      "code": "kg/m2",
      "CODE": "KG/M2",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilogram per square meter",
        "kg/m^2",
        "kg/sq. m",
        "kg per m2",
        "per m^2",
        "per sq. m",
        "kilograms",
        "meter squared",
        "metre",
        "BMI"
      ],
      "printSymbol": "kg/(m<sup>2</sup>)"
    },
    {
      "code": "kg/m3",
      "CODE": "KG/M3",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilogram per cubic meter",
        "kg/m^3",
        "kg/cu. m",
        "kg per m3",
        "per m^3",
        "per cu. m",
        "kilograms",
        "meters cubed",
        "metre"
      ],
      "printSymbol": "kg/(m<sup>3</sup>)"
    },
    {
      "code": "kg/min",
      "CODE": "KG/MIN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilogram per minute",
        "kilogram/minute",
        "kg per min",
        "kilograms per minute"
      ],
      "printSymbol": "kg/min"
    },
    {
      "code": "kg/mol",
      "CODE": "KG/MOL",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilogram per mole",
        "kilogram/mole",
        "kg per mol",
        "kilograms per mole"
      ],
      "printSymbol": "kg/mol"
    },
    {
      "code": "kg/s",
      "CODE": "KG/S",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilogram per second",
        "kg/sec",
        "kilogram/second",
        "kg per sec",
        "kilograms",
        "second"
      ],
      "printSymbol": "kg/s"
    },
    {
      "code": "kL",
      "CODE": "KL",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "kiloliter",
        "kiloliters",
        "kilolitres",
        "m3",
        "m^3",
        "meters cubed",
        "metre"
      ],
      "printSymbol": "kL"
    },
    {
      "code": "km",
      "CODE": "KM",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["kilometer", "kilometers", "kilometres", "distance"],
      "printSymbol": "km"
    },
    {
      "code": "kPa",
      "CODE": "KPAL",
      "value": {"unit": "N/m2", "UNIT": "N/M2", "value": "1", "text": "1"},
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["kilopascal", "kilopascals", "pressure"],
      "printSymbol": "kPa"
    },
    {
      "code": "ks",
      "CODE": "KS",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["kilosecond", "kiloseconds", "ksec"],
      "printSymbol": "ks"
    },
    {
      "code": "kU",
      "CODE": "KU",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilo enzyme unit",
        "units",
        "mmol/min",
        "millimoles per minute"
      ],
      "printSymbol": "kU"
    },
    {
      "code": "kU/g",
      "CODE": "KU/G",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["kilo enzyme unit per gram", "units per grams", "kU per gm"],
      "printSymbol": "kU/g"
    },
    {
      "code": "kU/L",
      "CODE": "KU/L",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilo enzyme unit per liter",
        "units per liter",
        "litre",
        "enzymatic activity",
        "enzyme activity per volume",
        "activities"
      ],
      "printSymbol": "kU/L"
    },
    {
      "code": "kU/mL",
      "CODE": "KU/ML",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "kilo enzyme unit per milliliter",
        "kU per mL",
        "units per milliliter",
        "millilitre",
        "enzymatic activity per volume",
        "enzyme activities"
      ],
      "printSymbol": "kU/mL"
    },
    {
      "code": "L/(24.h)",
      "CODE": "L/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "Liters per 24 hour",
        "L/24hrs",
        "L/24 hrs",
        "L per 24hrs",
        "liters per 24 hours",
        "day",
        "dy",
        "litres",
        "volume flow rate"
      ],
      "printSymbol": "L/h"
    },
    {
      "code": "L/(8.h)",
      "CODE": "L/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "Liters per 8 hour",
        "L/8hrs",
        "L/8 hrs",
        "L per 8hrs",
        "liters per 8 hours",
        "litres",
        "volume flow rate",
        "shift"
      ],
      "printSymbol": "L/h"
    },
    {
      "code": "L/(min.m2) ",
      "CODE": "L/(MIN.M2)",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "Liters per minute per square meter",
        "L/(min.m2)",
        "L/min/m^2",
        "L/min/sq. meter",
        "L per min per m2",
        "m^2",
        "liters per minutes per square meter",
        "meter squared",
        "litres",
        "metre"
      ],
      "printSymbol": "L/(min.(m<sup>2</sup>))"
    },
    {
      "code": "L/d",
      "CODE": "L/D",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "Liters per day",
        "L/dy",
        "L per day",
        "24hrs",
        "24 hrs",
        "24 hours",
        "liters",
        "litres"
      ],
      "printSymbol": "L/d"
    },
    {
      "code": "L/h",
      "CODE": "L/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Liters per hour", "L/hr", "L per hr", "litres"],
      "printSymbol": "L/h"
    },
    {
      "code": "L/kg",
      "CODE": "L/KG",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Liters per kilogram", "L per kg", "litre"],
      "printSymbol": "L/kg"
    },
    {
      "code": "L/L",
      "CODE": "L/L",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Liters per liter", "L per L", "liter/liter", "litre"],
      "printSymbol": "L/L"
    },
    {
      "code": "L/min",
      "CODE": "L/MIN",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Liters per minute", "liters per minute", "litre"],
      "printSymbol": "L/min"
    },
    {
      "code": "L/min/m2",
      "CODE": "(L/MIN)/M2",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "Liters per minute per square meter",
        "L/(min.m2)",
        "L/min/m^2",
        "L/min/sq. meter",
        "L per min per m2",
        "m^2",
        "liters per minutes per square meter",
        "meter squared",
        "litres",
        "metre"
      ],
      "printSymbol": "(L/min)/(m<sup>2</sup>)"
    },
    {
      "code": "L/s",
      "CODE": "L/S",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Liters per second", "L per sec", "litres"],
      "printSymbol": "L/s"
    },
    {
      "code": "L/s/s2",
      "CODE": "(L/S)/S2",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "Liters per second per square second",
        "L/s/s^2",
        "L/sec/sec2",
        "L/sec/sec^2",
        "L/sec/sq. sec",
        "L per s per s2",
        "L per sec per sec2",
        "s^2",
        "sec^2",
        "liters per seconds per square second",
        "second squared",
        "litres"
      ],
      "printSymbol": "(L/s)/(s<sup>2</sup>)"
    },
    {
      "code": "lm.m2",
      "CODE": "LM.M2",
      "value": {"unit": "cd.sr", "UNIT": "CD.SR", "value": "1", "text": "1"},
      "property": "luminous flux",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "lumen square meter",
        "lm*m2",
        "lm*m^2",
        "lumen meters squared",
        "lumen sq. meters",
        "metres"
      ],
      "printSymbol": "lm.(m<sup>2</sup>)"
    },
    {
      "code": "m/s",
      "CODE": "M/S",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "meter per second",
        "meter/second",
        "m per sec",
        "meters per second",
        "metres",
        "velocity",
        "speed"
      ],
      "printSymbol": "m/s"
    },
    {
      "code": "m/s2",
      "CODE": "M/S2",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "meter per square second",
        "m/s^2",
        "m/sq. sec",
        "m per s2",
        "per s^2",
        "meters per square second",
        "second squared",
        "sq second",
        "metres",
        "acceleration"
      ],
      "printSymbol": "m/(s<sup>2</sup>)"
    },
    {
      "code": "m[IU]/L",
      "CODE": "M[IU]/L",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milli international unit per liter",
        "mIU/L",
        "m IU/L",
        "mIU per liter",
        "units",
        "litre"
      ],
      "printSymbol": "(mi.U.)/L"
    },
    {
      "code": "m[IU]/mL",
      "CODE": "M[IU]/ML",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milli  international unit per milliliter",
        "mIU/mL",
        "m IU/mL",
        "mIU per mL",
        "milli international units per milliliter",
        "millilitre"
      ],
      "printSymbol": "(mi.U.)/mL"
    },
    {
      "code": "m2",
      "CODE": "M2",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "square meter",
        "m^2",
        "sq m",
        "square meters",
        "meters squared",
        "metres"
      ],
      "printSymbol": "m<sup>2</sup>"
    },
    {
      "code": "m2/s",
      "CODE": "M2/S",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "square meter per second",
        "m^2/sec",
        "m2 per sec",
        "m^2 per sec",
        "sq m/sec",
        "meters squared/seconds",
        "sq m per sec",
        "meters squared",
        "metres"
      ],
      "printSymbol": "(m<sup>2</sup>)/s"
    },
    {
      "code": "m3/s",
      "CODE": "M3/S",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "cubic meter per second",
        "m^3/sec",
        "m3 per sec",
        "m^3 per sec",
        "cu m/sec",
        "cubic meters per seconds",
        "meters cubed",
        "metres"
      ],
      "printSymbol": "(m<sup>3</sup>)/s"
    },
    {
      "code": "mA",
      "CODE": "MA",
      "value": {"unit": "C/s", "UNIT": "C/S", "value": "1", "text": "1"},
      "property": "electric current",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["milliampere", "mamp", "milliamperes"],
      "printSymbol": "mA"
    },
    {
      "code": "mbar",
      "CODE": "MBAR",
      "value": {
        "unit": "Pa",
        "UNIT": "PAL",
        "value": "100000.0",
        "text": "100000.0"
      },
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["millibar", "millibars"],
      "printSymbol": "mbar"
    },
    {
      "code": "mbar.s/L",
      "CODE": "(MBAR.S)/L",
      "value": {
        "unit": "Pa",
        "UNIT": "PAL",
        "value": "100000.0",
        "text": "100000.0"
      },
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millibar second per liter",
        "mbar*s/L",
        "mbar.s per L",
        "mbar*s per L",
        "millibar seconds per liter",
        "millibar second per litre"
      ],
      "printSymbol": "(mbar.s)/L"
    },
    {
      "code": "mbar/L/s",
      "CODE": "(MBAR/L)/S",
      "value": {
        "unit": "Pa",
        "UNIT": "PAL",
        "value": "100000.0",
        "text": "100000.0"
      },
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millibar per liter per second",
        "mbar/(L.s)",
        "mbar/L/sec",
        "mbar/liter/second",
        "mbar per L per sec",
        "mbar per liter per second",
        "millibars per liters per seconds",
        "litres"
      ],
      "printSymbol": "(mbar/L)/s"
    },
    {
      "code": "meq",
      "CODE": "MEQ",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["milliequivalent", "milliequivalents", "meqs"],
      "printSymbol": "meq"
    },
    {
      "code": "meq/(2.h)",
      "CODE": "MEQ/HR",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per 2 hour",
        "meq/2hrs",
        "meq/2 hrs",
        "meq per 2 hrs",
        "milliequivalents per 2 hours"
      ],
      "printSymbol": "meq/h"
    },
    {
      "code": "meq/(24.h)",
      "CODE": "MEQ/HR",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per 24 hour",
        "meq/24hrs",
        "meq/24 hrs",
        "meq per 24 hrs",
        "milliequivalents per 24 hours"
      ],
      "printSymbol": "meq/h"
    },
    {
      "code": "meq/(8.h)",
      "CODE": "MEQ/HR",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per 8 hour",
        "meq/8hrs",
        "meq/8 hrs",
        "meq per 8 hrs",
        "milliequivalents per 8 hours",
        "shift"
      ],
      "printSymbol": "meq/h"
    },
    {
      "code": "meq/d",
      "CODE": "MEQ/D",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per day",
        "meq/dy",
        "meq per day",
        "milliquivalents per days",
        "meq/24hrs",
        "meq/24 hrs",
        "meq per 24 hrs",
        "milliequivalents per 24 hours"
      ],
      "printSymbol": "meq/d"
    },
    {
      "code": "meq/dL",
      "CODE": "MEQ/DL",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per deciliter",
        "meq per dL",
        "milliequivalents per deciliter",
        "decilitre"
      ],
      "printSymbol": "meq/dL"
    },
    {
      "code": "meq/g",
      "CODE": "MEQ/G",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per gram",
        "mgq/gm",
        "meq per gm",
        "milliequivalents per gram"
      ],
      "printSymbol": "meq/g"
    },
    {
      "code": "meq/h",
      "CODE": "MEQ/HR",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per hour",
        "meq/hrs",
        "meq per hrs",
        "milliequivalents per hour"
      ],
      "printSymbol": "meq/h"
    },
    {
      "code": "meq/kg",
      "CODE": "MEQ/KG",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per kilogram",
        "meq per kg",
        "milliequivalents per kilogram"
      ],
      "printSymbol": "meq/kg"
    },
    {
      "code": "meq/kg/h",
      "CODE": "(MEQ/KG)/HR",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per kilogram per hour",
        "meq/(kg.h)",
        "meq/kg/hr",
        "meq per kg per hr",
        "milliequivalents per kilograms per hour"
      ],
      "printSymbol": "(meq/kg)/h"
    },
    {
      "code": "meq/L",
      "CODE": "MEQ/L",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per liter",
        "milliequivalents per liter",
        "litre",
        "meq per l",
        "acidity"
      ],
      "printSymbol": "meq/L"
    },
    {
      "code": "meq/m2",
      "CODE": "MEQ/M2",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per square meter",
        "meq/m^2",
        "meq/sq. m",
        "milliequivalents per square meter",
        "meter squared",
        "metre"
      ],
      "printSymbol": "meq/(m<sup>2</sup>)"
    },
    {
      "code": "meq/min",
      "CODE": "MEQ/MIN",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per minute",
        "meq per min",
        "milliequivalents per minute"
      ],
      "printSymbol": "meq/min"
    },
    {
      "code": "meq/mL",
      "CODE": "MEQ/ML",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliequivalent per milliliter",
        "meq per mL",
        "milliequivalents per milliliter",
        "millilitre"
      ],
      "printSymbol": "meq/mL"
    },
    {
      "code": "mg",
      "CODE": "MG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["milligram", "milligrams"],
      "printSymbol": "mg"
    },
    {
      "code": "mg/(10.h)",
      "CODE": "MG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per 10 hour",
        "mg/10hrs",
        "mg/10 hrs",
        "mg per 10 hrs",
        "milligrams per 10 hours"
      ],
      "printSymbol": "mg/h"
    },
    {
      "code": "mg/(12.h)",
      "CODE": "MG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per 12 hour",
        "mg/12hrs",
        "mg/12 hrs",
        "per 12 hrs",
        "12hrs",
        "milligrams per 12 hours"
      ],
      "printSymbol": "mg/h"
    },
    {
      "code": "mg/(2.h)",
      "CODE": "MG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per 2 hour",
        "mg/2hrs",
        "mg/2 hrs",
        "mg per 2 hrs",
        "2hrs",
        "milligrams per 2 hours"
      ],
      "printSymbol": "mg/h"
    },
    {
      "code": "mg/(24.h)",
      "CODE": "MG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per 24 hour",
        "mg/24hrs",
        "mg/24 hrs",
        "milligrams per 24 hours",
        "mg/kg/dy",
        "mg per kg per day",
        "milligrams per kilograms per days"
      ],
      "printSymbol": "mg/h"
    },
    {
      "code": "mg/(6.h)",
      "CODE": "MG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per 6 hour",
        "mg/6hrs",
        "mg/6 hrs",
        "mg per 6 hrs",
        "6hrs",
        "milligrams per 6 hours"
      ],
      "printSymbol": "mg/h"
    },
    {
      "code": "mg/(72.h)",
      "CODE": "MG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per 72 hour",
        "mg/72hrs",
        "mg/72 hrs",
        "72 hrs",
        "72hrs",
        "milligrams per 72 hours"
      ],
      "printSymbol": "mg/h"
    },
    {
      "code": "mg/(8.h)",
      "CODE": "MG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per 8 hour",
        "mg/8hrs",
        "mg/8 hrs",
        "milligrams per 8 hours",
        "shift"
      ],
      "printSymbol": "mg/h"
    },
    {
      "code": "mg/d",
      "CODE": "MG/D",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per day",
        "mg/24hrs",
        "mg/24 hrs",
        "milligrams per 24 hours",
        "mg/dy",
        "mg per day",
        "milligrams"
      ],
      "printSymbol": "mg/d"
    },
    {
      "code": "mg/dL",
      "CODE": "MG/DL",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per deciliter",
        "mg per dL",
        "milligrams per deciliter",
        "decilitre"
      ],
      "printSymbol": "mg/dL"
    },
    {
      "code": "mg/g",
      "CODE": "MG/G",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["milligram per gram", "mg per gm", "milligrams per gram"],
      "printSymbol": "mg/g"
    },
    {
      "code": "mg/h",
      "CODE": "MG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["milligram per hour", "mg/hr", "mg per hr", "milligrams"],
      "printSymbol": "mg/h"
    },
    {
      "code": "mg/kg",
      "CODE": "MG/KG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per kilogram",
        "mg per kg",
        "milligrams per kilograms"
      ],
      "printSymbol": "mg/kg"
    },
    {
      "code": "mg/kg/(8.h)",
      "CODE": "(MG/KG)/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per kilogram per 8 hour",
        "mg/(8.h.kg)",
        "mg/kg/8hrs",
        "mg/kg/8 hrs",
        "mg per kg per 8hrs",
        "8 hrs",
        "milligrams per kilograms per 8 hours",
        "shift"
      ],
      "printSymbol": "(mg/kg)/h"
    },
    {
      "code": "mg/kg/d",
      "CODE": "(MG/KG)/D",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per kilogram per day",
        "mg/(kg.d)",
        "mg/(kg.24.h)mg/kg/dy",
        "mg per kg per day",
        "milligrams per kilograms per days",
        "mg/kg/(24.h)",
        "mg/kg/24hrs",
        "24 hrs",
        "24 hours"
      ],
      "printSymbol": "(mg/kg)/d"
    },
    {
      "code": "mg/kg/h",
      "CODE": "(MG/KG)/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per kilogram per hour",
        "mg/(kg.h)",
        "mg/kg/hr",
        "mg per kg per hr",
        "milligrams per kilograms per hour"
      ],
      "printSymbol": "(mg/kg)/h"
    },
    {
      "code": "mg/kg/min",
      "CODE": "(MG/KG)/MIN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per kilogram per minute",
        "mg/(kg.min)",
        "mg per kg per min",
        "milligrams per kilograms per minute"
      ],
      "printSymbol": "(mg/kg)/min"
    },
    {
      "code": "mg/L",
      "CODE": "MG/L",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per liter",
        "mg per l",
        "milligrams per liter",
        "litre"
      ],
      "printSymbol": "mg/L"
    },
    {
      "code": "mg/m2",
      "CODE": "MG/M2",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per square meter",
        "mg/m^2",
        "mg/sq. m",
        "mg per m2",
        "mg per m^2",
        "mg per sq. milligrams",
        "meter squared",
        "metre"
      ],
      "printSymbol": "mg/(m<sup>2</sup>)"
    },
    {
      "code": "mg/m3",
      "CODE": "MG/M3",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per cubic meter",
        "mg/m^3",
        "mg/cu. m",
        "mg per m3",
        "milligrams per cubic meter",
        "meter cubed",
        "metre"
      ],
      "printSymbol": "mg/(m<sup>3</sup>)"
    },
    {
      "code": "mg/mg",
      "CODE": "MG/MG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per milligram",
        "mg per mg",
        "milligrams",
        "milligram/milligram"
      ],
      "printSymbol": "mg/mg"
    },
    {
      "code": "mg/min",
      "CODE": "MG/MIN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per minute",
        "mg per min",
        "milligrams per minutes",
        "milligram/minute"
      ],
      "printSymbol": "mg/min"
    },
    {
      "code": "mg/mL",
      "CODE": "MG/ML",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per milliliter",
        "mg per mL",
        "milligrams per milliliters",
        "millilitre"
      ],
      "printSymbol": "mg/mL"
    },
    {
      "code": "mg/mmol",
      "CODE": "MG/MMOL",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per millimole",
        "mg per mmol",
        "milligrams per millimole",
        ""
      ],
      "printSymbol": "mg/mmol"
    },
    {
      "code": "mg/wk",
      "CODE": "MG/WK",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "milligram per week",
        "mg/week",
        "mg per wk",
        "milligrams per weeks",
        "milligram/week"
      ],
      "printSymbol": "mg/wk"
    },
    {
      "code": "mL",
      "CODE": "ML",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["milliliter", "milliliters", "millilitres"],
      "printSymbol": "mL"
    },
    {
      "code": "mL/(10.h)",
      "CODE": "ML/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per 10 hour",
        "ml/10hrs",
        "ml/10 hrs",
        "mL per 10hrs",
        "10 hrs",
        "milliliters per 10 hours",
        "millilitres"
      ],
      "printSymbol": "mL/h"
    },
    {
      "code": "mL/(12.h)",
      "CODE": "ML/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per 12 hour",
        "ml/12hrs",
        "ml/12 hrs",
        "mL per 12hrs",
        "12 hrs",
        "milliliters per 12 hours",
        "millilitres"
      ],
      "printSymbol": "mL/h"
    },
    {
      "code": "mL/(2.h)",
      "CODE": "ML/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per 2 hour",
        "ml/2hrs",
        "ml/2 hrs",
        "mL per 2hrs",
        "2 hrs",
        "milliliters per 2 hours",
        "millilitres"
      ],
      "printSymbol": "mL/h"
    },
    {
      "code": "mL/(24.h)",
      "CODE": "ML/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per 24 hour",
        "ml/24hrs",
        "ml/24 hrs",
        "mL per 24hrs",
        "24 hrs",
        "milliliters per 24 hours",
        "millilitres",
        "ml/dy",
        "/day",
        "ml per dy",
        "days",
        "fluid outputs",
        "fluid inputs",
        "flow rate"
      ],
      "printSymbol": "mL/h"
    },
    {
      "code": "mL/(4.h)",
      "CODE": "ML/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per 4 hour",
        "ml/4hrs",
        "ml/4 hrs",
        "mL per 4hrs",
        "4 hrs",
        "milliliters per 4 hours",
        "millilitres"
      ],
      "printSymbol": "mL/h"
    },
    {
      "code": "mL/(5.h)",
      "CODE": "ML/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per 5 hour",
        "ml/5hrs",
        "ml/5 hrs",
        "mL per 5hrs",
        "5 hrs",
        "milliliters per 5 hours",
        "millilitres"
      ],
      "printSymbol": "mL/h"
    },
    {
      "code": "mL/(6.h)",
      "CODE": "ML/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per 6 hour",
        "ml/6hrs",
        "ml/6 hrs",
        "mL per 6hrs",
        "6 hrs",
        "milliliters per 6 hours",
        "millilitres"
      ],
      "printSymbol": "mL/h"
    },
    {
      "code": "mL/(72.h)",
      "CODE": "ML/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per 72 hour",
        "ml/72hrs",
        "ml/72 hrs",
        "mL per 72hrs",
        "72 hrs",
        "milliliters per 72 hours",
        "millilitres"
      ],
      "printSymbol": "mL/h"
    },
    {
      "code": "mL/(8.h)",
      "CODE": "ML/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per 8 hour",
        "ml/8hrs",
        "ml/8 hrs",
        "mL per 8hrs",
        "8 hrs",
        "milliliters per 8 hours",
        "millilitres",
        "shift"
      ],
      "printSymbol": "mL/h"
    },
    {
      "code": "mL/(8.h)/kg",
      "CODE": "(ML/HR)/KG",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per 8 hour per kilogram",
        "mL/kg/(8.h)",
        "ml/8h/kg",
        "ml/8 h/kg",
        "ml/8hr/kg",
        "ml/8 hr/kgr",
        "mL per 8h per kg",
        "8 h",
        "8hr",
        "8 hr",
        "milliliters per 8 hours per kilogram",
        "millilitres",
        "shift"
      ],
      "printSymbol": "(mL/h)/kg"
    },
    {
      "code": "mL/[sin_i]",
      "CODE": "ML/[SIN_I]",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per square inch (international)",
        "mL/sin",
        "mL/in2",
        "mL/in^2",
        "mL per sin",
        "in2",
        "in^2",
        "sq. in",
        "milliliters per square inch",
        "inch squared"
      ],
      "printSymbol": "mL"
    },
    {
      "code": "mL/cm[H2O]",
      "CODE": "ML/CM[H2O]",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per centimeter of water",
        "milliliters per centimeter of water",
        "millilitre per centimetre of water",
        "millilitres per centimetre of water",
        "mL/cmH2O",
        "mL/cm H2O",
        "mL per cmH2O",
        "mL per cm H2O"
      ],
      "printSymbol": "mL/(cm HO<sub><r>2</r></sub>)"
    },
    {
      "code": "mL/d",
      "CODE": "ML/D",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per day",
        "ml/day",
        "ml per day",
        "milliliters per day",
        "24 hours",
        "24hrs",
        "millilitre",
        ""
      ],
      "printSymbol": "mL/d"
    },
    {
      "code": "mL/dL",
      "CODE": "ML/DL",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per deciliter",
        "mL per dL",
        "millilitres",
        "decilitre",
        "milliliters"
      ],
      "printSymbol": "mL/dL"
    },
    {
      "code": "mL/h",
      "CODE": "ML/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per hour",
        "mL/hr",
        "mL per hr",
        "milliliters per hour",
        "millilitres",
        "fluid intake",
        "fluid output"
      ],
      "printSymbol": "mL/h"
    },
    {
      "code": "mL/kg",
      "CODE": "ML/KG",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per kilogram",
        "mL per kg",
        "milliliters per kilogram",
        "millilitres"
      ],
      "printSymbol": "mL/kg"
    },
    {
      "code": "mL/kg/(8.h)",
      "CODE": "(ML/KG)/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per kilogram per 8 hour",
        "mL/(8.h.kg)",
        "mL/kg/8hrs",
        "mL/kg/8 hrs",
        "mL per kg per 8hrs",
        "8 hrs",
        "milliliters per kilograms per 8 hours",
        "millilitres",
        "shift"
      ],
      "printSymbol": "(mL/kg)/h"
    },
    {
      "code": "mL/kg/d",
      "CODE": "(ML/KG)/D",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per kilogram per day",
        "mL/(kg.d)",
        "mL/kg/dy",
        "mL per kg per day",
        "milliliters per kilograms per day",
        "mg/kg/24hrs",
        "24 hrs",
        "per 24 hours millilitres"
      ],
      "printSymbol": "(mL/kg)/d"
    },
    {
      "code": "mL/kg/h",
      "CODE": "(ML/KG)/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per kilogram per hour",
        "mL/(kg.h)",
        "mL/kg/hr",
        "mL per kg per hr",
        "milliliters per kilograms per hour",
        "millilitres"
      ],
      "printSymbol": "(mL/kg)/h"
    },
    {
      "code": "mL/kg/min",
      "CODE": "(ML/KG)/MIN",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per kilogram per minute",
        "mL/(kg.min)",
        "mL/kg/dy",
        "mL per kg per day",
        "milliliters per kilograms per day",
        "millilitres"
      ],
      "printSymbol": "(mL/kg)/min"
    },
    {
      "code": "mL/m2",
      "CODE": "ML/M2",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per square meter",
        "mL/m^2",
        "mL/sq. meter",
        "mL per m2",
        "m^2",
        "sq. meter",
        "milliliters per square meter",
        "millilitres",
        "meter squared"
      ],
      "printSymbol": "mL/(m<sup>2</sup>)"
    },
    {
      "code": "mL/mbar",
      "CODE": "ML/MBAR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per millibar",
        "mL per mbar",
        "milliliters per millibar",
        "millilitres"
      ],
      "printSymbol": "mL/mbar"
    },
    {
      "code": "mL/min",
      "CODE": "ML/MIN",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per minute",
        "mL per min",
        "milliliters",
        "millilitres"
      ],
      "printSymbol": "mL/min"
    },
    {
      "code": "mL/min/m2",
      "CODE": "(ML/MIN)/M2",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per minute per square meter",
        "ml/min/m^2",
        "ml/min/sq. meter",
        "mL per min per m2",
        "m^2",
        "sq. meter",
        "milliliters per minutes per square meter",
        "millilitres",
        "metre",
        "meter squared"
      ],
      "printSymbol": "(mL/min)/(m<sup>2</sup>)"
    },
    {
      "code": "mL/mm",
      "CODE": "ML/MM",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per millimeter",
        "mL per mm",
        "milliliters per millimeter",
        "millilitres",
        "millimetre"
      ],
      "printSymbol": "mL/mm"
    },
    {
      "code": "mL/s",
      "CODE": "ML/S",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliliter per second",
        "ml/sec",
        "mL per sec",
        "milliliters per second",
        "millilitres"
      ],
      "printSymbol": "mL/s"
    },
    {
      "code": "mm",
      "CODE": "MM",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimeter",
        "millimeters",
        "millimetres",
        "height",
        "length",
        "diameter",
        "thickness",
        "axis",
        "curvature",
        "size"
      ],
      "printSymbol": "mm"
    },
    {
      "code": "mm/h",
      "CODE": "MM/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimeter per hour",
        "mm/hr",
        "mm per hr",
        "millimeters per hour",
        "millimetres"
      ],
      "printSymbol": "mm/h"
    },
    {
      "code": "mm/min",
      "CODE": "MM/MIN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimeter per minute",
        "mm per min",
        "millimeters per minute",
        "millimetres"
      ],
      "printSymbol": "mm/min"
    },
    {
      "code": "mm[H2O]",
      "CODE": "MM[H2O]",
      "value": {
        "unit": "kPa",
        "UNIT": "KPAL",
        "value": "9.80665",
        "text": "9.80665"
      },
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimeter of water",
        "mmH2O",
        "mm H2O",
        "millimeters of water",
        "millimetres"
      ],
      "printSymbol": "mm HO<sub><r>2</r></sub>"
    },
    {
      "code": "mm[Hg]",
      "CODE": "MM[HG]",
      "value": {
        "unit": "kPa",
        "UNIT": "KPAL",
        "value": "133.322",
        "text": "133.322"
      },
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimeter of mercury",
        "mmHg",
        "mm Hg",
        "millimeters of mercury",
        "millimetres"
      ],
      "printSymbol": "mm Hg"
    },
    {
      "code": "mm2",
      "CODE": "MM2",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "square millimeter",
        "mm^2",
        "sq. mm.",
        "sq. millimeters",
        "millimeters squared",
        "millimetres"
      ],
      "printSymbol": "mm<sup>2</sup>"
    },
    {
      "code": "mmol",
      "CODE": "MMOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["millimole", "millimoles"],
      "printSymbol": "mmol"
    },
    {
      "code": "mmol/(12.h)",
      "CODE": "MMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per 12 hour",
        "mmol/12hrs",
        "mmol/12 hrs",
        "mmol per 12 hrs",
        "12hrs",
        "millimoles per 12 hours"
      ],
      "printSymbol": "mmol/h"
    },
    {
      "code": "mmol/(2.h)",
      "CODE": "MMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per 2 hour",
        "mmol/2hrs",
        "mmol/2 hrs",
        "mmol per 2 hrs",
        "2hrs",
        "millimoles per 2 hours"
      ],
      "printSymbol": "mmol/h"
    },
    {
      "code": "mmol/(24.h)",
      "CODE": "MMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per 24 hour",
        "mmol/24hrs",
        "mmol/24 hrs",
        "mmol per 24 hrs",
        "24hrs",
        "millimoles per 24 hours"
      ],
      "printSymbol": "mmol/h"
    },
    {
      "code": "mmol/(5.h)",
      "CODE": "MMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per 5 hour",
        "mmol/5hrs",
        "mmol/5 hrs",
        "mmol per 5 hrs",
        "5hrs",
        "millimoles per 5 hours"
      ],
      "printSymbol": "mmol/h"
    },
    {
      "code": "mmol/(6.h)",
      "CODE": "MMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per 6 hour",
        "mmol/6hrs",
        "mmol/6 hrs",
        "mmol per 6 hrs",
        "6hrs",
        "millimoles per 6 hours"
      ],
      "printSymbol": "mmol/h"
    },
    {
      "code": "mmol/(8.h)",
      "CODE": "MMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per 8 hour",
        "mmol/8hrs",
        "mmol/8 hrs",
        "mmol per 8 hrs",
        "8hrs",
        "millimoles per 8 hours",
        "shift"
      ],
      "printSymbol": "mmol/h"
    },
    {
      "code": "mmol/d",
      "CODE": "MMOL/D",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per day",
        "mmol/24hrs",
        "mmol/24 hrs",
        "mmol per 24 hrs",
        "24hrs",
        "millimoles per 24 hours"
      ],
      "printSymbol": "mmol/d"
    },
    {
      "code": "mmol/dL",
      "CODE": "MMOL/DL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per deciliter",
        "mmol per dL",
        "millimoles",
        "decilitre"
      ],
      "printSymbol": "mmol/dL"
    },
    {
      "code": "mmol/g",
      "CODE": "MMOL/G",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["millimole per gram", "mmol per gram", "millimoles"],
      "printSymbol": "mmol/g"
    },
    {
      "code": "mmol/h",
      "CODE": "MMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per hour",
        "mmol/hr",
        "mmol per hr",
        "millimoles per hour"
      ],
      "printSymbol": "mmol/h"
    },
    {
      "code": "mmol/kg",
      "CODE": "MMOL/KG",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per kilogram",
        "mmol per kg",
        "millimoles per kilogram"
      ],
      "printSymbol": "mmol/kg"
    },
    {
      "code": "mmol/kg/(8.h)",
      "CODE": "(MMOL/KG)/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per kilogram per 8 hour",
        "mmol/(8.h.kg)",
        "mmol/kg/8hrs",
        "mmol/kg/8 hrs",
        "mmol per kg per 8hrs",
        "8 hrs",
        "millimoles per kilograms per 8 hours",
        "shift"
      ],
      "printSymbol": "(mmol/kg)/h"
    },
    {
      "code": "mmol/kg/d",
      "CODE": "(MMOL/KG)/D",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per kilogram per day",
        "mmol/kg/dy",
        "mmol/kg/day",
        "mmol per kg per dy",
        "millimoles per kilograms per day"
      ],
      "printSymbol": "(mmol/kg)/d"
    },
    {
      "code": "mmol/kg/h",
      "CODE": "(MMOL/KG)/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per kilogram per hour",
        "mmol/kg/hr",
        "mmol per kg per hr",
        "millimoles per kilograms per hour"
      ],
      "printSymbol": "(mmol/kg)/h"
    },
    {
      "code": "mmol/kg/min",
      "CODE": "(MMOL/KG)/MIN",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per kilogram per minute",
        "mmol/(kg.min)",
        "mmol/kg/min",
        "mmol per kg per min",
        "millimoles per kilograms per minute"
      ],
      "printSymbol": "(mmol/kg)/min"
    },
    {
      "code": "mmol/L",
      "CODE": "MMOL/L",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per liter",
        "mmol per L",
        "millimoles per liter",
        "litre"
      ],
      "printSymbol": "mmol/L"
    },
    {
      "code": "mmol/m2",
      "CODE": "MMOL/M2",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per square meter",
        "mmol/m^2",
        "mmol/sq. meter",
        "mmol per m2",
        "m^2",
        "sq. meter",
        "millimoles",
        "meter squared",
        "metre"
      ],
      "printSymbol": "mmol/(m<sup>2</sup>)"
    },
    {
      "code": "mmol/min",
      "CODE": "MMOL/MIN",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["millimole per minute", "mmol per min", "millimoles per minute"],
      "printSymbol": "mmol/min"
    },
    {
      "code": "mmol/mmol",
      "CODE": "MMOL/MMOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per millimole",
        "mmol per mmol",
        "millimoles per millimole"
      ],
      "printSymbol": "mmol/mmol"
    },
    {
      "code": "mmol/mol",
      "CODE": "MMOL/MOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["millimole per mole", "mmol per mol", "millimoles per mole"],
      "printSymbol": "mmol/mol"
    },
    {
      "code": "mmol/s/L",
      "CODE": "(MMOL/S)/L",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millimole per second per liter",
        "mmol/sec/L",
        "mmol per s per L",
        "per sec",
        "millimoles per seconds per liter",
        "litre"
      ],
      "printSymbol": "(mmol/s)/L"
    },
    {
      "code": "mol/kg",
      "CODE": "MOL/KG",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["mole per kilogram", "mol per kg", "moles", "mols"],
      "printSymbol": "mol/kg"
    },
    {
      "code": "mol/kg/s",
      "CODE": "(MOL/KG)/S",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "mole per kilogram per second",
        "mol/kg/sec",
        "mol per kg per sec",
        "moles per kilograms per second",
        "mols"
      ],
      "printSymbol": "(mol/kg)/s"
    },
    {
      "code": "mol/L",
      "CODE": "MOL/L",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "mole per liter",
        "mol per L",
        "moles per liter",
        "litre",
        "moles",
        "mols"
      ],
      "printSymbol": "mol/L"
    },
    {
      "code": "mol/m3",
      "CODE": "MOL/M3",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "mole per cubic meter",
        "mol/m^3",
        "mol/cu. m",
        "mol per m3",
        "m^3",
        "cu. meter",
        "mols",
        "moles",
        "meters cubed",
        "metre",
        "mole per kiloliter",
        "kilolitre",
        "mol/kL"
      ],
      "printSymbol": "mol/(m<sup>3</sup>)"
    },
    {
      "code": "mol/mL",
      "CODE": "MOL/ML",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "mole per milliliter",
        "mol per mL",
        "moles",
        "millilitre",
        "mols"
      ],
      "printSymbol": "mol/mL"
    },
    {
      "code": "mol/mol",
      "CODE": "MOL/MOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["mole per mole", "mol per mol", "moles per mol", "mols"],
      "printSymbol": "mol/mol"
    },
    {
      "code": "mol/s",
      "CODE": "MOL/S",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["mole per second", "mol per sec", "moles per second", "mols"],
      "printSymbol": "mol/s"
    },
    {
      "code": "mosm",
      "CODE": "MOSM",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance (dissolved particles)",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["milliosmole", "milliosmoles"],
      "printSymbol": "mosm"
    },
    {
      "code": "mosm/kg",
      "CODE": "MOSM/KG",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance (dissolved particles)",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliosmole per kilogram",
        "mosm per kg",
        "milliosmoles per kilogram"
      ],
      "printSymbol": "mosm/kg"
    },
    {
      "code": "mosm/L",
      "CODE": "MOSM/L",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance (dissolved particles)",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milliosmole per liter",
        "mosm per liter",
        "litre",
        "milliosmoles"
      ],
      "printSymbol": "mosm/L"
    },
    {
      "code": "mPa",
      "CODE": "MPAL",
      "value": {"unit": "N/m2", "UNIT": "N/M2", "value": "1", "text": "1"},
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["millipascal", "millipascals"],
      "printSymbol": "mPa"
    },
    {
      "code": "mPa.s",
      "CODE": "MPAL.S",
      "value": {"unit": "N/m2", "UNIT": "N/M2", "value": "1", "text": "1"},
      "property": "pressure",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "millipascal second",
        "mPa*s",
        "millipoise",
        "mP",
        "dynamic viscosity"
      ],
      "printSymbol": "mPa.s"
    },
    {
      "code": "Ms",
      "CODE": "MAS",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["megasecond", "megaseconds"],
      "printSymbol": "Ms"
    },
    {
      "code": "ms",
      "CODE": "MS",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["millisecond", "milliseconds", "duration"],
      "printSymbol": "ms"
    },
    {
      "code": "mU/g",
      "CODE": "MU/G",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milli enzyme unit per gram",
        "mU per gm",
        "milli enzyme units per gram",
        "enzyme activity",
        "enzymatic activity per mass"
      ],
      "printSymbol": "mU/g"
    },
    {
      "code": "mU/L",
      "CODE": "MU/L",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milli enzyme unit per liter",
        "mU per liter",
        "litre",
        "milli enzyme units enzymatic activity per volume",
        "enzyme activity"
      ],
      "printSymbol": "mU/L"
    },
    {
      "code": "mU/mg",
      "CODE": "MU/MG",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milli enzyme unit per milligram",
        "mU per mg",
        "milli enzyme units per milligram"
      ],
      "printSymbol": "mU/mg"
    },
    {
      "code": "mU/mL",
      "CODE": "MU/ML",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milli enzyme unit per milliliter",
        "mU per mL",
        "milli enzyme units per milliliter",
        "millilitre",
        "enzymatic activity per volume",
        "enzyme activity"
      ],
      "printSymbol": "mU/mL"
    },
    {
      "code": "mU/mL/min",
      "CODE": "(MU/ML)/MIN",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "milli enzyme unit per milliliter per minute",
        "mU per mL per min",
        "mU per milliliters per minute",
        "millilitres",
        "milli enzyme units",
        "enzymatic activity",
        "enzyme activity"
      ],
      "printSymbol": "(mU/mL)/min"
    },
    {
      "code": "mV",
      "CODE": "MV",
      "value": {"unit": "J/C", "UNIT": "J/C", "value": "1", "text": "1"},
      "property": "electric potential",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["millivolt", "millivolts"],
      "printSymbol": "mV"
    },
    {
      "code": "N.cm",
      "CODE": "N.CM",
      "value": {
        "unit": "kg.m/s2",
        "UNIT": "KG.M/S2",
        "value": "1",
        "text": "1"
      },
      "property": "force",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "Newton centimeter",
        "N*cm",
        "Ncm",
        "N cm",
        "Newton*centimeters",
        "Newton* centimetres",
        "torque",
        "work"
      ],
      "printSymbol": "N.cm"
    },
    {
      "code": "N.s",
      "CODE": "N.S",
      "value": {
        "unit": "kg.m/s2",
        "UNIT": "KG.M/S2",
        "value": "1",
        "text": "1"
      },
      "property": "force",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "Newton second",
        "Newton*seconds",
        "N*s",
        "N s",
        "Ns",
        "impulse",
        "imp"
      ],
      "printSymbol": "N.s"
    },
    {
      "code": "ng",
      "CODE": "NG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["nanogram", "nanograms"],
      "printSymbol": "ng"
    },
    {
      "code": "ng/(24.h)",
      "CODE": "NG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per 24 hour",
        "ng/24hrs",
        "ng/24 hrs",
        "nanograms per 24 hours"
      ],
      "printSymbol": "ng/h"
    },
    {
      "code": "ng/(8.h)",
      "CODE": "NG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per 8 hour",
        "ng/8hrs",
        "ng/8 hrs",
        "nanograms per 8 hours"
      ],
      "printSymbol": "ng/h"
    },
    {
      "code": "ng/10*6",
      "CODE": "NG/(10*6)",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per million",
        "ng/10^6",
        "ng per 10*6",
        "10^6",
        "nanograms"
      ],
      "printSymbol": "ng/(10<sup>6</sup>)"
    },
    {
      "code": "ng/d",
      "CODE": "NG/D",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["nanogram per day", "ng/dy", "ng per day", "nanograms"],
      "printSymbol": "ng/d"
    },
    {
      "code": "ng/dL",
      "CODE": "NG/DL",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per deciliter",
        "ng per dL",
        "nanograms per deciliter",
        "decilitre"
      ],
      "printSymbol": "ng/dL"
    },
    {
      "code": "ng/g",
      "CODE": "NG/G",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["nanogram per gram", "ng/gm", "ng per gm", "nanograms per gram"],
      "printSymbol": "ng/g"
    },
    {
      "code": "ng/h",
      "CODE": "NG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["nanogram per hour", "ng/hr", "ng per hr", "nanograms per hour"],
      "printSymbol": "ng/h"
    },
    {
      "code": "ng/kg",
      "CODE": "NG/KG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["nanogram per kilogram", "ng per kg", "nanograms per kilogram"],
      "printSymbol": "ng/kg"
    },
    {
      "code": "ng/kg/(8.h)",
      "CODE": "(NG/KG)/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per kilogram per 8 hour",
        "ng/(8.h.kg)",
        "ng/kg/8hrs",
        "ng/kg/8 hrs",
        "ng per kg per 8hrs",
        "8 hrs",
        "nanograms per kilograms per 8 hours",
        "shift"
      ],
      "printSymbol": "(ng/kg)/h"
    },
    {
      "code": "ng/kg/h",
      "CODE": "(NG/KG)/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per kilogram per hour",
        "ng/(kg.h)",
        "ng/kg/hr",
        "ng per kg per hr",
        "nanograms per kilograms per hour"
      ],
      "printSymbol": "(ng/kg)/h"
    },
    {
      "code": "ng/kg/min",
      "CODE": "(NG/KG)/MIN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per kilogram per minute",
        "ng/(kg.min)",
        "ng per kg per min",
        "nanograms per kilograms per minute"
      ],
      "printSymbol": "(ng/kg)/min"
    },
    {
      "code": "ng/L",
      "CODE": "NG/L",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per liter",
        "ng per L",
        "nanograms per liter",
        "litre"
      ],
      "printSymbol": "ng/L"
    },
    {
      "code": "ng/m2",
      "CODE": "NG/M2",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per square meter",
        "ng/m^2",
        "ng/sq. m",
        "ng per m2",
        "m^2",
        "sq. meter",
        "nanograms",
        "meter squared",
        "metre"
      ],
      "printSymbol": "ng/(m<sup>2</sup>)"
    },
    {
      "code": "ng/mg",
      "CODE": "NG/MG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["nanogram per milligram", "ng per mg", "nanograms"],
      "printSymbol": "ng/mg"
    },
    {
      "code": "ng/mg/h",
      "CODE": "(NG/MG)/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per milligram per hour",
        "ng/mg/hr",
        "ng per mg per hr",
        "nanograms per milligrams per hour"
      ],
      "printSymbol": "(ng/mg)/h"
    },
    {
      "code": "ng/min",
      "CODE": "NG/MIN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["nanogram per minute", "ng per min", "nanograms"],
      "printSymbol": "ng/min"
    },
    {
      "code": "ng/mL",
      "CODE": "NG/ML",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per millliiter",
        "ng per mL",
        "nanograms",
        "millilitre"
      ],
      "printSymbol": "ng/mL"
    },
    {
      "code": "ng/mL/h",
      "CODE": "(NG/ML)/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per milliliter per hour",
        "ng/mL/hr",
        "ng per mL per mL",
        "nanograms per milliliter per hour",
        "nanogram per millilitre per hour",
        "nanograms per millilitre per hour",
        "enzymatic activity per volume",
        "enzyme activity per milliliters"
      ],
      "printSymbol": "(ng/mL)/h"
    },
    {
      "code": "ng/s",
      "CODE": "NG/S",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per second",
        "ng/sec",
        "ng per sec",
        "nanograms per second"
      ],
      "printSymbol": "ng/s"
    },
    {
      "code": "ng/U",
      "CODE": "NG/U",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanogram per enzyme unit",
        "ng per U",
        "nanograms per enzyme unit"
      ],
      "printSymbol": "ng/U"
    },
    {
      "code": "nkat",
      "CODE": "NKAT",
      "value": {"unit": "mol/s", "UNIT": "MOL/S", "value": "1", "text": "1"},
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["nanokatal", "nanokatals"],
      "printSymbol": "nkat"
    },
    {
      "code": "nL",
      "CODE": "NL",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["nanoliter", "nanoliters", "nanolitres"],
      "printSymbol": "nL"
    },
    {
      "code": "nm",
      "CODE": "NM",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["nanometer", "nanometers", "nanometres"],
      "printSymbol": "nm"
    },
    {
      "code": "nm/s/L",
      "CODE": "(NM/S)/L",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanometer per second per liter",
        "nm/sec/liter",
        "nm/sec/litre",
        "nm per s per l",
        "nm per sec per l",
        "nanometers per second per liter",
        "nanometre per second per litre",
        "nanometres per second per litre"
      ],
      "printSymbol": "(nm/s)/L"
    },
    {
      "code": "nmol",
      "CODE": "NMOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["nanomole", "nanomoles"],
      "printSymbol": "nmol"
    },
    {
      "code": "nmol/(24.h)",
      "CODE": "NMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per 24 hour",
        "nmol/24hr",
        "nmol/24 hr",
        "nanomoles per 24 hours",
        "nmol/day",
        "nanomoles per day",
        "nmol per day",
        "nanomole/day",
        "nanomol/day"
      ],
      "printSymbol": "nmol/h"
    },
    {
      "code": "nmol/d",
      "CODE": "NMOL/D",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per day",
        "nmol/day",
        "nanomoles per day",
        "nmol per day",
        "nanomole/day",
        "nanomol/day",
        "nmol/24hr",
        "nmol/24 hr",
        "nanomoles per 24 hours",
        ""
      ],
      "printSymbol": "nmol/d"
    },
    {
      "code": "nmol/dL",
      "CODE": "NMOL/DL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per deciliter",
        "nmol per dL",
        "nanomoles per deciliter",
        "nanomole per decilitre",
        "nanomoles per decilitre",
        "nanomole/deciliter",
        "nanomole/decilitre",
        "nanomol/deciliter",
        "nanomol/decilitre"
      ],
      "printSymbol": "nmol/dL"
    },
    {
      "code": "nmol/g",
      "CODE": "NMOL/G",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per gram",
        "nmol per gram",
        "nanomoles per gram",
        "nanomole/gram"
      ],
      "printSymbol": "nmol/g"
    },
    {
      "code": "nmol/h/L",
      "CODE": "(NMOL/HR)/L",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per hour per liter",
        "nmol/hrs/L",
        "nmol per hrs per L",
        "nanomoles per hours per liter",
        "litre",
        "enzymatic activity per volume",
        "enzyme activities"
      ],
      "printSymbol": "(nmol/h)/L"
    },
    {
      "code": "nmol/L",
      "CODE": "NMOL/L",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per liter",
        "nmol per L",
        "nanomoles per liter",
        "litre"
      ],
      "printSymbol": "nmol/L"
    },
    {
      "code": "nmol/mg",
      "CODE": "NMOL/MG",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per milligram",
        "nmol per mg",
        "nanomoles per milligram"
      ],
      "printSymbol": "nmol/mg"
    },
    {
      "code": "nmol/mg/h",
      "CODE": "(NMOL/MG)/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per milligram per hour",
        "nmol/mg/hr",
        "nmol per mg per hr",
        "nanomoles per milligrams per hour"
      ],
      "printSymbol": "(nmol/mg)/h"
    },
    {
      "code": "nmol/mg{prot}",
      "CODE": "NMOL/MG",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per milligram of protein",
        "nanomoles",
        "nmol/mg prot",
        "nmol per mg prot"
      ],
      "printSymbol": "nmol/mg"
    },
    {
      "code": "nmol/min",
      "CODE": "NMOL/MIN",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per minute",
        "nmol per min",
        "nanomoles per minute",
        "milli enzyme units",
        "enzyme activity per volume",
        "enzymatic activity"
      ],
      "printSymbol": "nmol/min"
    },
    {
      "code": "nmol/min/mL",
      "CODE": "(NMOL/MIN)/ML",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per minute per milliliter",
        "nmol per min per mL",
        "nanomoles per minutes per milliliter",
        "millilitre",
        "milli enzyme units per volume",
        "enzyme activity",
        "enzymatic activity"
      ],
      "printSymbol": "(nmol/min)/mL"
    },
    {
      "code": "nmol/mL",
      "CODE": "NMOL/ML",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per milliliter",
        "nmol per mL",
        "nanomoles per milliliter",
        "millilitre"
      ],
      "printSymbol": "nmol/mL"
    },
    {
      "code": "nmol/mL/h",
      "CODE": "(NMOL/ML)/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per milliliter per hour",
        "nmol/mL/hr",
        "nmol per mL per hr",
        "nanomoles per milliliters per hour",
        "millilitres",
        "milli enzyme units per volume",
        "enzyme activity",
        "enzymatic activity"
      ],
      "printSymbol": "(nmol/mL)/h"
    },
    {
      "code": "nmol/mL/min",
      "CODE": "(NMOL/ML)/MIN",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per milliliter per minute",
        "nmol per mL per min",
        "nanomoles per milliliters per min",
        "millilitres",
        "milli enzyme units per volume",
        "enzyme activity",
        "enzymatic activity"
      ],
      "printSymbol": "(nmol/mL)/min"
    },
    {
      "code": "nmol/mmol",
      "CODE": "NMOL/MMOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per millimole",
        "nmol per mmol",
        "nanomoles per millimole"
      ],
      "printSymbol": "nmol/mmol"
    },
    {
      "code": "nmol/mmol{creat}",
      "CODE": "NMOL/MMOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["nanomole per millimole of creatinine", "nanomoles"],
      "printSymbol": "nmol/mmol"
    },
    {
      "code": "nmol/mol",
      "CODE": "NMOL/MOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["nanomole per mole", "nmol per mole", "nanomoles"],
      "printSymbol": "nmol/mol"
    },
    {
      "code": "nmol/nmol",
      "CODE": "NMOL/NMOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["nanomole per nanomole", "nmol per nmol", "nanomoles"],
      "printSymbol": "nmol/nmol"
    },
    {
      "code": "nmol/s",
      "CODE": "NMOL/S",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per second",
        "nmol/sec",
        "nmol per sec",
        "nanomoles per sercond",
        "milli enzyme units",
        "enzyme activity",
        "enzymatic activity"
      ],
      "printSymbol": "nmol/s"
    },
    {
      "code": "nmol/s/L",
      "CODE": "(NMOL/S)/L",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanomole per second per liter",
        "nmol/sec/L",
        "nmol per s per L",
        "nmol per sec per L",
        "nanomoles per seconds per liter",
        "litre",
        "milli enzyme units per volume",
        "enzyme activity",
        "enzymatic activity"
      ],
      "printSymbol": "(nmol/s)/L"
    },
    {
      "code": "ns",
      "CODE": "NS",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["nanosecond", "nanoseconds"],
      "printSymbol": "ns"
    },
    {
      "code": "nU/mL",
      "CODE": "NU/ML",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "nanoenzyme unit per milliliter",
        "nU per mL",
        "nanoenzyme units per milliliter",
        "millilitre",
        "enzymatic activity per volume",
        "enzyme activity"
      ],
      "printSymbol": "nU/mL"
    },
    {
      "code": "Ohm.m",
      "CODE": "OHM.M",
      "value": {"unit": "V/A", "UNIT": "V/A", "value": "1", "text": "1"},
      "property": "electric resistance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["Ohm meter", "electric resistivity", "meters", "metres"],
      "printSymbol": "Ω.m"
    },
    {
      "code": "osm/kg",
      "CODE": "OSM/KG",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance (dissolved particles)",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "osmole per kilogram",
        "osm per kg",
        "osmoles per kilogram",
        "osmols"
      ],
      "printSymbol": "osm/kg"
    },
    {
      "code": "osm/L",
      "CODE": "OSM/L",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance (dissolved particles)",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "osmole per liter",
        "osm per L",
        "osmoles per liter",
        "litre",
        "osmols"
      ],
      "printSymbol": "osm/L"
    },
    {
      "code": "pA",
      "CODE": "PA",
      "value": {"unit": "C/s", "UNIT": "C/S", "value": "1", "text": "1"},
      "property": "electric current",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["picoampere", "picoamperes"],
      "printSymbol": "pA"
    },
    {
      "code": "pg",
      "CODE": "PG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["picogram", "picograms"],
      "printSymbol": "pg"
    },
    {
      "code": "pg/dL",
      "CODE": "PG/DL",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["picogram per deciliter", "pg per dL", "picograms", "decilitre"],
      "printSymbol": "pg/dL"
    },
    {
      "code": "pg/L",
      "CODE": "PG/L",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["picogram per liter", "pg per L", "picograms", "litre"],
      "printSymbol": "pg/L"
    },
    {
      "code": "pg/mg",
      "CODE": "PG/MG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["picogram per milligram", "pg per mg", "picograms"],
      "printSymbol": "pg/mg"
    },
    {
      "code": "pg/mL",
      "CODE": "PG/ML",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "picogram per milliliter",
        "pg per mL",
        "picograms per milliliter",
        "millilitre"
      ],
      "printSymbol": "pg/mL"
    },
    {
      "code": "pg/mm",
      "CODE": "PG/MM",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "picogram per millimeter",
        "pg per mm",
        "picogram/millimeter",
        "picogram/millimetre",
        "picograms per millimeter",
        "millimetre"
      ],
      "printSymbol": "pg/mm"
    },
    {
      "code": "pkat",
      "CODE": "PKAT",
      "value": {"unit": "mol/s", "UNIT": "MOL/S", "value": "1", "text": "1"},
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["picokatal", "pkats", "picokatals"],
      "printSymbol": "pkat"
    },
    {
      "code": "pL",
      "CODE": "PL",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["picoliter", "picoliters", "picolitres"],
      "printSymbol": "pL"
    },
    {
      "code": "pm",
      "CODE": "PM",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["picometer", "picometers", "picometres"],
      "printSymbol": "pm"
    },
    {
      "code": "pmol",
      "CODE": "PMOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["picomole", "picomoles", "pmols"],
      "printSymbol": "pmol"
    },
    {
      "code": "pmol/(24.h)",
      "CODE": "PMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "picomole per 24 hour",
        "pmol/24hrs",
        "pmol/24 hrs",
        "pmol per 24 hrs",
        "24hrs",
        "days",
        "dy",
        "picomoles per 24 hours"
      ],
      "printSymbol": "pmol/h"
    },
    {
      "code": "pmol/d",
      "CODE": "PMOL/D",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "picomole per day",
        "pmol/dy",
        "pmol per day",
        "24 hours",
        "24hrs",
        "24 hrs",
        "picomoles"
      ],
      "printSymbol": "pmol/d"
    },
    {
      "code": "pmol/dL",
      "CODE": "PMOL/DL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "picomole per deciliter",
        "pmol per dL",
        "picomoles per deciliter",
        "decilitre"
      ],
      "printSymbol": "pmol/dL"
    },
    {
      "code": "pmol/g",
      "CODE": "PMOL/G",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "picomole per gram",
        "pmol per gm",
        "picomoles per gram",
        "picomole/gram"
      ],
      "printSymbol": "pmol/g"
    },
    {
      "code": "pmol/h/mL",
      "CODE": "(PMOL/HR)/ML",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "picomole per hour per milliliter ",
        "pmol/hrs/mL",
        "pmol per hrs per mL",
        "picomoles per hour per milliliter",
        "millilitre",
        "micro enzyme units per volume",
        "enzymatic activity",
        "enzyme activity"
      ],
      "printSymbol": "(pmol/h)/mL"
    },
    {
      "code": "pmol/L",
      "CODE": "PMOL/L",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "picomole per liter",
        "picomole/liter",
        "pmol per L",
        "picomoles",
        "litre"
      ],
      "printSymbol": "pmol/L"
    },
    {
      "code": "pmol/min",
      "CODE": "PMOL/MIN",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "picomole per minute",
        "picomole/minute",
        "pmol per min",
        "picomoles per minute",
        "micro enzyme units",
        "enzymatic activity",
        "enzyme activity"
      ],
      "printSymbol": "pmol/min"
    },
    {
      "code": "pmol/mL",
      "CODE": "PMOL/ML",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "picomole per milliliter",
        "picomole/milliliter",
        "picomole/millilitre",
        "pmol per mL",
        "picomoles",
        "millilitre",
        "picomols",
        "pmols"
      ],
      "printSymbol": "pmol/mL"
    },
    {
      "code": "pmol/umol",
      "CODE": "PMOL/UMOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "picomole per micromole",
        "pmol/mcgmol",
        "picomole/micromole",
        "pmol per umol",
        "pmol per mcgmol",
        "picomoles"
      ],
      "printSymbol": "pmol/μmol"
    },
    {
      "code": "ps",
      "CODE": "PS",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["picosecond", "picoseconds", "psec"],
      "printSymbol": "ps"
    },
    {
      "code": "pT",
      "CODE": "PT",
      "value": {"unit": "Wb/m2", "UNIT": "WB/M2", "value": "1", "text": "1"},
      "property": "magnetic flux density",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["picotesla", "picoteslas"],
      "printSymbol": "pT"
    },
    {
      "code": "U/(12.h)",
      "CODE": "U/HR",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per 12 hour",
        "U/12hrs",
        "U/ 12hrs",
        "U per 12 hrs",
        "12hrs",
        "enzyme units per 12 hours",
        "enzyme activity",
        "enzymatic activity per time",
        "umol per min per 12 hours",
        "micromoles per minute per 12 hours",
        "umol/min/12hr"
      ],
      "printSymbol": "U/h"
    },
    {
      "code": "U/(2.h)",
      "CODE": "U/HR",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per 2 hour",
        "U/2hrs",
        "U/ 2hrs",
        "U per 2 hrs",
        "2hrs",
        "enzyme units per 2 hours",
        "enzyme activity",
        "enzymatic activity per time",
        "umol per minute per 2 hours",
        "micromoles per minute",
        "umol/min/2hr",
        "umol per min per 2hr"
      ],
      "printSymbol": "U/h"
    },
    {
      "code": "U/(24.h)",
      "CODE": "U/HR",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per 24 hour",
        "U/24hrs",
        "U/ 24hrs",
        "U per 24 hrs",
        "24hrs",
        "enzyme units per 24 hours",
        "enzyme activity",
        "enzymatic activity per time",
        "micromoles per minute per 24 hours",
        "umol/min/24hr",
        "umol per min per 24hr"
      ],
      "printSymbol": "U/h"
    },
    {
      "code": "U/10",
      "CODE": "U",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per 10",
        "enzyme unit/10",
        "U per 10",
        "enzyme units per 10",
        "enzymatic activity",
        "enzyme activity",
        "micromoles per minute",
        "umol/min/10"
      ],
      "printSymbol": "U"
    },
    {
      "code": "U/10*10",
      "CODE": "U/(10*10)",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per 10 billion",
        "U per 10*10",
        "enzyme units per 10*10",
        "U per 10 billion",
        "enzyme units",
        "enzymatic activity",
        "micromoles per minute per 10 billion",
        "umol/min/10*10"
      ],
      "printSymbol": "U/(10<sup>10</sup>)"
    },
    {
      "code": "U/10*12",
      "CODE": "U/(10*12)",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per trillion",
        "enzyme unit/10*12",
        "U per 10*12",
        "enzyme units per 10*12",
        "enzyme units per trillion",
        "enzymatic activity",
        "micromoles per minute per trillion",
        "umol/min/10*12",
        "umol per min per 10*12"
      ],
      "printSymbol": "U/(10<sup>12</sup>)"
    },
    {
      "code": "U/10*6",
      "CODE": "U/(10*6)",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per million",
        "enzyme unit/10*6",
        "U per 10*6",
        "enzyme units per 10*6",
        "enzyme units",
        "enzymatic activity per volume",
        "micromoles per minute per million",
        "umol/min/10*6",
        "umol per min per 10*6"
      ],
      "printSymbol": "U/(10<sup>6</sup>)"
    },
    {
      "code": "U/10*9",
      "CODE": "U/(10*9)",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per billion",
        "enzyme unit/10*9",
        "U per 10*9",
        "enzyme units per 10*9",
        "enzymatic activity per volume",
        "micromoles per minute per billion",
        "umol/min/10*9",
        "umol per min per 10*9"
      ],
      "printSymbol": "U/(10<sup>9</sup>)"
    },
    {
      "code": "U/d",
      "CODE": "U/D",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per day",
        "U/dy",
        "enzyme units per day",
        "enzyme units",
        "enzyme activity",
        "enzymatic activity per time",
        "micromoles per minute per day",
        "umol/min/day",
        "umol per min per day"
      ],
      "printSymbol": "U/d"
    },
    {
      "code": "U/dL",
      "CODE": "U/DL",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per deciliter",
        "U per dL",
        "enzyme units per deciliter",
        "decilitre",
        "micromoles per minute per deciliter",
        "umol/min/dL",
        "umol per min per dL"
      ],
      "printSymbol": "U/dL"
    },
    {
      "code": "U/g",
      "CODE": "U/G",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per gram",
        "U/gm",
        "U per gm",
        "enzyme units per gram",
        "micromoles per minute per gram",
        "umol/min/g",
        "umol per min per g"
      ],
      "printSymbol": "U/g"
    },
    {
      "code": "U/h",
      "CODE": "U/HR",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per hour",
        "U/hr",
        "U per hr",
        "enzyme units per hour",
        "micromoles per minute per hour",
        "umol/min/hr",
        "umol per min per hr"
      ],
      "printSymbol": "U/h"
    },
    {
      "code": "U/L",
      "CODE": "U/L",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per liter",
        "enzyme unit/liter",
        "enzyme unit/litre",
        "U per L",
        "enzyme units per liter",
        "enzyme unit per litre",
        "micromoles per minute per liter",
        "umol/min/L",
        "umol per min per L"
      ],
      "printSymbol": "U/L"
    },
    {
      "code": "U/min",
      "CODE": "U/MIN",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per minute",
        "enzyme unit/minute",
        "U per min",
        "enzyme units",
        "umol/min/min",
        "micromoles per minute per minute",
        "micromoles per min per min",
        "umol"
      ],
      "printSymbol": "U/min"
    },
    {
      "code": "U/mL",
      "CODE": "U/ML",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per milliliter",
        "U per mL",
        "enzyme units per milliliter",
        "millilitre",
        "micromoles per minute per milliliter",
        "umol/min/mL",
        "umol per min per mL"
      ],
      "printSymbol": "U/mL"
    },
    {
      "code": "U/s",
      "CODE": "U/S",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "enzyme unit per second",
        "U/sec",
        "U per second",
        "enzyme units per second",
        "micromoles per minute per second",
        "umol/min/sec",
        "umol per min per sec"
      ],
      "printSymbol": "U/s"
    },
    {
      "code": "u[IU]",
      "CODE": "U[IU]",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micro international unit",
        "uIU",
        "u IU",
        "microinternational units"
      ],
      "printSymbol": "μi.U."
    },
    {
      "code": "u[IU]/L",
      "CODE": "U[IU]/L",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micro international unit per liter",
        "uIU/L",
        "u IU/L",
        "uIU per L",
        "microinternational units per liter",
        "litre",
        ""
      ],
      "printSymbol": "(μi.U.)/L"
    },
    {
      "code": "u[IU]/mL",
      "CODE": "U[IU]/ML",
      "value": {"unit": "[iU]", "UNIT": "[IU]", "value": "1", "text": "1"},
      "property": "arbitrary",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micro international unit per milliliter",
        "uIU/mL",
        "u IU/mL",
        "uIU per mL",
        "microinternational units per milliliter",
        "millilitre"
      ],
      "printSymbol": "(μi.U.)/mL"
    },
    {
      "code": "ueq",
      "CODE": "UEQ",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "microequivalent",
        "microequivalents",
        "10^-6 equivalents",
        "10-6 equivalents"
      ],
      "printSymbol": "μeq"
    },
    {
      "code": "ueq/L",
      "CODE": "UEQ/L",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "microequivalent per liter",
        "ueq per liter",
        "litre",
        "microequivalents"
      ],
      "printSymbol": "μeq/L"
    },
    {
      "code": "ueq/mL",
      "CODE": "UEQ/ML",
      "value": {"unit": "mol", "UNIT": "MOL", "value": "1", "text": "1"},
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "microequivalent per milliliter",
        "ueq per milliliter",
        "millilitre",
        "microequivalents"
      ],
      "printSymbol": "μeq/mL"
    },
    {
      "code": "ug",
      "CODE": "UG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["microgram", "mcg", "micrograms", "10^-6 grams", "10-6 grams"],
      "printSymbol": "μg"
    },
    {
      "code": "ug/(100.g)",
      "CODE": "UG/G",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per 100 gram",
        "ug/100gm",
        "ug/100 gm",
        "mcg",
        "ug per 100g",
        "100 gm",
        "mcg per 100g",
        "micrograms per 100 grams"
      ],
      "printSymbol": "μg/g"
    },
    {
      "code": "ug/(24.h)",
      "CODE": "UG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per 24 hour",
        "ug/24hrs",
        "ug/24 hrs",
        "mcg/24hrs",
        "ug per 24hrs",
        "mcg per 24hrs",
        "24 hrs",
        "micrograms per 24 hours"
      ],
      "printSymbol": "μg/h"
    },
    {
      "code": "ug/(8.h)",
      "CODE": "UG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per 8 hour",
        "ug/8hrs",
        "ug/8 hrs",
        "mcg/8hrs",
        "ug per 8hrs",
        "mcg per 8hrs",
        "8 hrs",
        "micrograms per 8 hours",
        "shift"
      ],
      "printSymbol": "μg/h"
    },
    {
      "code": "ug/[sft_i]",
      "CODE": "UG/[SFT_I]",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per square foot (international)",
        "ug/sft",
        "ug/ft2",
        "ug/ft^2",
        "ug/sq. ft",
        "micrograms",
        "sq. foot",
        "foot squared"
      ],
      "printSymbol": "μg"
    },
    {
      "code": "ug/d",
      "CODE": "UG/D",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per day",
        "ug/dy",
        "mcg/dy",
        "ug per day",
        "mcg",
        "micrograms per day"
      ],
      "printSymbol": "μg/d"
    },
    {
      "code": "ug/dL",
      "CODE": "UG/DL",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per deciliter",
        "ug per dL",
        "mcg/dl",
        "mcg per dl",
        "micrograms per deciliter",
        "decilitre"
      ],
      "printSymbol": "μg/dL"
    },
    {
      "code": "ug/g",
      "CODE": "UG/G",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per gram",
        "ug per gm",
        "mcg/gm",
        "mcg per g",
        "micrograms per gram"
      ],
      "printSymbol": "μg/g"
    },
    {
      "code": "ug/h",
      "CODE": "UG/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per hour",
        "ug/hr",
        "mcg/hr",
        "mcg per hr",
        "ug per hr",
        "ug per hour",
        "micrograms"
      ],
      "printSymbol": "μg/h"
    },
    {
      "code": "ug/kg",
      "CODE": "UG/KG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per kilogram",
        "ug per kg",
        "mcg/kg",
        "mcg per kg",
        "micrograms per kilogram"
      ],
      "printSymbol": "μg/kg"
    },
    {
      "code": "ug/kg/(8.h)",
      "CODE": "(UG/KG)/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per kilogram per 8 hour",
        "ug/kg/8hrs",
        "mcg/kg/8hrs",
        "ug/kg/8 hrs",
        "mcg/kg/8 hrs",
        "ug per kg per 8hrs",
        "8 hrs",
        "mcg per kg per 8hrs",
        "micrograms per kilograms per 8 hours",
        "shift"
      ],
      "printSymbol": "(μg/kg)/h"
    },
    {
      "code": "ug/kg/d",
      "CODE": "(UG/KG)/D",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per kilogram per day",
        "ug/(kg.d)",
        "ug/kg/dy",
        "mcg/kg/day",
        "ug per kg per dy",
        "24 hours",
        "24hrs",
        "mcg",
        "kilograms",
        "microgram per kilogram and day"
      ],
      "printSymbol": "(μg/kg)/d"
    },
    {
      "code": "ug/kg/h",
      "CODE": "(UG/KG)/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per kilogram per hour",
        "ug/(kg.h)",
        "ug/kg/hr",
        "mcg/kg/hr",
        "ug per kg per hr",
        "mcg per kg per hr",
        "kilograms"
      ],
      "printSymbol": "(μg/kg)/h"
    },
    {
      "code": "ug/kg/min",
      "CODE": "(UG/KG)/MIN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per kilogram per minute",
        "ug/kg/min",
        "ug/kg/min",
        "mcg/kg/min",
        "ug per kg per min",
        "mcg",
        "micrograms per kilograms per minute"
      ],
      "printSymbol": "(μg/kg)/min"
    },
    {
      "code": "ug/L",
      "CODE": "UG/L",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per liter",
        "mcg/L",
        "ug per L",
        "mcg",
        "micrograms per liter",
        "litre"
      ],
      "printSymbol": "μg/L"
    },
    {
      "code": "ug/L/(24.h)",
      "CODE": "(UG/L)/HR",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per liter per 24 hour",
        "ug/L/24hrs",
        "ug/L/24 hrs",
        "mcg/L/24hrs",
        "ug per L per 24hrs",
        "24 hrs",
        "day",
        "dy mcg",
        "micrograms per liters per 24 hours",
        "litres"
      ],
      "printSymbol": "(μg/L)/h"
    },
    {
      "code": "ug/m2",
      "CODE": "UG/M2",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per square meter",
        "ug/m^2",
        "ug/sq. m",
        "mcg/m2",
        "mcg/m^2",
        "mcg/sq. m",
        "ug per m2",
        "m^2",
        "sq. meter",
        "mcg",
        "micrograms per square meter",
        "meter squared",
        "metre"
      ],
      "printSymbol": "μg/(m<sup>2</sup>)"
    },
    {
      "code": "ug/m3",
      "CODE": "UG/M3",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per cubic meter",
        "ug/m^3",
        "ug/cu. m",
        "mcg/m3",
        "mcg/m^3",
        "mcg/cu. m",
        "ug per m3",
        "ug per m^3",
        "ug per cu. m",
        "mcg",
        "micrograms per cubic meter",
        "meter cubed",
        "metre"
      ],
      "printSymbol": "μg/(m<sup>3</sup>)"
    },
    {
      "code": "ug/mg",
      "CODE": "UG/MG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per milligram",
        "ug per mg",
        "mcg/mg",
        "mcg per mg",
        "micromilligrams per milligram"
      ],
      "printSymbol": "μg/mg"
    },
    {
      "code": "ug/min",
      "CODE": "UG/MIN",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per minute",
        "ug per min",
        "mcg/min",
        "mcg per min",
        "microminutes per minute"
      ],
      "printSymbol": "μg/min"
    },
    {
      "code": "ug/mL",
      "CODE": "UG/ML",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per milliliter",
        "ug per mL",
        "mcg/mL",
        "mcg per mL",
        "micrograms per milliliter",
        "millilitre"
      ],
      "printSymbol": "μg/mL"
    },
    {
      "code": "ug/mmol",
      "CODE": "UG/MMOL",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per millimole",
        "ug per mmol",
        "mcg/mmol",
        "mcg per mmol",
        "micrograms per millimole"
      ],
      "printSymbol": "μg/mmol"
    },
    {
      "code": "ug/ng",
      "CODE": "UG/NG",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "mass",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microgram per nanogram",
        "ug per ng",
        "mcg/ng",
        "mcg per ng",
        "micrograms per nanogram"
      ],
      "printSymbol": "μg/ng"
    },
    {
      "code": "ukat",
      "CODE": "UKAT",
      "value": {"unit": "mol/s", "UNIT": "MOL/S", "value": "1", "text": "1"},
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["microkatal", "microkatals", "ukats"],
      "printSymbol": "μkat"
    },
    {
      "code": "uL",
      "CODE": "UL",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["microliter", "microliters", "microlitres", "mcl"],
      "printSymbol": "μL"
    },
    {
      "code": "uL/(2.h)",
      "CODE": "UL/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "microliter per 2 hour",
        "uL/2hrs",
        "uL/2 hrs",
        "mcg/2hr",
        "mcg per 2hr",
        "uL per 2hr",
        "uL per 2 hrs",
        "microliters per 2 hours",
        "microlitres"
      ],
      "printSymbol": "μL/h"
    },
    {
      "code": "uL/h",
      "CODE": "UL/HR",
      "value": {"unit": "l", "UNIT": null, "value": "1", "text": "1"},
      "property": "volume",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "microliter per hour",
        "uL/hr",
        "mcg/hr",
        "mcg per hr",
        "uL per hr",
        "microliters per hour",
        "microlitres"
      ],
      "printSymbol": "μL/h"
    },
    {
      "code": "um",
      "CODE": "UM",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["micrometer", "micrometers", "micrometres", "μm", "microns"],
      "printSymbol": "μm"
    },
    {
      "code": "um/s",
      "CODE": "UM/S",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "length",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": [
        "microns per second",
        "um/sec",
        "micron/second",
        "microns/second",
        "um per sec",
        "micrometers per second",
        "micrometres"
      ],
      "printSymbol": "μm/s"
    },
    {
      "code": "umol",
      "CODE": "UMOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["micromole", "micromoles", "umols"],
      "printSymbol": "μmol"
    },
    {
      "code": "umol/(2.h)",
      "CODE": "UMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per 2 hour",
        "umol/2hrs",
        "umol/2 hrs",
        "umol per 2 hrs",
        "2hrs",
        "micromoles per 2 hours"
      ],
      "printSymbol": "μmol/h"
    },
    {
      "code": "umol/(24.h)",
      "CODE": "UMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per 24 hour",
        "umol/24hrs",
        "umol/24 hrs",
        "umol per 24 hrs",
        "per 24hrs",
        "micromoles per 24 hours"
      ],
      "printSymbol": "μmol/h"
    },
    {
      "code": "umol/(8.h)",
      "CODE": "UMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per 8 hour",
        "umol/8hr",
        "umol/8 hr",
        "umol per 8 hr",
        "umol per 8hr",
        "umols per 8hr",
        "umol per 8 hours",
        "micromoles per 8 hours",
        "shift"
      ],
      "printSymbol": "μmol/h"
    },
    {
      "code": "umol/d",
      "CODE": "UMOL/D",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per day",
        "umol/day",
        "umol per day",
        "umols per day",
        "umol per days",
        "micromoles per days",
        "umol/24hr",
        "umol/24 hr",
        "umol per 24 hr",
        "umol per 24hr",
        "umols per 24hr",
        "umol per 24 hours",
        "micromoles per 24 hours"
      ],
      "printSymbol": "μmol/d"
    },
    {
      "code": "umol/dL",
      "CODE": "UMOL/DL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per deciliter",
        "micromole/deciliter",
        "micromole/decilitre",
        "umol per dL",
        "micromoles per deciliters",
        "micromole per decilitres"
      ],
      "printSymbol": "μmol/dL"
    },
    {
      "code": "umol/g",
      "CODE": "UMOL/G",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per gram",
        "micromole/gram",
        "umol per g",
        "micromoles per gram"
      ],
      "printSymbol": "μmol/g"
    },
    {
      "code": "umol/h",
      "CODE": "UMOL/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per hour",
        "umol/hr",
        "umol per hr",
        "umol per hour",
        "micromoles per hours"
      ],
      "printSymbol": "μmol/h"
    },
    {
      "code": "umol/kg",
      "CODE": "UMOL/KG",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per kilogram",
        "umol per kg",
        "micromoles per kilogram"
      ],
      "printSymbol": "μmol/kg"
    },
    {
      "code": "umol/L",
      "CODE": "UMOL/L",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per liter",
        "micromole/liter",
        "micromole/litre",
        "umol per liter",
        "micromoles per liter",
        "litre"
      ],
      "printSymbol": "μmol/L"
    },
    {
      "code": "umol/L/h",
      "CODE": "(UMOL/L)/HR",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per liter per hour",
        "umol/liter/hr",
        "umol/litre/hr",
        "umol per L per hr",
        "umol per liter per hour",
        "micromoles per liters per hour",
        "litre"
      ],
      "printSymbol": "(μmol/L)/h"
    },
    {
      "code": "umol/mg",
      "CODE": "UMOL/MG",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per milligram",
        "micromole/milligram",
        "umol per mg",
        "micromoles per milligram"
      ],
      "printSymbol": "μmol/mg"
    },
    {
      "code": "umol/min",
      "CODE": "UMOL/MIN",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per minute",
        "micromole/minute",
        "umol per min",
        "micromoles per minute",
        "enzyme units"
      ],
      "printSymbol": "μmol/min"
    },
    {
      "code": "umol/min/g",
      "CODE": "(UMOL/MIN)/G",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per minute per gram",
        "umol/min/gm",
        "umol per min per gm",
        "micromoles per minutes per gram",
        "U/g",
        "enzyme units"
      ],
      "printSymbol": "(μmol/min)/g"
    },
    {
      "code": "umol/min/L",
      "CODE": "(UMOL/MIN)/L",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per minute per liter",
        "umol/min/liter",
        "umol/minute/liter",
        "micromoles per minutes per liter",
        "litre",
        "enzyme units",
        "U/L"
      ],
      "printSymbol": "(μmol/min)/L"
    },
    {
      "code": "umol/mL",
      "CODE": "UMOL/ML",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per milliliter",
        "umol per mL",
        "micromoles per milliliter",
        "millilitre"
      ],
      "printSymbol": "μmol/mL"
    },
    {
      "code": "umol/mL/min",
      "CODE": "(UMOL/ML)/MIN",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per milliliter per minute",
        "umol per mL per min",
        "micromoles per milliliters per minute",
        "millilitres"
      ],
      "printSymbol": "(μmol/mL)/min"
    },
    {
      "code": "umol/mmol",
      "CODE": "UMOL/MMOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per millimole",
        "umol per mmol",
        "micromoles per millimole"
      ],
      "printSymbol": "μmol/mmol"
    },
    {
      "code": "umol/mol",
      "CODE": "UMOL/MOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["micromole per mole", "umol per mol", "micromoles per mole"],
      "printSymbol": "μmol/mol"
    },
    {
      "code": "umol/umol",
      "CODE": "UMOL/UMOL",
      "value": {
        "unit": "10*23",
        "UNIT": "10*23",
        "value": "6.0221367",
        "text": "6.0221367"
      },
      "property": "amount of substance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micromole per micromole",
        "umol per umol",
        "micromoles per micromole"
      ],
      "printSymbol": "μmol/μmol"
    },
    {
      "code": "uOhm",
      "CODE": "UOHM",
      "value": {"unit": "V/A", "UNIT": "V/A", "value": "1", "text": "1"},
      "property": "electric resistance",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["microOhm", "microOhms", "µΩ"],
      "printSymbol": "μΩ"
    },
    {
      "code": "us",
      "CODE": "US",
      "value": {"unit": null, "UNIT": null, "value": null, "text": "null"},
      "property": "time",
      "isMetric": false,
      "isSpecial": false,
      "class": null,
      "name": ["microsecond", "microseconds"],
      "printSymbol": "μs"
    },
    {
      "code": "uU/g",
      "CODE": "UU/G",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micro enzyme unit per gram",
        "uU per gm",
        "micro enzyme units per gram",
        "micro enzymatic activity per mass",
        "enzyme activity"
      ],
      "printSymbol": "μU/g"
    },
    {
      "code": "uU/L",
      "CODE": "UU/L",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micro enzyme unit per liter",
        "uU per L",
        "micro enzyme units per liter",
        "litre",
        "enzymatic activity per volume",
        "enzyme activity"
      ],
      "printSymbol": "μU/L"
    },
    {
      "code": "uU/mL",
      "CODE": "UU/ML",
      "value": {
        "unit": "umol/min",
        "UNIT": "UMOL/MIN",
        "value": "1",
        "text": "1"
      },
      "property": "catalytic activity",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": [
        "micro enzyme unit per milliliter",
        "uU per mL",
        "micro enzyme units per milliliter",
        "millilitre",
        "enzymatic activity per volume",
        "enzyme activity"
      ],
      "printSymbol": "μU/mL"
    },
    {
      "code": "uV",
      "CODE": "UV",
      "value": {"unit": "J/C", "UNIT": "J/C", "value": "1", "text": "1"},
      "property": "electric potential",
      "isMetric": true,
      "isSpecial": false,
      "class": null,
      "name": ["microvolt", "microvolts"],
      "printSymbol": "μV"
    }
  ],
};
