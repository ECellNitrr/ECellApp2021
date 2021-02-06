import 'package:flutter/material.dart';

class C {
  C._();

  /// background color gradient
  static final Color backgroundTop = HexColor("#4F3FA0");
  static final Color backgroundBottom = HexColor("#180C58");

  /// theme colors
  static final Color primaryHighlightedColor = HexColor("#EF9BFF");
  static final Color primaryUnHighlightedColor = HexColor("#FFFFFF");
  static final Color secondaryColor = HexColor("#CECECE");

  /// button colors
  static final Color authButtonColor = HexColor("#A955F7");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
