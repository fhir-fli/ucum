// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:test/test.dart';
import 'package:ucum/ucum.dart';

void main() {
  group('UCUM Common Unit Tests: ', () {
    // TODO(Dokotela): In the Java tests, the print statements below also print
    // out, so it's unclear to me if they are errors or just making notations

    late UcumService ucumService;

    setUpAll(() {
      ucumService = getUcumService();
    });

    test('Analyze', () {
      for (final CommonUnit cu in units) {
        try {
          ucumService.analyse(cu.unit);
          expect(true, true);
        } catch (e) {
          expect(true, false);
        }
      }
    });

    test('Canonical', () {
      final Set<String> set = <String>{};
      for (final CommonUnit cu in units) {
        // BUG?
        if ('db' == cu.unit) {
          continue;
        }
        final String can = ucumService.getCanonicalUnits(cu.unit);
        if (null != cu.can) {
          expect(cu.can, can, reason: cu.unit);
        } else if (set.add('${cu.dim ?? ""} -> $can') && cu.dim != null) {
          print('${cu.dim ?? ""} -> $can\t\t${cu.unit}');
        }
      }
    });

    test('Convert', () {
      final UcumDecimal ONE = UcumDecimal.fromString('1', 15);
      for (final CommonUnit cu in units) {
        // BUG: avoid NPE
        if ('Cel' == cu.unit || '[degF]' == cu.unit || '[pH]' == cu.unit) {
          continue;
        }
        // maybe bug? avoid UnumException
        if ('dB' == cu.unit) {
          continue;
        }
        try {
          final String can = ucumService.getCanonicalUnits(cu.unit);
          if ('' != can) {
            ucumService.convert(ONE, cu.unit, can);
          }
        } catch (x) {
          expect(true, false, reason: '${cu.unit}: $x');
        }
      }
    });

    test('Convert2', () {
      void convertAll(List<CommonUnit> list) {
        final UcumDecimal K = UcumDecimal.fromString('2.3', 15);
        for (final CommonUnit a in list) {
          for (final CommonUnit b in list) {
            try {
              // BUG?
              if ('[pH]' == a.unit) {
                continue;
              }
              if ('Cel' == a.unit || '[degF]' == a.unit) {
                continue;
              }
              ucumService.convert(K, a.unit, b.unit);
            } catch (x) {
              print('${a.unit}->${b.unit} : $x');
            }
          }
        }
      }

      final Map<String, List<CommonUnit>> map = <String, List<CommonUnit>>{};
      for (final CommonUnit cu in units) {
        // BUG?
        if ('dB' == cu.unit) {
          continue;
        }
        final String can = ucumService.getCanonicalUnits(cu.unit);
        if ('' == can) {
          continue;
        }
        if (!map.containsKey(can)) {
          map[can] = <CommonUnit>[];
        }
        map[can]!.add(cu);
      }
      for (final String can in map.keys) {
        final List<CommonUnit> list = map[can]!;
        convertAll(list);
      }
    });

    test('Duplicates', () {
      final Set<String> set = <String>{};
      for (final CommonUnit cu in units) {
        if (!set.add(cu.unit)) {
          print('DUPLICATE: ${cu.unit}');
        }
      }
    });
  });
}

class CommonUnit {
  final String unit;
  final String? dim; // not really using this
  final String? can; // canonical unit

  CommonUnit(this.unit, this.dim, [this.can]);

  @override
  String toString() => 'CU(unit: $unit, dim: $dim, can: $can)';
}

UcumService getUcumService() => UcumService();

// Commonly Used UCM Codes (sorted to remove duplicates, not for readability)
final List<CommonUnit> units = <CommonUnit>[
  CommonUnit('%{0to3Hours}', '1'),
  CommonUnit('%', '1'),
  CommonUnit('/100', '1'),
  CommonUnit('/100{cells}', null),
  CommonUnit('/100{neutrophils}', null),
  CommonUnit('/100{Spermatozoa}', '1'),
  CommonUnit('%/100{WBC}', '1'),
  CommonUnit('/100{WBC}', '1'),
  CommonUnit('/100{WBCs}', null),
  CommonUnit('/10*10', '1'),
  CommonUnit('/10*12', '1'),
  CommonUnit('10*12/L', 'L-17', 'm-3'),
  CommonUnit('/10*12{rbc}', '1'),
  CommonUnit('/10*12{RBCs}', null),
  CommonUnit('10*3', '1'),
  CommonUnit('10*3{Copies}/mL', 'L-9', 'm-3'),
  CommonUnit('10*3{copies}/mL', null),
  CommonUnit('10*3/L', 'L-15', 'm-3'),
  CommonUnit('10*3/mL', 'L-8', 'm-3'),
  CommonUnit('/10*3', null),
  CommonUnit('10*3.{RBC}', '1'),
  CommonUnit('/10*3{RBCs}', null),
  CommonUnit('10*3{RBCs}', null),
  CommonUnit('10*3/uL', 'L-3', 'm-3'),
  CommonUnit('/10*4{RBCs}', null),
  CommonUnit('10*4/uL', null),
  CommonUnit('10*5', '1'),
  CommonUnit('/10*6', '1'),
  CommonUnit('10*6', '1'),
  CommonUnit('10*6/(24.h)', null),
  CommonUnit('10*6.[CFU]/L', null),
  CommonUnit('10*6.eq/mL', 'L-3N', 'm-3'),
  CommonUnit('10*6.[iU]', '[arb]'),
  CommonUnit('10*6.[IU]', null),
  CommonUnit('10*6/kg', null),
  CommonUnit('10*6/L', 'L-16', 'm-3'),
  CommonUnit('10*6/mL', 'L-10', 'm-3'),
  CommonUnit('10*6/{Specimen}', '1'),
  CommonUnit('10*6/uL', 'L-3', 'm-3'),
  CommonUnit('10*8', '1'),
  CommonUnit('/10*9', '1'),
  CommonUnit('10*9/L', 'L-18', 'm-3'),
  CommonUnit('10*9/mL', 'L-11', 'm-3'),
  CommonUnit('10*9/uL', 'L-4', 'm-3'),
  CommonUnit('10.L/(min.m2)', null),
  CommonUnit('10.L/min', null),
  CommonUnit('10.uN.s/(cm5.m2)', null),
  CommonUnit('/(12.h)', null),
  CommonUnit('24.h', null),
  CommonUnit('%{Abnormal}', '1'),
  CommonUnit('%{abnormal}', null),
  CommonUnit('{absorbance}', null),
  CommonUnit('%{Activity}', '1'),
  CommonUnit('%{activity}', null),
  CommonUnit('{activity}', null),
  CommonUnit('ag/{cell}', null),
  CommonUnit('%{aggregation}', null),
  CommonUnit("{AHF'U}", null),
  CommonUnit('A/m', null),
  CommonUnit('/a', null),
  CommonUnit('{#}/a', null),
  CommonUnit('A', null),
  CommonUnit("[APL'U]/mL", null),
  CommonUnit("[APL'U]", null),
  CommonUnit("{APS'U}", null),
  CommonUnit("/[arb'U]", '[arb]-1'),
  CommonUnit("[arb'U]/mL", null),
  CommonUnit('{ARU}', null),
  CommonUnit('a', 'T', 's'),
  CommonUnit('%{at_60_min}', null),
  CommonUnit('atm', null),
  CommonUnit('[AU]', null),
  CommonUnit('%{bacteria}', null),
  CommonUnit('bar', null),
  CommonUnit('%{BasalActivity}', '1'),
  CommonUnit('%{basal_activity}', null),
  CommonUnit('%{baseline}', null),
  CommonUnit("[bdsk'U]", null),
  CommonUnit('{beats}/min', null),
  CommonUnit("[beth'U]", null),
  CommonUnit('%{Binding}', '1'),
  CommonUnit('{binding_index}', null),
  CommonUnit('%{binding}', null),
  CommonUnit('%{Blockade}', '1'),
  CommonUnit('%{blockade}', null),
  CommonUnit('%{blocked}', null),
  CommonUnit('%{Bound}', '1'),
  CommonUnit('%{bound}', null),
  CommonUnit('Bq', null),
  CommonUnit('%{breakdown}', null),
  CommonUnit('{breaths}/min', null),
  CommonUnit("{CAE'U}", null),
  CommonUnit('{CAG_repeats}', null),
  CommonUnit('cal', null),
  CommonUnit('%{Carboxyhemoglobin}', '1'),
  CommonUnit('{cells}/[HPF]', null),
  CommonUnit('%{cells}', null),
  CommonUnit('{cells}', null),
  CommonUnit('{Cells}/uL', 'L-3', 'm-3'),
  CommonUnit('{cells}/uL', null),
//         CommonUnit("Cel", "q", "K"),
  CommonUnit('[CFU]/L', null),
  CommonUnit('{cfu}/mL', 'L-12', 'm-3'),
  CommonUnit('[CFU]/mL', null),
  CommonUnit('[CFU]', null),
  CommonUnit('cg', 'M', 'g'),
  CommonUnit("{CH100'U}", null),
  CommonUnit('[Ch]', 'L', 'm'),
  CommonUnit('[cin_i]', 'L3', 'm3'),
  CommonUnit('cL', 'L3', 'm3'),
  CommonUnit('{clock_time}', null),
  CommonUnit('cm2', 'L2', 'm2'),
  CommonUnit('cm2/s', null),
  CommonUnit('cm3', null),
  CommonUnit('cm[H2O]/L/s', null),
  CommonUnit('/cm[H2O]', null),
  CommonUnit('cm[H2O]', null),
  CommonUnit('cm[H2O]/s/m', null),
  CommonUnit('cm[Hg]', null),
  CommonUnit('cm', 'L', 'm'),
  CommonUnit('cm/s', null),
  CommonUnit('{Copies}/mL', 'L-7', 'm-3'),
  CommonUnit('{copies}/mL', null),
  CommonUnit('{copies}', null),
  CommonUnit('{copies}/ug', null),
  CommonUnit('{count}', null),
  CommonUnit('{CPM}/10*3{cell}', null),
  CommonUnit('{CPM}', null),
  CommonUnit('cP', null),
  CommonUnit('cSt', null),
  CommonUnit('{Ct_value}', null),
  CommonUnit('[cup_us]', 'L3', 'm3'),
  CommonUnit('d/(7.d)', null),
  CommonUnit('daL/min/m2', null),
  CommonUnit('daL/min', null),
  CommonUnit('dB', null),
  CommonUnit('%{deficient}', null),
  CommonUnit('deg', '1', 'rad'),
//         CommonUnit("[degF]", "q", "K"),
  CommonUnit('deg/s', null),
  CommonUnit('{delta_OD}', null),
  CommonUnit('dg', 'M', 'g'),
  CommonUnit('{dilution}', null),
  CommonUnit('[diop]', null),
  CommonUnit('/dL', 'L-13', 'm-3'),
  CommonUnit('dL', 'L3', 'm3'),
  CommonUnit('dm2/s2', null),
  CommonUnit('dm', 'L', 'm'),
  CommonUnit('/d', null),
  CommonUnit('{#}/d', null),
  CommonUnit('%{dose}', null),
  CommonUnit('[dr_av]', 'M', 'g'),
  CommonUnit('[drp]', null),
  CommonUnit('d', 'T', 's'),
  CommonUnit('d/wk', null),
  CommonUnit('dyn.s/(cm.m2)', null),
  CommonUnit('dyn.s/cm', null),
  CommonUnit('{Ehrlich_U}/100.g', 'M-1[arb]'),
  CommonUnit("{Ehrlich'U}/100.g", null),
  CommonUnit("{Ehrlich'U}/(2.h)", null),
  CommonUnit('{Ehrlich_U}/dL', 'L-3[arb]', 'm-3'),
  CommonUnit("{Ehrlich'U}/dL", null),
  CommonUnit("{Ehrlich'U}/d", null),
  CommonUnit("{Ehrlich'U}", null),
  CommonUnit('{EIA_index}', null),
  CommonUnit('{EIA_titer}', null),
  CommonUnit("{EIA'U}", null),
  CommonUnit("{EIA'U}/U", null),
  CommonUnit('{Elisa_U}/mL', 'L-3[arb]', 'm-3'),
  CommonUnit("{ELISA'U}", null),
  CommonUnit('/{Entity}', '1'),
  CommonUnit('/{entity}', null),
  CommonUnit('%{EosSeen}', '1'),
  CommonUnit('eq{AHG}/mL', 'L-3N', 'm-3'),
  CommonUnit('eq{BoneCollagen}/mmol{Cre}', '1'),
  CommonUnit('eq{BoneCollagen}/umol{Cre}', '1'),
  CommonUnit('eq/L', 'L-3N', 'm-3'),
  CommonUnit('eq/mL', 'L-3N', 'm-3'),
  CommonUnit('eq/mmol', '1'),
  CommonUnit('eq', 'N'),
  CommonUnit('eq/umol', '1'),
  CommonUnit('erg', null),
  CommonUnit('eV', null),
  CommonUnit('{EV}', null),
  CommonUnit('%{Excretion}', '1'),
  CommonUnit('%{excretion}', null),
  CommonUnit('[fdr_us]', 'L3', 'm3'),
  CommonUnit('%{FetalErythrocytes}', '1'),
  CommonUnit('fg', 'M', 'g'),
  CommonUnit('{FIU}', null),
  CommonUnit('fL', 'L3', 'm3'),
  CommonUnit('fm', 'L', 'm'),
  CommonUnit('fmol/g', 'M-1N', 'g-1'),
  CommonUnit('fmol/L', null),
  CommonUnit('fmol/mg{cyt_prot}', null),
  CommonUnit('fmol/mg', 'M-1N'),
  CommonUnit('fmol/mg{prot}', null),
  CommonUnit('fmol/mL', 'L-3N', 'm-3'),
  CommonUnit('fmol', 'N'),
  CommonUnit('F', null),
  CommonUnit('[foz_us]', 'L3', 'm3'),
  CommonUnit('{fraction}', null),
  CommonUnit('[fth_i]', 'L', 'm'),
  CommonUnit('[ft_i]', 'L', 'm'),
  CommonUnit('[ft_us]/[ft_us]', null),
  CommonUnit('g/(100.g)', null),
  CommonUnit('g/(12.h)', null),
  CommonUnit('g/(24.h)', null),
  CommonUnit('g/(3.d)', null),
  CommonUnit('g/(48.h)', null),
  CommonUnit('g/(4.h)', null),
  CommonUnit('g/(5.h)', null),
  CommonUnit('g/(6.h)', null),
  CommonUnit('g/(72.h)', null),
  CommonUnit('g/(8.h){shift}', null),
  CommonUnit('{GAA_repeats}', null),
  CommonUnit('[gal_us]', 'L3', 'm3'),
  CommonUnit('g/cm2', null),
  CommonUnit('g/cm3', null),
  CommonUnit('/g{creat}', 'M-1', 'g-1'),
  CommonUnit('g{creat}', null),
  CommonUnit('g/dL', 'L-3M', 'g.m-3'),
  CommonUnit('g/d', null),
  CommonUnit('{genomes}/mL', null),
  CommonUnit('g/g', '1'),
  CommonUnit('g/g{Cre}', '1'),
  CommonUnit('g/g{creat}', null),
  CommonUnit('g/g{globulin}', null),
  CommonUnit('g/g{tissue}', null),
  CommonUnit('/g{Hb}', null),
  CommonUnit('g{Hb}', null),
  CommonUnit('/g{HGB}', 'M-1', 'g-1'),
  CommonUnit('g/h/m2', null),
  CommonUnit('g/h', null),
  CommonUnit('g/kg', '1'),
  CommonUnit('g/kg/(8.h)', null),
  CommonUnit('g/kg/(8.h){shift}', null),
  CommonUnit('g/kg/d', null),
  CommonUnit('g/kg/h', null),
  CommonUnit('g/kg/min', null),
  CommonUnit('g/L', 'L-3M', 'g.m-3'),
  CommonUnit('{Globules}/[HPF]', null),
  CommonUnit('/g', 'M-1', 'g-1'),
  CommonUnit('g/m2', 'L-2M', 'g.m-2'),
  CommonUnit('g.m/{beat}', null),
  CommonUnit('g', 'M', 'g'),
  CommonUnit('g/mg', null),
  CommonUnit('g.m/{hb}', 'LM', 'g.m'),
  CommonUnit('g.m/({hb}.m2)', 'L-1M'),
  CommonUnit('g/min', null),
  CommonUnit('g/mL', 'L-3M', 'g.m-3'),
  CommonUnit('g.m', 'LM', 'g.m'),
  CommonUnit('g/mmol', null),
  CommonUnit('g/mol{creat}', null),
  CommonUnit('{#}/g', null),
  CommonUnit("[GPL'U]/mL", null),
  CommonUnit("[GPL'U]", null),
  CommonUnit("{GPS'U}", null),
  CommonUnit('[gr]', 'M', 'g'),
  CommonUnit('g/{specimen}', null),
  CommonUnit('g{total_nit}', null),
  CommonUnit('g/{total_output}', null),
  CommonUnit('g{total_prot}', null),
  CommonUnit('g/{TotalWeight}', 'M', 'g'),
  CommonUnit('g/{total_weight}', null),
  CommonUnit('/g{tot`nit}', 'M-1', 'g-1'),
  CommonUnit('/g{tot_nit}', null),
  CommonUnit('/g{tot`prot}', 'M-1', 'g-1'),
  CommonUnit('/g{tot_prot}', null),
  CommonUnit('/g{wet`tis}', 'M-1', 'g-1'),
  CommonUnit('/g{wet_tis}', null),
  CommonUnit('g{wet_tissue}', null),
  CommonUnit('Gy', null),
  CommonUnit('{HA_titer}', null),
  CommonUnit('%{Hb}', null),
  CommonUnit('h/d', null),
  CommonUnit('%{Hemoglobin}', '1'),
  CommonUnit('%{HemoglobinA1C}', '1'),
  CommonUnit('%{HemoglobinSaturation}', '1'),
  CommonUnit('%{Hemolysis}', '1'),
  CommonUnit('%{hemolysis}', null),
  CommonUnit('hL', 'L3', 'm3'),
  CommonUnit('/h', null),
  CommonUnit('H', null),
  CommonUnit('/[HPF]', null),
  CommonUnit('[HPF]', null),
  CommonUnit('{#}/[HPF]', null),
  CommonUnit('h', 'T', 's'),
  CommonUnit('h/wk', null),
  CommonUnit('Hz', null),
  CommonUnit('{IFA_index}', null),
  CommonUnit('{IFA_titer}', null),
  CommonUnit("{ImmuneComplex'U}", null),
  CommonUnit('%{index}', null),
  CommonUnit('{index}', null),
  CommonUnit('{index_val}', null),
  CommonUnit('%{Inhibition}', '1'),
  CommonUnit('%{inhibition}', null),
  CommonUnit("[in_i'H2O]", null),
  CommonUnit('[in_i]', 'L', 'm'),
  CommonUnit('{INR}', null),
  CommonUnit('[in_us]', null),
  CommonUnit('{ISR}', null),
  CommonUnit('[IU]/10*9{RBCs}', null),
  CommonUnit('[IU]/(24.h)', null),
  CommonUnit('[IU]/(2.h)', null),
  CommonUnit('[iU]', '[arb]'),
  CommonUnit('[iU]/dL', 'L-3[arb]', 'm-3'),
  CommonUnit('[IU]/dL', null),
  CommonUnit('[IU]/d', null),
  CommonUnit('[IU]/g{Hb}', null),
  CommonUnit('[iU]/g{Hgb}', 'M-1[arb]'),
  CommonUnit('[iU]/g', 'M-1[arb]'),
  CommonUnit('[IU]/g', null),
  CommonUnit('[IU]/h', null),
  CommonUnit('[IU]/kg/d', null),
  CommonUnit('[iU]/kg', 'M-1[arb]'),
  CommonUnit('[IU]/kg', null),
  CommonUnit('[IU]/L{37Cel}', null),
  CommonUnit('[iU]/L', 'L-3[arb]', 'm-3'),
  CommonUnit('[IU]/mg{creat}', null),
  CommonUnit('[IU]/min', null),
  CommonUnit('[iU]/mL', 'L-3[arb]', 'm-3'),
  CommonUnit('[IU]/mL', null),
  CommonUnit('/[IU]', null),
  CommonUnit('[IU]', null),
  CommonUnit("{JDF'U}/L", null),
  CommonUnit("{JDF'U}", null),
  CommonUnit('J/L', null),
  CommonUnit('J', null),
  CommonUnit('kat/kg', 'M-1T-1N'),
  CommonUnit('kat/L', null),
  CommonUnit('kat', null),
  CommonUnit("[ka'U]", null),
  CommonUnit('kcal/(24.h)', null),
  CommonUnit('kcal/d', null),
  CommonUnit('kcal/h', null),
  CommonUnit('kcal/kg/(24.h)', null),
  CommonUnit('kcal', null),
  CommonUnit('kcal/[oz_av]', 'L2T-2'),
  CommonUnit("{KCT'U}", null),
  CommonUnit('/kg{body`wt}', 'M-1', 'g-1'),
  CommonUnit('/kg{body_wt}', null),
  CommonUnit('kg/h', null),
  CommonUnit('kg/L', 'L-3M', 'g.m-3'),
  CommonUnit('/kg', 'M-1', 'g-1'),
  CommonUnit('kg/m2', 'L-2M', 'g.m-2'),
  CommonUnit('kg/m3', 'L-3M', 'g.m-3'),
  CommonUnit('kg', 'M', 'g'),
  CommonUnit('kg/min', null),
  CommonUnit('kg/mol', 'MN-1', 'g'),
  CommonUnit('kg.m/s', null),
  CommonUnit('kg/(s.m2)', null),
  CommonUnit('kg/s', null),
  CommonUnit('k[IU]/L', null),
  CommonUnit('k[iU]/mL', 'L-3[arb]', 'm-3'),
  CommonUnit('k[IU]/mL', null),
  CommonUnit('kL', 'L3', 'm3'),
  CommonUnit('km', 'L', 'm'),
  CommonUnit("[knk'U]", null),
  CommonUnit('kPa', 'L-1MT-2'),
  CommonUnit('K', 'q', 'K'),
  CommonUnit("{KRONU'U}/mL", null),
  CommonUnit('ks', 'T', 's'),
  CommonUnit('kU/g', 'M-1T-1N'),
  CommonUnit('kU/L{class}', null),
  CommonUnit('kU/L', null),
  CommonUnit('kU/mL', null),
  CommonUnit('kU', null),
  CommonUnit('K/W', 'L-2M-1T3q'),
  CommonUnit('L/(24.h)', null),
  CommonUnit('L/(8.h)', null),
  CommonUnit('[lb_av]', 'M', 'g'),
  CommonUnit('L/d', null),
  CommonUnit('L/h', null),
  CommonUnit('L/kg', 'L3M-1', 'g-1.m3'),
  CommonUnit('/L', 'L-14', 'm-3'),
  CommonUnit('L', 'L3', 'm3'),
  CommonUnit('L/L', null),
  CommonUnit('L/(min.m2)', null),
  CommonUnit('L/min/m2', null),
  CommonUnit('L/min', null),
  CommonUnit('lm.m2', null),
  CommonUnit('lm', null),
  CommonUnit('{#}/L', null),
  CommonUnit('{Log_copies}/mL', null),
  CommonUnit('{Log_IU}/mL', null),
  CommonUnit('{Log_IU}', null),
  CommonUnit('{Log}', null),
  CommonUnit('%{loss_AChR}', null),
  CommonUnit('%{loss}', null),
  CommonUnit('/[LPF]', null),
  CommonUnit('[LPF]', null),
  CommonUnit('{#}/[LPF]', null),
  CommonUnit('L.s2/s', 'L3T', 'm3.s'),
  CommonUnit('L/s', null, 'm3.s-1'),
  CommonUnit('L/s/s2', null),
  CommonUnit('{Lyme_index_value}', null),
  CommonUnit('%{lysis}', null),
  CommonUnit('/m2', 'L-2', 'm-2'),
  CommonUnit('m2', 'L2', 'm2'),
  CommonUnit('m2/s', null, 'm2.s-1'),
  CommonUnit('/m3', null, 'm-3'),
  CommonUnit('m3/s', null, 'm3.s-1'),
  CommonUnit('mA', null),
  CommonUnit('mbar/L/s', null),
  CommonUnit('mbar', null),
  CommonUnit('mbar.s/L', null),
  CommonUnit("[mclg'U]", null),
  CommonUnit('meq/(24.h)', null),
  CommonUnit('meq/(2.h)', null),
  CommonUnit('meq/(8.h)', null),
  CommonUnit('meq/dL', 'L-3N', 'm-3'),
  CommonUnit('meq/d', null),
  CommonUnit('meq/g{creat}', null),
  CommonUnit('meq/g{Cre}', 'M-1N'),
  CommonUnit('meq/g', 'M-1N'),
  CommonUnit('meq/h', null),
  CommonUnit('meq/kg/h', null),
  CommonUnit('meq/kg', 'M-1N'),
  CommonUnit('meq/L', 'L-3N', 'm-3'),
  CommonUnit('meq/m2', 'L-2N', 'm-2'),
  CommonUnit('meq/min', null),
  CommonUnit('meq/mL', 'L-3N', 'm-3'),
  CommonUnit('meq', 'N'),
  CommonUnit('meq/{Specimen}', 'N'),
  CommonUnit('meq/{specimen}', null),
  CommonUnit('meq/{total_volume}', null),
  CommonUnit('[MET].min/wk', null),
  CommonUnit('mg/(10.h)', null),
  CommonUnit('mg/(12.h)', null),
  CommonUnit('mg/(24.h)', null),
  CommonUnit('mg/(2.h)', null),
  CommonUnit('mg/(6.h)', null),
  CommonUnit('mg/(72.h)', null),
  CommonUnit('mg/(8.h)', null),
  CommonUnit('mg/{collection}', null),
  CommonUnit('mg/d/{1.73_m2}', null),
  CommonUnit('mg/dL', 'L-3M', 'g.m-3'),
  CommonUnit('mg/dL{RBCs}', null),
  CommonUnit('mg/d', null),
  CommonUnit('mg{FEU}/L', null),
  CommonUnit('mg/g', '1'),
  CommonUnit('mg/g{Cre}', '1'),
  CommonUnit('mg/g{creat}', null),
  CommonUnit('mg/g{dry_tissue}', null),
  CommonUnit('mg/g{feces}', null),
  CommonUnit('mg/g{tissue}', null),
  CommonUnit('mg/g{wet_tissue}', null),
  CommonUnit('mg/h', null),
  CommonUnit('mg/kg', '1'),
  CommonUnit('mg/kg/(8.h)', null),
  CommonUnit('mg/kg/d', null),
  CommonUnit('mg/kg/h', null),
  CommonUnit('mg/kg/min', null),
  CommonUnit('mg/L', 'L-3M', 'g.m-3'),
  CommonUnit('mg/L{RBCs}', null),
  CommonUnit('/mg', 'M-1', 'g-1'),
  CommonUnit('mg/m2', 'L-2M', 'g.m-2'),
  CommonUnit('mg/m3', 'L-3M', 'g.m-3'),
  CommonUnit('mg', 'M', 'g'),
  CommonUnit('mg/mg', '1'),
  CommonUnit('mg/mg{Cre}', '1'),
  CommonUnit('mg/mg{creat}', null),
  CommonUnit('mg/min', null),
  CommonUnit('mg/mL', 'L-3M', 'g.m-3'),
  CommonUnit('mg/mmol{creat}', null),
  CommonUnit('mg/mmol', null),
  CommonUnit('mg{Phenylketones}/dL', 'L-3M', 'g.m-3'),
  CommonUnit('mg/{specimen}', null),
  CommonUnit('mg/{total_output}', null),
  CommonUnit('mg/{TotalVolume}', 'M', 'g'),
  CommonUnit('mg/{total_volume}', null),
  CommonUnit('mg/{Volume}', 'M', 'g'),
  CommonUnit('mg/wk', null),
  CommonUnit('[mi_i]', 'L', 'm'),
  CommonUnit('min/d', null),
  CommonUnit('{minidrop}/min', null),
  CommonUnit('{minidrop}/s', null),
  CommonUnit('/min', null),
  CommonUnit('{#}/min', null),
  CommonUnit('min', 'T', 's'),
  CommonUnit('min/wk', null),
  CommonUnit('m[iU]/L', 'L-3[arb]', 'm-3'),
  CommonUnit('m[IU]/L', null),
  CommonUnit('m[iU]/mL', 'L-3[arb]', 'm-3'),
  CommonUnit('m[IU]/mL', null),
  CommonUnit('mL/(10.h)', null),
  CommonUnit('mL/(12.h)', null),
  CommonUnit('mL/(24.h)', null),
  CommonUnit('mL/(2.h)', null),
  CommonUnit('mL/(4.h)', null),
  CommonUnit('mL/(5.h)', null),
  CommonUnit('mL/(6.h)', null),
  CommonUnit('mL/(72.h)', null),
  CommonUnit('mL/(8.h)/kg', null),
  CommonUnit('mL/(8.h)', null),
  CommonUnit('mL/{beat}/m2', null),
  CommonUnit('mL/{beat}', null),
  CommonUnit('mL/cm[H2O]', null),
  CommonUnit('mL/dL', '1'),
  CommonUnit('mL/d', null),
  CommonUnit('mL{fetal_RBCs}', null),
  CommonUnit('mL/{h`b}', 'L3', 'm3'),
  CommonUnit('mL/h', null),
  CommonUnit('mL/kg/(8.h)', null),
  CommonUnit('mL/kg/d', null),
  CommonUnit('mL/kg/h', null),
  CommonUnit('mL/kg', 'L3M-1', 'g-1.m3'),
  CommonUnit('mL/kg/min', null),
  CommonUnit('mL', 'L3', 'm3'),
  CommonUnit('/mL', 'L-5', 'm-3'),
  CommonUnit('m', 'L', 'm'),
  CommonUnit('mL/m2', null),
  CommonUnit('mL/mbar', null),
  CommonUnit('mL/min/{1.73_m2}', null),
  CommonUnit('mL/min/m2', null),
  CommonUnit('mL/min', null),
  CommonUnit('mL/mm', null),
  CommonUnit('{#}/mL', null),
  CommonUnit('mL/[sin_i]', null),
  CommonUnit('mL/s', null),
  CommonUnit('mm2', 'L2', 'm2'),
  CommonUnit('{mm/dd/yyyy}', null),
  CommonUnit('mm[H2O]', null),
  CommonUnit('mm[Hg]', 'L-1MT-2'),
  CommonUnit('mm/h', null),
  CommonUnit('mm', 'L', 'm'),
  CommonUnit('mm/min', null),
  CommonUnit('/mm', null),
  CommonUnit('mmol/(12.h)', null),
  CommonUnit('mmol/(24.h)', null),
  CommonUnit('mmol/(2.h)', null),
  CommonUnit('mmol/(5.h)', null),
  CommonUnit('mmol/(6.h)', null),
  CommonUnit('mmol/(8.h)', null),
  CommonUnit('/mmol{creat}', null),
  CommonUnit('mmol/dL', 'L-3N', 'm-3'),
  CommonUnit('mmol/d', null),
  CommonUnit('mmol/{ejaculate}', null),
  CommonUnit('mmol/g{creat}', null),
  CommonUnit('mmol/g', 'M-1N'),
  CommonUnit('mmol/h/mg{Hb}', null),
  CommonUnit('mmol/h/mg{prot}', null),
  CommonUnit('mmol/h', null),
  CommonUnit('mmol/kg/(8.h)', null),
  CommonUnit('mmol/kg/d', null),
  CommonUnit('mmol/kg/h', null),
  CommonUnit('mmol/kg', 'M-1N'),
  CommonUnit('mmol/kg/min', null),
  CommonUnit('mmol/L', 'L-3N', 'm-3'),
  CommonUnit('mmol/L{RBCs}', null),
  CommonUnit('mmol/m2', 'L-2N'),
  CommonUnit('mmol/min', null),
  CommonUnit('mmol/mmol{creat}', null),
  CommonUnit('mmol/mmol', null),
  CommonUnit('mmol/mmol{urea}', null),
  CommonUnit('mmol/mol', '1'),
  CommonUnit('mmol/mol{Cre}', '1'),
  CommonUnit('mmol/mol{creat}', null),
  CommonUnit('mmol', 'N'),
  CommonUnit('mmol/s/L', null),
  CommonUnit('mmol/{specimen}', null),
  CommonUnit('mmol/{total_vol}', null),
  CommonUnit('mmol/{TotalVolume}', 'N'),
  CommonUnit('mol/kg', 'M-1N'),
  CommonUnit('mol/kg/s', null),
  CommonUnit('mol/L', 'L-3N', 'm-3'),
  CommonUnit('mol/m3', 'L-3N', 'm-3'),
  CommonUnit('mol/mL', 'L-3N', 'm-3'),
  CommonUnit('mol/mol', null),
  CommonUnit('mol', 'N'),
  CommonUnit('mol/s', null),
  CommonUnit('{M.o.M}', null),
  CommonUnit('/mo', null),
  CommonUnit('mosm/kg', 'M-1N'),
  CommonUnit('mosm/L', 'L-3N', 'm-3'),
  CommonUnit('mosm', 'N'),
  CommonUnit('mo', 'T', 's'),
  CommonUnit('mPa', null),
  CommonUnit('mPa.s', null),
  CommonUnit("[MPL'U]/mL", null),
  CommonUnit("[MPL'U]", null),
  CommonUnit("{MPS'U}/mL", null),
  CommonUnit("{MPS'U}", null),
  CommonUnit('m/s2', null),
  CommonUnit('m/s', null),
  CommonUnit('ms', 'T', 's'),
  CommonUnit('Ms', 'T', 's'),
  CommonUnit('mU/g{Hb}', null),
  CommonUnit('mU/g{Hgb}', 'M-1T-1N'),
  CommonUnit('mU/g', 'M-1T-1N'),
  CommonUnit('mU/g{prot}', null),
  CommonUnit('mU/L', null),
  CommonUnit('mU/mg{creat}', null),
  CommonUnit('mU/mg{Cre}', 'M-1T-1N'),
  CommonUnit('mU/mg', 'M-1T-1N'),
  CommonUnit('mU/mL/min', null),
  CommonUnit('mU/mL', null),
  CommonUnit('mU/mmol{creat}', null),
  CommonUnit('mU/mmol{RBCs}', null),
  CommonUnit('{mutation}', null),
  CommonUnit('mV', null),
  CommonUnit('mV/s', null),
  CommonUnit('N.cm', null),
  CommonUnit('ng/10*6', null),
  CommonUnit('ng/10*6{RBCs}', null),
  CommonUnit('ng/(24.h)', null),
  CommonUnit('ng/(8.h)', null),
  CommonUnit('ng/dL', 'L-3M', 'g.m-3'),
  CommonUnit('ng/d', null),
  CommonUnit('ng{FEU}/mL', null),
  CommonUnit('ng/g', '1'),
  CommonUnit('ng/g{Cre}', '1'),
  CommonUnit('ng/g{creat}', null),
  CommonUnit('ng/h', null),
  CommonUnit('ng/kg', '1'),
  CommonUnit('ng/kg/(8.h)', null),
  CommonUnit('ng/kg/h', null),
  CommonUnit('ng/kg/min', null),
  CommonUnit('ng/L', 'L-3M', 'g.m-3'),
  CommonUnit('ng/m2', 'L-2M', 'g.m-2'),
  CommonUnit('ng', 'M', 'g'),
  CommonUnit('ng/mg', '1'),
  CommonUnit('ng/mg{creat}', null),
  CommonUnit('ng/mg/h', null),
  CommonUnit('ng/mg{Protein}', '1'),
  CommonUnit('ng/mg{prot}', null),
  CommonUnit('ng/min', null),
  CommonUnit('ng/mL/h', null),
  CommonUnit('ng/mL', 'L-3M', 'g.m-3'),
  CommonUnit('ng/mL{rbc}', 'L-3M', 'g.m-3'),
  CommonUnit('ng/mL{RBCs}', null),
  CommonUnit('ng/s', null),
  CommonUnit('ng/U', null),
  CommonUnit('nkat', null),
  CommonUnit('nL', 'L3', 'm3'),
  CommonUnit('[nmi_i]', 'L', 'm'),
  CommonUnit('nm', 'L', 'm'),
  CommonUnit('nmol/(24.h)', null),
  CommonUnit('nmol{ATP}', null),
  CommonUnit('nmol{BCE}/L', null),
  CommonUnit('nmol{BCE}', null),
  CommonUnit('nmol/dL{GF}', null),
  CommonUnit('nmol/dL', 'L-3N', 'm-3'),
  CommonUnit('nmol/d', null),
  CommonUnit('nmol/g{creat}', null),
  CommonUnit('nmol/g{Cre}', 'M-1N'),
  CommonUnit('nmol/g{dry_wt}', null),
  CommonUnit('nmol/g', 'M-1N'),
  CommonUnit('nmol/h/L', null),
  CommonUnit('nmol/h/mg{prot}', null),
  CommonUnit('nmol/h/mL', null),
  CommonUnit('nmol/L', 'L-3N', 'm-3'),
  CommonUnit('nmol/L/mmol{creat}', null),
  CommonUnit('nmol/L{RBCs}', null),
  CommonUnit('nmol/mg{creat}', null),
  CommonUnit('nmol/mg/h', null),
  CommonUnit('nmol/mg', 'M-1N'),
  CommonUnit('nmol/mg{prot}/h', null),
  CommonUnit('nmol/mg{prot}', null),
  CommonUnit('nmol/min/10*6{cells}', null),
  CommonUnit('nmol/min/mg{Hb}', null),
  CommonUnit('nmol/min/mg{protein}', null),
  CommonUnit('nmol/min/mg{prot}', null),
  CommonUnit('nmol/min/mL', null),
  CommonUnit('nmol/min', null),
  CommonUnit('nmol/mL/h', null),
  CommonUnit('nmol/mL', 'L-3N', 'm-3'),
  CommonUnit('nmol/mL/min', null),
  CommonUnit('nmol/m/mg{prot}', null),
  CommonUnit('nmol/mmol', '1'),
  CommonUnit('nmol/mmol{Cre}', '1'),
  CommonUnit('nmol/mmol{creat}', null),
  CommonUnit('nmol/mol', '1'),
  CommonUnit('nmol/mol{creat}', null),
  CommonUnit('nmol', 'N'),
  CommonUnit('nmol/nmol', null),
  CommonUnit('nmol/s/L', null),
  CommonUnit('nmol/s', null),
  CommonUnit('nmol/umol{creat}', null),
  CommonUnit('nm/s/L', null),
  CommonUnit('N', null),
  CommonUnit('%{Normal}', '1'),
  CommonUnit('%{normal}', null),
  CommonUnit('%{NormalPooledPlasma}', '1'),
  CommonUnit('N.s', null),
  CommonUnit('ns', 'T', 's'),
  CommonUnit('{#}', null),
  CommonUnit('nU/mL', null),
  CommonUnit('nU/{RBC}', null),
  CommonUnit('{OD_unit}', null),
  CommonUnit('%{ofBacteria}', '1'),
  CommonUnit('%{OfLymphocytes}', '1'),
  CommonUnit('%{OfWBCs}', '1'),
  CommonUnit('Ohm.m', null),
  CommonUnit('Ohm', null),
  CommonUnit('/{OIF}', null),
  CommonUnit('osm/kg', 'M-1N'),
  CommonUnit('osm/L', 'L-3N', 'm-3'),
  CommonUnit('osm', null),
  CommonUnit('%{Oxygen}', '1'),
  CommonUnit('[oz_av]', 'M', 'g'),
  CommonUnit('[oz_tr]', 'M', 'g'),
  CommonUnit("{Pan_Bio'U}", null),
  CommonUnit('pA', null),
  CommonUnit('Pa', null),
  CommonUnit('%{penetration}', null),
  CommonUnit('{percentile}', null),
  CommonUnit('pg/{cell}', null),
  CommonUnit('pg/dL', 'L-3M', 'g.m-3'),
  CommonUnit('pg/L', 'L-3M', 'g.m-3'),
  CommonUnit('pg', 'M', 'g'),
  CommonUnit('pg/mg{creat}', null),
  CommonUnit('pg/mg', null),
  CommonUnit('pg/mL', 'L-3M', 'g.m-3'),
  CommonUnit('pg/mL{sLT}', null),
  CommonUnit('pg/mm', 'L-1M'),
  CommonUnit('pg/{RBC}', null),
  CommonUnit('{phenotype}', null),
  CommonUnit('[pH]', '[pH]'),
  CommonUnit('pkat', null),
  CommonUnit('{#}/{platelet}', null),
  CommonUnit('pL', 'L3', 'm3'),
  CommonUnit('pm', 'L', 'm'),
  CommonUnit('pmol/(24.h)', null),
  CommonUnit('pmol/dL', 'L-3N', 'm-3'),
  CommonUnit('pmol/d', null),
  CommonUnit('pmol/g', null),
  CommonUnit('pmol/H/mg{protein}', null),
  CommonUnit('pmol/h/mg{prot}', null),
  CommonUnit('pmol/h/mL', null),
  CommonUnit('pmol/L', 'L-3N', 'm-3'),
  CommonUnit('pmol/mg{prot}', null),
  CommonUnit('pmol/min/mg{prot}', null),
  CommonUnit('pmol/min', null),
  CommonUnit('pmol/mL', 'L-3N', 'm-3'),
  CommonUnit('pmol/mmol{creat}', null),
  CommonUnit('pmol', 'N'),
  CommonUnit('pmol/{RBC}', null),
  CommonUnit('pmol/umol', '1'),
  CommonUnit('pmol/umol{creat}', null),
  CommonUnit('%{pooled_plasma}', null),
  CommonUnit('%{Positive}', '1'),
  CommonUnit('%{positive}', null),
  CommonUnit('[ppb]', null),
  CommonUnit('[ppm]', null),
  CommonUnit('[ppm]{v/v}', null),
  CommonUnit('[ppth]', null),
  CommonUnit('[pptr]', null),
  CommonUnit('[psi]', null),
  CommonUnit('ps', 'T', 's'),
  CommonUnit('pT', null),
  CommonUnit('[pt_us]', 'L3', 'm3'),
  CommonUnit('[qt_us]', 'L3', 'm3'),
  CommonUnit('{ratio}', null),
  CommonUnit('%{RBCs}', null),
  CommonUnit('{rbc}/uL', 'L-3', 'm-3'),
  CommonUnit('{RBC}/uL', null),
  CommonUnit('%{reactive}', null),
  CommonUnit('%{recovery}', null),
  CommonUnit('%{reference}', null),
  CommonUnit('%{Relative}', '1'),
  CommonUnit('%{relative}', null),
  CommonUnit('{rel_saturation}', null),
  CommonUnit('%{residual}', null),
  CommonUnit('%{response}', null),
  CommonUnit('{risk}', null),
  CommonUnit('{Rubella_virus}', null),
  CommonUnit('%{saturation}', null),
  CommonUnit('{saturation}', null),
  CommonUnit('s/{control}', null),
  CommonUnit('{s_co_ratio}', null),
  CommonUnit('{score}', null),
  CommonUnit('[sft_i]', 'L2', 'm2'),
  CommonUnit('{shift}', null),
  CommonUnit('[sin_i]', 'L2', 'm2'),
  CommonUnit('/s', null),
  CommonUnit('S', null),
  CommonUnit('{Spermatozoa}/mL', 'L-6', 'm-3'),
  CommonUnit('{spermatozoa}/mL', null),
  CommonUnit('%{SpermMotility}', '1'),
  CommonUnit('s', 'T', 's'),
  CommonUnit('{STDV}', null),
  CommonUnit('[ston_av]', 'M', 'g'),
  CommonUnit('Sv', null),
  CommonUnit('[syd_i]', 'L2', 'm2'),
  CommonUnit('[tbs_us]', null),
  CommonUnit("[tb'U]", null),
  CommonUnit('{titer}', null),
  CommonUnit('t', 'M', 'g'),
  CommonUnit('{TmStp}', null),
  CommonUnit('T', null),
  CommonUnit("[todd'U]", null),
  CommonUnit('/{tot}', '1'),
  CommonUnit('%{Total}', '1'),
  CommonUnit('%{total}', null),
  CommonUnit('%{TotalProtein}', '1'),
  CommonUnit('{Tscore}', null),
  CommonUnit('{TSI_index}', null),
  CommonUnit('[tsp_us]', null),
  CommonUnit('U/10*10{cells}', null),
  CommonUnit('U/10*10', null),
  CommonUnit('U/10*12', null),
  CommonUnit('U/10*12{RBCs}', null),
  CommonUnit('U/10*6', null),
  CommonUnit('U/10*9', null),
  CommonUnit('U/(10.g){feces}', null),
  CommonUnit('U/10', null),
  CommonUnit('U/(12.h)', null),
  CommonUnit('U/(24.h)', null),
  CommonUnit('U{25Cel}/L', null),
  CommonUnit('U/(2.h)', null),
  CommonUnit('U{37Cel}/L', null),
  CommonUnit('U{ComplementCh50}/mL', 'L-3[arb]', 'm-3.s-1'),
  CommonUnit('U/dL', null),
  CommonUnit('U/d', null),
  CommonUnit('ueq/L', 'L-3N', 'm-3'),
  CommonUnit('ueq/mL', 'L-3N', 'm-3'),
  CommonUnit('ueq', 'N'),
  CommonUnit('ug/(100.g)', null),
  CommonUnit('ug/(24.h)', null),
  CommonUnit('ug/(8.h)', null),
  CommonUnit('U/g{creat}', null),
  CommonUnit('U/g{Cre}', 'M-1T-1N'),
  CommonUnit('ug/dL', 'L-3M', 'g.m-3'),
  CommonUnit('ug/dL{rbc}', 'L-3M', 'g.m-3'),
  CommonUnit('ug/dL{RBCs}', null),
  CommonUnit('ug/d', null),
  CommonUnit('ug{FEU}/mL', null),
  CommonUnit('ug/g', '1'),
  CommonUnit('ug/g{Cre}', '1'),
  CommonUnit('ug/g{creat}', null),
  CommonUnit('ug/g{dry_tissue}', null),
  CommonUnit('ug/g{DryWeight}', '1'),
  CommonUnit('ug/g{dry_wt}', null),
  CommonUnit('ug/g{feces}', null),
  CommonUnit('ug/g{hair}', null),
  CommonUnit('ug/g{Hb}', null),
  CommonUnit('ug/g{Hgb}', '1'),
  CommonUnit('ug/g{tissue}', null),
  CommonUnit('U/g{Hb}', null),
  CommonUnit('U/g{Hgb}', 'M-1T-1N'),
  CommonUnit('ug/h', null),
  CommonUnit('ug/kg', '1'),
  CommonUnit('ug/kg/(8.h)', null),
  CommonUnit('ug/kg/d', null),
  CommonUnit('ug/kg/h', null),
  CommonUnit('ug/kg/min', null),
  CommonUnit('ug/L/(24.h)', null),
  CommonUnit('ug/L', 'L-3M', 'g.m-3'),
  CommonUnit('ug/L{RBCs}', null),
  CommonUnit('U/g', 'M-1T-1N'),
  CommonUnit('ug/m2', 'L-2M', 'g.m-2'),
  CommonUnit('ug/m3', null),
  CommonUnit('ug', 'M', 'g'),
  CommonUnit('ug/mg', '1'),
  CommonUnit('ug/mg{Cre}', '1'),
  CommonUnit('ug/mg{creat}', null),
  CommonUnit('ug/min', null),
  CommonUnit('ug/mL{class}', null),
  CommonUnit('ug/mL{eqv}', null),
  CommonUnit('ug/mL', 'L-3M', 'g.m-3'),
  CommonUnit('ug/mmol{creat}', null),
  CommonUnit('ug/mmol', null),
  CommonUnit('ug/ng', '1'),
  CommonUnit('U/g{protein}', null),
  CommonUnit('ug/[sft_i]', null),
  CommonUnit('ug/{Specimen}', 'M', 'g'),
  CommonUnit('ug/{specimen}', null),
  CommonUnit('ug/{TotalVolume}', 'M', 'g'),
  CommonUnit('U/h', null),
  CommonUnit('U{IgAPhospholipid}/mL', 'L-3[arb]', 'm-3.s-1'),
  CommonUnit('U{IgGPhospholipid}/mL', 'L-3[arb]', 'm-3.s-1'),
  CommonUnit('U{IgMPhospholipid}/mL', 'L-3[arb]', 'm-3.s-1'),
  CommonUnit('u[iU]', '[arb]'),
  CommonUnit('u[IU]/L', null),
  CommonUnit('u[iU]/mL', 'L-3[arb]', 'm-3'),
  CommonUnit('u[IU]/mL', null),
  CommonUnit('ukat', null),
  CommonUnit('U/kg{Hb}', null),
  CommonUnit('uL/(2.h)', null),
  CommonUnit('uL/h', null),
  CommonUnit('U/L', 'L-3[arb]', 'm-3.s-1'),
  CommonUnit('/uL', 'L-3', 'm-3'),
  CommonUnit('uL', 'L3', 'm3'),
  CommonUnit('{#}/uL', null),
  CommonUnit('U/min', null),
  CommonUnit('um', 'L', 'm'),
  CommonUnit('U/mL', null),
  CommonUnit('U/mL{RBCs}', null),
  CommonUnit('U/mmol{creat}', null),
  CommonUnit('umol/10*6{RBC}', null),
  CommonUnit('umol/(24.h)', null),
  CommonUnit('umol/(2.h)', null),
  CommonUnit('umol/(8.h)', null),
  CommonUnit('umol{BCE}/mol', null),
  CommonUnit('umol/dL{GF}', null),
  CommonUnit('umol/dL', 'L-3N', 'm-3'),
  CommonUnit('umol/d', null),
  CommonUnit('umol/g{creat}', null),
  CommonUnit('umol/g{Cre}', 'M-1N'),
  CommonUnit('umol/g{Hb}', null),
  CommonUnit('umol/g{Hgb}', 'M-1N'),
  CommonUnit('umol/g', 'M-1N'),
  CommonUnit('umol/h', null),
  CommonUnit('umol/kg{feces}', null),
  CommonUnit('umol/kg', null),
  CommonUnit('umol/L/h', null),
  CommonUnit('umol/L', 'L-3N', 'm-3'),
  CommonUnit('umol/L{RBCs}', null),
  CommonUnit('umol/mg{creat}', null),
  CommonUnit('umol/mg{Cre}', 'M-1N'),
  CommonUnit('umol/mg', 'M-1N'),
  CommonUnit('umol/min/g', 'M-1T-1N'),
  CommonUnit('umol/min/g{mucosa}', null),
  CommonUnit('umol/min/g{prot}', null),
  CommonUnit('umol/min/L', null),
  CommonUnit('umol/min', null),
  CommonUnit('umol/mL', 'L-3N', 'm-3'),
  CommonUnit('umol/mL/min', null),
  CommonUnit('umol/mmol{creat}', null),
  CommonUnit('umol/mmol', null),
  CommonUnit('umol/mol', '1'),
  CommonUnit('umol/mol{Cre}', '1'),
  CommonUnit('umol/mol{creat}', null),
  CommonUnit('umol/mol{Hb}', null),
  CommonUnit('umol', 'N'),
  CommonUnit('umol/umol{creat}', null),
  CommonUnit('umol/umol', null),
  CommonUnit('um/s', null),
  CommonUnit('/U', null),
  CommonUnit('U', null),
  CommonUnit('uOhm', null),
  CommonUnit('%{Uptake}', '1'),
  CommonUnit('%{uptake}', null),
  CommonUnit('U/s', null),
  CommonUnit('us', 'T', 's'),
  CommonUnit('uU/g', null),
  CommonUnit('uU/L', null),
  CommonUnit('uU/mL', null),
  CommonUnit('uV', null),
  CommonUnit('%{viable}', null),
  CommonUnit('V', null),
  CommonUnit('%{vol}', '1'),
  CommonUnit('%{WBCs}', null),
  CommonUnit('{WBCs}', null),
  CommonUnit('Wb', null),
  CommonUnit('/wk', null),
  CommonUnit('{#}/wk', null),
  CommonUnit('wk', 'T', 's'),
  CommonUnit('[yd_i]', 'L', 'm'),
  CommonUnit('{yyyy}', null),
  CommonUnit('{Zscore}', null),
];
