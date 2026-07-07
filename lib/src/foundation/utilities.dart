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

/// Stateless string-inspection helpers used across the lexer and parser.
abstract class Utilities {
  /// Whether every character in [s] is whitespace (an empty string trivially
  /// satisfies this since it has no non-whitespace runes).
  static bool isWhitespace(String s) {
    return s.runes
        .every((rune) => String.fromCharCode(rune).trim().isEmpty);
  }

  /// Whether [string] is non-empty and parses as a decimal (floating-point)
  /// number.
  static bool isDecimal(String string) {
    if (noString(string)) {
      return false;
    }
    return double.tryParse(string) != null;
  }

  /// Whether [string] parses as a base-10 integer.
  static bool isInteger(String string) {
    return int.tryParse(string) != null;
  }

  /// Whether [string] is non-empty and parses as a hexadecimal integer.
  static bool isHex(String string) {
    if (noString(string)) {
      return false;
    }
    return int.tryParse(string, radix: 16) != null;
  }

  /// Whether [v] is null or the empty string.
  static bool noString(String? v) {
    return v == null || v.isEmpty;
  }

  /// Left-pads [src] with the fill character [c] until it reaches length [len].
  static String padLeft(String src, String c, int len) {
    return src.padLeft(len, c);
  }

  /// Whether [ch] is a single printable ASCII character (code points 32–126).
  static bool isAsciiChar(String ch) {
    if (ch.length != 1) {
      return false;
    } else {
      final codeUnit = ch.codeUnitAt(0);
      return codeUnit >= 32 && codeUnit <= 126;
    }
  }
}
