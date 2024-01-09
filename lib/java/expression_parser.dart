/// BSD 3-Clause License
/// Copyright (c) 2006+, Health Intersections Pty Ltd
/// All rights reserved.
///
/// Redistribution and use in source and binary forms, with or without
/// modification, are permitted provided that the following conditions are met:
///
/// * Redistributions of source code must retain the above copyright notice, this
///   list of conditions and the following disclaimer.
///
/// * Redistributions in binary form must reproduce the above copyright notice,
///   this list of conditions and the following disclaimer in the documentation
///   and/or other materials provided with the distribution.
///
/// * Neither the name of the copyright holder nor the names of its
///   contributors may be used to endorse or promote products derived from
///   this software without specific prior written permission.
///
/// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
/// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
/// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
/// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
/// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
/// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
/// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
/// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
/// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
/// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import 'ucum.dart';

class ExpressionParser {
  UcumModel model;

  ExpressionParser(this.model);

  Term parse(String code) {
    Lexer lexer = Lexer(code);
    Term res = parseTerm(lexer, true);
    if (!lexer.finished()) {
      throw UcumException(
          "Expression was not parsed completely. Syntax Error?");
    }
    return res;
  }

  Term parseTerm(Lexer lexer, bool first) {
    Term res = Term();
    if (first && lexer.type == TokenType.none) {
      res.setComp(Factor(1));
    } else if (lexer.type == TokenType.solidus) {
      res.setOp(Operator.division);
      lexer.consume();
      res.setTerm(parseTerm(lexer, false));
    } else {
      if (lexer.type == TokenType.annotation) {
        // Handle annotation - assuming it's skipped or processed elsewhere
        res.setComp(Factor(1)); // Example handling, might need to be adjusted
        lexer.consume();
      } else {
        res.setComp(parseComp(lexer));
      }

      if (lexer.type != TokenType.none && lexer.type != TokenType.close) {
        if (lexer.type == TokenType.solidus) {
          res.setOp(Operator.division);
          lexer.consume();
        } else if (lexer.type == TokenType.period) {
          res.setOp(Operator.multiplication);
          lexer.consume();
        } else if (lexer.type == TokenType.annotation) {
          res.setOp(Operator.multiplication); // Implicit multiplication
        } else {
          lexer.error("Expected '/' or '.'");
        }
        res.setTerm(parseTerm(lexer, false));
      }
    }
    return res;
  }

  Component parseComp(Lexer lexer) {
    if (lexer.type == TokenType.number) {
      Factor fact = Factor(lexer.getTokenAsInt());
      lexer.consume();
      return fact;
    } else if (lexer.type == TokenType.symbol) {
      return parseSymbol(lexer);
    } else if (lexer.type == TokenType.none) {
      lexer.error(
          "Unexpected end of expression looking for a symbol or a number");
    } else if (lexer.type == TokenType.open) {
      lexer.consume();
      Term res = parseTerm(lexer, true);
      if (lexer.type == TokenType.close) {
        lexer.consume();
      } else {
        lexer.error(
            "Unexpected Token Type '${lexer.type}' looking for a close bracket");
      }
      return res;
    } else {
      lexer.error("Unexpected token looking for a symbol or a number");
    }
    throw UcumException("Parser error"); // This line should never be reached
  }

  Component parseSymbol(Lexer lexer) {
    Symbol symbol = Symbol();
    String sym = lexer.token!;

    // Now, can we pick a prefix that leaves behind a metric unit?
    Prefix? selected;
    UcumUnit? unit;
    for (Prefix prefix in model.prefixes) {
      if (sym.startsWith(prefix.code)) {
        unit = model.getUnit(sym.substring(prefix.code.length));
        if (unit != null && (unit is BaseUnit || (unit.metric ?? false))) {
          selected = prefix;
          break;
        }
      }
    }

    if (selected != null) {
      symbol.setPrefix(selected);
      symbol.unit = unit!;
    } else {
      unit = model.getUnit(sym);
      if (unit != null) {
        symbol.unit = unit;
      } else if (sym != "1") {
        lexer.error("The unit '$sym' is unknown");
      }
    }

    lexer.consume();
    if (lexer.type == TokenType.number) {
      symbol.setExponent(lexer.getTokenAsInt());
      lexer.consume();
    } else {
      symbol.setExponent(1);
    }

    return symbol;
  }
}
