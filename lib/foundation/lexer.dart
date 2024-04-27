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

library org.fhir.ucum;

import '../ucum.dart';

class Lexer {
  static const String noChar = '';
  late String source;
  int index = 0;

  String? token;

  TokenType? type;
  late int start;

  Lexer(this.source) {
    consume();
  }

  void consume() {
    token = null;
    type = TokenType.none;
    start = index;
    if (index < source.length) {
      final String? ch = nextChar();
      if (ch != null &&
          (!(checkSingle(ch, '/', TokenType.solidus) ||
              checkSingle(ch, '.', TokenType.period) ||
              checkSingle(ch, '(', TokenType.open) ||
              checkSingle(ch, ')', TokenType.close) ||
              checkAnnotation(ch) ||
              checkNumber(ch) ||
              checkNumberOrSymbol(ch)))) {
        throw UcumException(
            "Error processing unit '$source': unexpected character '$ch' at position $start");
      }
    }
  }

  bool checkNumberOrSymbol(String? ch) {
    bool isSymbol = false;
    bool inBrackets = false;
    if (isValidSymbolChar(ch, true, false)) {
      token = ch;
      isSymbol =
          isSymbol || !(ch!.compareTo('0') >= 0 && ch.compareTo('9') <= 0);
      inBrackets = checkBrackets(ch, inBrackets);
      ch = peekChar();
      inBrackets = checkBrackets(ch, inBrackets);
      while (isValidSymbolChar(ch, !isSymbol || inBrackets, inBrackets)) {
        token = token! + ch!;
        isSymbol = isSymbol ||
            (ch != noChar &&
                !(ch.compareTo('0') >= 0 && ch.compareTo('9') <= 0));
        index++;
        ch = peekChar();
        inBrackets = checkBrackets(ch, inBrackets);
      }
      if (isSymbol) {
        type = TokenType.symbol;
      } else {
        type = TokenType.number;
      }
      return true;
    } else {
      return false;
    }
  }

  bool checkBrackets(String? ch, bool inBrackets) {
    if (ch == '[') {
      if (inBrackets) {
        throw UcumException(
            "Error processing unit '$source': Nested [ at position $start");
      } else {
        return true;
      }
    }
    if (ch == ']') {
      if (!inBrackets) {
        throw UcumException(
            "Error processing unit '$source': ] without [ at position $start");
      } else {
        return false;
      }
    }
    return inBrackets;
  }

  bool isValidSymbolChar(String? ch, bool allowDigits, bool inBrackets) {
    if (ch == null) {
      return false;
    } else {
      return (allowDigits &&
              ch.compareTo('0') >= 0 &&
              ch.compareTo('9') <= 0) ||
          (ch.compareTo('a') >= 0 && ch.compareTo('z') <= 0) ||
          (ch.compareTo('A') >= 0 && ch.compareTo('Z') <= 0) ||
          ch == '[' ||
          ch == ']' ||
          ch == '%' ||
          ch == '*' ||
          ch == '^' ||
          ch == "'" ||
          ch == '"' ||
          ch == '_' ||
          (inBrackets && ch == '.');
    }
  }

  String? nextChar() {
    final String? res = index < source.length ? source[index] : null;
    index++;
    return res;
  }

  String? peekChar() {
    return index < source.length ? source[index] : null;
  }

  bool checkNumber(String? ch) {
    if (ch == '+' || ch == '-') {
      token = ch;
      ch = peekChar();
      while (
          (ch?.compareTo('0') ?? -1) >= 0 && (ch?.compareTo('9') ?? 1) <= 0) {
        token = token! + ch!;
        index++;
        ch = peekChar();
      }
      if (token!.length == 1) {
        throw UcumException(
            "Error processing unit '$source': unexpected character '$ch' at position $start: a + or - must be followed by at least one digit");
      }
      type = TokenType.number;
      return true;
    }
    return false;
  }

  bool checkAnnotation(String? ch) {
    if (ch == '{') {
      final StringBuffer buffer = StringBuffer();
      while (ch != '}') {
        ch = nextChar();
        if (ch != null) {
          if (!Utilities.isAsciiChar(ch)) {
            throw UcumException(
                "Error processing unit '$source': Annotation contains non-ascii characters");
          }
          if (ch == noChar) {
            throw UcumException(
                "Error processing unit '$source': unterminated annotation");
          }
          buffer.write(ch);
        }
      }
      token = buffer.toString();
      type = TokenType.annotation;
      return true;
    }
    return false;
  }

  bool checkSingle(String ch, String test, TokenType type) {
    if (ch == test) {
      token = test;
      this.type = type;
      return true;
    }
    return false;
  }

  int getTokenAsInt() {
    return int.parse(token!.substring(token!.startsWith('+') ? 1 : 0));
  }

  bool finished() {
    return index >= source.length;
  }

  @override
  String toString() => 'Lexer (source: $source, index: $index, token: $token)';
}
