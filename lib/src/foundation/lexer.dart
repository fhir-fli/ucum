// ***************************************************************************
// BSD 3-Clause License
// Copyright (c) 2006+, Health Intersections Pty Ltd
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
//
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// * Neither the name of the copyright holder nor the names of its
//   contributors may be used to endorse or promote products derived from
//   this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import 'package:ucum/src/internal.dart';

/// Scans a UCUM unit string one token at a time. Construction primes the first
/// token; [consume] advances to the next. The current token text and kind are
/// exposed via [token] and [type], and [start] records where it began.
class Lexer {
  /// Creates a lexer over [source] and reads the first token.
  Lexer(this.source) {
    consume();
  }

  /// Sentinel for "no character" (empty string), mirroring Ucum-java's
  /// NO_CHAR; distinct from a null end-of-input.
  static const String noChar = '';

  /// The unit string being scanned.
  late String source;

  /// Current read position within [source].
  int index = 0;

  /// Text of the current token, or null when at end of input.
  String? token;

  /// Kind of the current token.
  TokenType? type;

  /// Index in [source] where the current token started.
  late int start;

  /// Advances to the next token, classifying it and updating [token], [type]
  /// and [start]; throws [UcumException] on an unexpected character.
  void consume() {
    token = null;
    type = TokenType.none;
    start = index;
    if (index < source.length) {
      final ch = nextChar();
      if (ch != null &&
          (!(checkSingle(ch, '/', TokenType.solidus) ||
              checkSingle(ch, '.', TokenType.period) ||
              checkSingle(ch, '(', TokenType.open) ||
              checkSingle(ch, ')', TokenType.close) ||
              checkAnnotation(ch) ||
              checkNumber(ch) ||
              checkNumberOrSymbol(ch)))) {
        throw UcumException(
            "Error processing unit '$source': unexpected character '$ch' "
            'at position $start',);
      }
    }
  }

  /// Scans a run of valid symbol characters starting at [ch], accumulating the
  /// text into [token] and classifying it as [TokenType.symbol] if it contains
  /// any non-digit, otherwise [TokenType.number]. Returns false when [ch] does
  /// not start such a token.
  bool checkNumberOrSymbol(String? ch) {
    var c = ch;
    var isSymbol = false;
    var inBrackets = false;
    if (isValidSymbolChar(c, true, false)) {
      token = c;
      isSymbol =
          isSymbol || !(c!.compareTo('0') >= 0 && c.compareTo('9') <= 0);
      inBrackets = checkBrackets(c, inBrackets);
      c = peekChar();
      inBrackets = checkBrackets(c, inBrackets);
      while (isValidSymbolChar(c, !isSymbol || inBrackets, inBrackets)) {
        token = token! + c!;
        isSymbol = isSymbol ||
            (c != noChar &&
                !(c.compareTo('0') >= 0 && c.compareTo('9') <= 0));
        index++;
        c = peekChar();
        inBrackets = checkBrackets(c, inBrackets);
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

  /// Tracks square-bracket nesting: returns true after an opening `[`, false
  /// after a closing `]`, else the unchanged [inBrackets] state. Throws on a
  /// nested `[` or an unmatched `]`.
  bool checkBrackets(String? ch, bool inBrackets) {
    if (ch == '[') {
      if (inBrackets) {
        throw UcumException(
            "Error processing unit '$source': Nested [ at position $start",);
      } else {
        return true;
      }
    }
    if (ch == ']') {
      if (!inBrackets) {
        throw UcumException(
            "Error processing unit '$source': ] without [ at position $start",);
      } else {
        return false;
      }
    }
    return inBrackets;
  }

  /// Returns whether [ch] may appear in a symbol token: letters, the special
  /// symbol characters (`[ ] % * ^ ' " _`), digits when [allowDigits], and `.`
  /// only when [inBrackets]. Null (end of input) is never valid.
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

  /// Returns the character at the current position and advances past it, or
  /// null at end of input.
  String? nextChar() {
    final res = index < source.length ? source[index] : null;
    index++;
    return res;
  }

  /// Returns the character at the current position without advancing, or null
  /// at end of input.
  String? peekChar() {
    return index < source.length ? source[index] : null;
  }

  /// Scans a signed numeric literal beginning with `+` or `-` followed by at
  /// least one digit into [token] as a [TokenType.number]. Returns false when
  /// [ch] is not a sign; throws if no digit follows the sign.
  bool checkNumber(String? ch) {
    var c = ch;
    if (c == '+' || c == '-') {
      token = c;
      c = peekChar();
      while (
          (c?.compareTo('0') ?? -1) >= 0 && (c?.compareTo('9') ?? 1) <= 0) {
        token = token! + c!;
        index++;
        c = peekChar();
      }
      if (token!.length == 1) {
        throw UcumException(
            "Error processing unit '$source': unexpected character '$c' "
            'at position $start: a + or - must be followed by at least '
            'one digit',);
      }
      type = TokenType.number;
      return true;
    }
    return false;
  }

  /// Scans a brace-delimited annotation beginning at [ch] (`{...}`) into
  /// [token] as a [TokenType.annotation]. Returns false when [ch] is not `{`;
  /// throws on end of input before `}` or on a non-ASCII character.
  bool checkAnnotation(String? ch) {
    var c = ch;
    if (c == '{') {
      final buffer = StringBuffer();
      while (c != '}') {
        c = nextChar();
        // Java's lexer returns a NO_CHAR sentinel at end of input and throws
        // there; our nextChar() returns null, which must terminate the loop
        // the same way or an unmatched '{' spins forever.
        if (c == null) {
          throw UcumException(
              "Error processing unit '$source': unterminated annotation",);
        }
        if (!Utilities.isAsciiChar(c)) {
          throw UcumException(
              "Error processing unit '$source': Annotation contains "
              'non-ascii characters',);
        }
        buffer.write(c);
      }
      token = buffer.toString();
      type = TokenType.annotation;
      return true;
    }
    return false;
  }

  /// Matches a single-character token: when [ch] equals [test], sets [token]
  /// and [type] and returns true, else returns false.
  bool checkSingle(String ch, String test, TokenType type) {
    if (ch == test) {
      token = test;
      this.type = type;
      return true;
    }
    return false;
  }

  /// Parses the current token as an integer, ignoring a leading `+`.
  int getTokenAsInt() {
    return int.parse(token!.substring(token!.startsWith('+') ? 1 : 0));
  }

  /// Returns whether all input has been consumed.
  bool finished() {
    return index >= source.length;
  }

  @override
  String toString() => 'Lexer (source: $source, index: $index, token: $token)';
}
