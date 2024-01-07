import 'ucum_pkg.dart';

class UcumUnit {
  bool isBase_;
  String name_;
  String csCode_;
  String ciCode_;
  String property_;
  Number magnitude_;
  Dimension? dim_;
  String? printSymbol_;
  String? class_;
  bool isMetric_;
  String? variable_;
  String? cnv_;
  Number cnvPfx_;
  bool isSpecial_;
  bool isArbitrary_;
  int moleExp_;
  String? synonyms_;
  String? source_;
  String? loincProperty_;
  String? category_;
  String? guidance_;
  String? csUnitString_;
  String? ciUnitString_;
  String? baseFactorStr_;
  num? baseFactor_;
  bool defError_;

  UcumUnit(
    this.isBase_,
    this.name_,
    this.csCode_,
    this.ciCode_,
    this.property_,
    dynamic magnitude_,
    List<int> dim_,
    this.printSymbol_,
    this.class_,
    this.isMetric_,
    this.variable_,
    this.cnv_,
    this.cnvPfx_,
    this.isSpecial_,
    this.isArbitrary_,
    this.moleExp_,
    this.synonyms_,
    this.source_,
    this.loincProperty_,
    this.category_,
    this.guidance_,
    this.csUnitString_,
    this.ciUnitString_,
    this.baseFactorStr_,
    this.baseFactor_,
    this.defError_,
  )   : dim_ = Dimension(dim_),
        magnitude_ =
            magnitude_ is num || magnitude_ is BigInt ? magnitude_ : null;

  // Constructor
  UcumUnit.namedConstructor({
    this.isBase_ = false,
    this.name_ = '',
    this.csCode_ = '',
    this.ciCode_ = '',
    this.property_ = '',
    Number? magnitude_,
    Dimension? dim_,
    this.printSymbol_,
    this.class_,
    this.isMetric_ = false,
    this.variable_,
    this.cnv_,
    Number? cnvPfx_,
    this.isSpecial_ = false,
    this.isArbitrary_ = false,
    this.moleExp_ = 0,
    this.synonyms_,
    this.source_,
    this.loincProperty_,
    this.category_,
    this.guidance_,
    this.csUnitString_,
    this.ciUnitString_,
    this.baseFactorStr_,
    this.baseFactor_,
    this.defError_ = false,
  })  : dim_ = dim_ ?? Dimension(),
        magnitude_ = magnitude_ ?? Number.one(),
        cnvPfx_ = cnvPfx_ ?? Number.one();

  factory UcumUnit.fromJson(Map<String, dynamic> json) {
    return UcumUnit.namedConstructor(
      isBase_: json['isBase_'] as bool,
      name_: json['name_'] as String,
      csCode_: json['csCode_'] as String,
      ciCode_: json['ciCode_'] as String,
      property_: json['property_'] as String,
      magnitude_: json['magnitude_'] is num
          ? Number.num(json['magnitude_'])
          : json['magnitude_'] is BigInt
              ? Number.bigInt(json['magnitude_'])
              : null,
      dim_: json['dim_'] == null ? null : Dimension.fromJson(json['dim_']),
      printSymbol_: json['printSymbol_'] as String?,
      class_: json['class_'] as String?,
      isMetric_: json['isMetric_'] as bool,
      variable_: json['variable_'] as String?,
      cnv_: json['cnv_'] as String?,
      cnvPfx_: json['cnvPfx_'] is num
          ? Number.num(json['cnvPfx_'])
          : json['cnvPfx_'] is BigInt
              ? Number.bigInt(json['cnvPfx_'])
              : json['cnvPfx_'] is String
                  ? num.tryParse(json['cnvPfx_']) != null
                      ? Number.num(num.parse(json['cnvPfx_']))
                      : BigInt.tryParse(json['cnvPfx_']) != null
                          ? Number.bigInt(BigInt.parse(json['cnvPfx_']))
                          : null
                  : null,
      isSpecial_: json['isSpecial_'] as bool,
      isArbitrary_: json['isArbitrary_'] as bool,
      moleExp_: json['moleExp_'] as int,
      synonyms_: json['synonyms_'] as String?,
      source_: json['source_'] as String,
      loincProperty_: json['loincProperty_'] as String?,
      category_: json['category_'] as String?,
      guidance_: json['guidance_'] as String?,
      csUnitString_: json['csUnitString_'] as String?,
      ciUnitString_: json['ciUnitString_'] as String?,
      baseFactorStr_: json['baseFactorStr_'] as String?,
      baseFactor_: json['baseFactor_'] as num?,
      defError_: json['defError_'] as bool,
    );
  }

  UcumUnit copyWith({
    bool? isBase_,
    String? name_,
    String? csCode_,
    String? ciCode_,
    String? property_,
    Number? magnitude_,
    Dimension? dim_,
    String? printSymbol_,
    String? class_,
    bool? isMetric_,
    String? variable_,
    String? cnv_,
    Number? cnvPfx_,
    bool? isSpecial_,
    bool? isArbitrary_,
    int? moleExp_,
    String? synonyms_,
    String? source_,
    String? loincProperty_,
    String? category_,
    String? guidance_,
    String? csUnitString_,
    String? ciUnitString_,
    String? baseFactorStr_,
    num? baseFactor_,
    bool? defError_,
  }) {
    return UcumUnit.namedConstructor(
      isBase_: isBase_ ?? this.isBase_,
      name_: name_ ?? this.name_,
      csCode_: csCode_ ?? this.csCode_,
      ciCode_: ciCode_ ?? this.ciCode_,
      property_: property_ ?? this.property_,
      magnitude_: magnitude_ ?? this.magnitude_,
      dim_: dim_ ?? this.dim_,
      printSymbol_: printSymbol_ ?? this.printSymbol_,
      class_: class_ ?? this.class_,
      isMetric_: isMetric_ ?? this.isMetric_,
      variable_: variable_ ?? this.variable_,
      cnv_: cnv_ ?? this.cnv_,
      cnvPfx_: cnvPfx_ ?? this.cnvPfx_,
      isSpecial_: isSpecial_ ?? this.isSpecial_,
      isArbitrary_: isArbitrary_ ?? this.isArbitrary_,
      moleExp_: moleExp_ ?? this.moleExp_,
      synonyms_: synonyms_ ?? this.synonyms_,
      source_: source_ ?? this.source_,
      loincProperty_: loincProperty_ ?? this.loincProperty_,
      category_: category_ ?? this.category_,
      guidance_: guidance_ ?? this.guidance_,
      csUnitString_: csUnitString_ ?? this.csUnitString_,
      ciUnitString_: ciUnitString_ ?? this.ciUnitString_,
      baseFactorStr_: baseFactorStr_ ?? this.baseFactorStr_,
      baseFactor_: baseFactor_ ?? this.baseFactor_,
      defError_: defError_ ?? this.defError_,
    );
  }

  // Example of the clone method
  UcumUnit clone() => UcumUnit(
        this.isBase_,
        this.name_,
        this.csCode_,
        this.ciCode_,
        this.property_,
        this.magnitude_,
        this.dim_?.dimVec_ ?? [],
        this.printSymbol_,
        this.class_,
        this.isMetric_,
        this.variable_,
        this.cnv_,
        this.cnvPfx_,
        this.isSpecial_,
        this.isArbitrary_,
        this.moleExp_,
        this.synonyms_,
        this.source_,
        this.loincProperty_,
        this.category_,
        this.guidance_,
        this.csUnitString_,
        this.ciUnitString_,
        this.baseFactorStr_,
        this.baseFactor_,
        this.defError_,
      );

  factory UcumUnit.unity() => UcumUnit.namedConstructor(
        name_: '',
        magnitude_: Number.one(),
        dim_: Dimension.zero(),
        cnvPfx_: Number.one(),
      );

  /// Assign the unity (= dimensionless unit 1) to this unit.
  void assignUnity() {
    this.name_ = "";
    this.magnitude_ = Number.one();
    this.dim_ ??= Dimension.zero();
    this.cnv_ = null;
    this.cnvPfx_ = Number.one();
  }

  Number convertFrom(Number num, UcumUnit fromUnit) {
    Number newNum = Number.double(0.0);

    if (isArbitrary_) {
      throw Exception('Attempt to convert to arbitrary unit "$csCode_"');
    }
    if (fromUnit.isArbitrary_) {
      throw Exception(
          'Attempt to convert arbitrary unit "${fromUnit.csCode_}"');
    }

    if (fromUnit.dim_ != null && dim_ != null && fromUnit.dim_ != dim_) {
      if (isMoleMassCommensurable(fromUnit)) {
        throw Exception('A molecular weight is needed for conversion.');
      } else {
        throw Exception(
            'Sorry. ${fromUnit.csCode_} cannot be converted to $csCode_.');
      }
    }

    if (fromUnit.dim_ != null && (dim_ == null || (dim_?.isNull() ?? true))) {
      throw Exception(
          'Sorry. ${fromUnit.csCode_} cannot be converted to $csCode_.');
    }

    if (dim_ != null &&
        (fromUnit.dim_ == null || (fromUnit.dim_?.isNull() ?? false))) {
      throw Exception(
          'Sorry. ${fromUnit.csCode_} cannot be converted to $csCode_.');
    }

    Number x;
    if (fromUnit.cnv_ != null) {
      var fromFunc = UcumFunctions.forName(fromUnit.cnv_!);
      x = fromUnit.magnitude_ * fromFunc.cnvFrom(num * fromUnit.cnvPfx_);
    } else {
      x = fromUnit.magnitude_ * num;
    }

    if (cnv_ != null) {
      FunctionPair toFunc = UcumFunctions.forName(cnv_!);
      newNum = toFunc.cnvTo(x / magnitude_) / cnvPfx_;
    } else {
      newNum = magnitude_.dividedIntoNumber(x);
    }

    return newNum;
  }

  bool isMoleMassCommensurable(UcumUnit unit2) {
    UnitTables tabs = getUnitTables();
    var d = tabs.getMassDimensionIndex();
    bool commensurable = false;

    if (moleExp_ == 1 && unit2.moleExp_ == 0) {
      Dimension? testDim = dim_?.clone();
      int? curVal = testDim?.getElementAt(d);
      testDim?.setElementAt(d, (curVal ?? 0) + moleExp_);
      commensurable = testDim == unit2.dim_;
    } else if (unit2.moleExp_ == 1 && moleExp_ == 0) {
      Dimension? testDim = unit2.dim_?.clone();
      int? curVal = testDim?.getElementAt(d);
      testDim?.setElementAt(d, (curVal ?? 0) + unit2.moleExp_);
      commensurable = testDim == dim_;
    }

    return commensurable;
  }

  // Method to get UnitTables instance
  UnitTables getUnitTables() => UnitTables.instance;

  // Example of the multiplyThis method
  UcumUnit multiplyThis(num s) {
    // Placeholder for actual implementation
    return UcumUnit.namedConstructor();
  }

  // Example of the multiplyThese method
  UcumUnit multiplyThese(UcumUnit unit2) {
    // Placeholder for actual implementation
    return UcumUnit.namedConstructor();
  }

  // Example of the divide method
  UcumUnit divide(UcumUnit unit2) {
    // Placeholder for actual implementation
    return UcumUnit.namedConstructor();
  }

  // Example of the invert method
  UcumUnit invert() {
    // Placeholder for actual implementation
    return UcumUnit.namedConstructor();
  }

  // Example of the invertString method
  String invertString(String theString) {
    // Placeholder for actual implementation
    return '';
  }

  // Example of the _concatStrs method
  String _concatStrs(String str1, String operator, String str2,
      String startChar, String endChar) {
    // Placeholder for actual implementation
    return '';
  }

  // Example of the _buildOneString method
  String _buildOneString(String str, String startChar, String endChar) {
    // Placeholder for actual implementation
    return '';
  }

  UcumUnit power(int p) {
    if (cnv_ != null) {
      throw Exception('Attempt to raise a non-ratio unit, $name_, to a power.');
    }

    var uArray = RegExp(r'([./]|[^./]+)')
        .allMatches(csCode_)
        .map((m) => m.group(0))
        .toList();
    for (int i = 0; i < uArray.length; i++) {
      String un = uArray[i]!;
      if (un != '/' && un != '.') {
        int? nun = int.tryParse(un);
        if (nun != null) {
          uArray[i] = (nun * p).toString();
        } else {
          int uLen = un.length;
          for (int u = uLen - 1; u >= 0; u--) {
            int? uChar = int.tryParse(un[u]);
            if (uChar == null) {
              if (un[u] == '-' || un[u] == '+') {
                u--;
              }
              if (u < uLen - 1) {
                int exp = int.parse(un.substring(u + 1));
                exp = (exp * p).toInt();
                uArray[i] = un.substring(0, u + 1) + exp.toString();
                break;
              } else {
                uArray[i] = un + p.toString();
                break;
              }
            }
          }
        }
      }
    }
    csCode_ = uArray.join('');
    magnitude_ = magnitude_ * p;
    if (dim_ != null) {
      dim_?.mul(p);
    }

    return this;
  }

  // Convert a mass unit to a mole unit
  Number convertMassToMol(
    double amt,
    UcumUnit molUnit,
    double molecularWeight,
  ) {
    UnitTables tabs = getUnitTables();
    Number? avoNum = tabs.getUnitByCode('mol')?.magnitude_;
    Number? molesFactor = avoNum == null ? null : molUnit.magnitude_ / avoNum;
    Number molAmt = this.magnitude_ * amt / molecularWeight;
    return molesFactor == null ? Number.integer(0) : molAmt / molesFactor;
  }

  // Convert a mole unit to a mass unit
  Number convertMolToMass(
      double amt, UcumUnit massUnit, double molecularWeight) {
    UnitTables tabs = getUnitTables();
    Number? avoNum = tabs.getUnitByCode('mol')?.magnitude_;
    Number? molesFactor = avoNum == null ? null : this.magnitude_ / avoNum;
    Number? massAmt =
        molesFactor == null ? null : (molesFactor * amt) * molecularWeight;
    return massAmt == null ? Number.integer(0) : massAmt / massUnit.magnitude_;
  }

  ///  Clears fields like isBase_, synonyms_, etc. when a unit has been cloned
  ///  from a known unit but it being used to construct a derived unit.
  ///
  resetFieldsForDerivedUnit() {
    this.guidance_ = '';
    this.synonyms_ = null;
    this.isBase_ = false;
  }

  dynamic fieldByString(String string) {
    switch (string) {
      case 'isBase_':
        return isBase_;
      case 'name_':
        return name_;
      case 'csCode_':
        return csCode_;
      case 'ciCode_':
        return ciCode_;
      case 'property_':
        return property_;
      case 'magnitude_':
        return magnitude_;
      case 'dim_':
        return dim_;
      case 'printSymbol_':
        return printSymbol_;
      case 'class_':
        return class_;
      case 'isMetric_':
        return isMetric_;
      case 'variable_':
        return variable_;
      case 'cnv_':
        return cnv_;
      case 'cnvPfx_':
        return cnvPfx_;
      case 'isSpecial_':
        return isSpecial_;
      case 'isArbitrary_':
        return isArbitrary_;
      case 'moleExp_':
        return moleExp_;
      case 'synonyms_':
        return synonyms_;
      case 'source_':
        return source_;
      case 'loincProperty_':
        return loincProperty_;
      case 'category_':
        return category_;
      case 'guidance_':
        return guidance_;
      case 'csUnitString_':
        return csUnitString_;
      case 'ciUnitString_':
        return ciUnitString_;
      case 'baseFactorStr_':
        return baseFactorStr_;
      case 'baseFactor_':
        return baseFactor_;
      case 'defError_':
        return defError_;
      default:
        throw ('Unknown field $string');
    }
  }

  @override
  String toString() {
    List<String> parts = [];
    parts.add('isBase_: $isBase_');
    parts.add('name_: $name_');
    parts.add('csCode_: $csCode_');
    parts.add('ciCode_: $ciCode_');
    parts.add('property_: $property_');
    parts.add('magnitude_: $magnitude_');
    if (dim_ != null) parts.add('dim_: $dim_');
    if (printSymbol_ != null) parts.add('printSymbol_: $printSymbol_');
    if (class_ != null) parts.add('class_: $class_');
    parts.add('isMetric_: $isMetric_');
    if (variable_ != null) parts.add('variable_: $variable_');
    if (cnv_ != null) parts.add('cnv_: $cnv_');
    parts.add('cnvPfx_: $cnvPfx_');
    parts.add('isSpecial_: $isSpecial_');
    parts.add('isArbitrary_: $isArbitrary_');
    parts.add('moleExp_: $moleExp_');
    if (synonyms_ != null) parts.add('synonyms_: $synonyms_');
    if (source_ != null) parts.add('source_: $source_');
    if (loincProperty_ != null) parts.add('loincProperty_: $loincProperty_');
    if (category_ != null) parts.add('category_: $category_');
    if (guidance_ != null) parts.add('guidance_: $guidance_');
    if (csUnitString_ != null) parts.add('csUnitString_: $csUnitString_');
    if (ciUnitString_ != null) parts.add('ciUnitString_: $ciUnitString_');
    if (baseFactorStr_ != null) parts.add('baseFactorStr_: $baseFactorStr_');
    if (baseFactor_ != null) parts.add('baseFactor_: $baseFactor_');
    parts.add('defError_: $defError_');
    return parts.join(', ');
  }
}
