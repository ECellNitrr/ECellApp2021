import 'package:flutter/material.dart';

class C {
  C._();

  /// background color gradient
  static final Color backgroundTop = HexColor("#4F3FA0");
  static final Color backgroundBottom = HexColor("#180C58");

  /// animated rings colors (1->4 increasingsize)
  static final Color ring1 = HexColor("#2DFFF9");
  static final Color ring2 = HexColor("#FB28E6");
  static final Color ring3 = HexColor("#F8F010");
  static final Color ring4 = HexColor("#AE82FF");

  /// home screen buttons
  static final Color eSummitButton1 = HexColor("#B67FFE");
  static final Color eSummitButton2 = HexColor("#FB28E6");
  static final Color eventsButton1 = HexColor("#BFF70E");
  static final Color eventsButton2 = HexColor("#3CCD72");
  static final Color sponsorsButton1 = HexColor("#2DEBFF");
  static final Color sponsorsButton2 = HexColor("#02A0F9");
  static final Color bQuizButton1 = HexColor("#EFEA79");
  static final Color bQuizButton2 = HexColor("#FB8329");
  static final Color aboutUsButton1 = HexColor("#AE82FF");
  static final Color aboutUsButton2 = HexColor("#4671FE");

  /// esummit + speakers background color gradient
  static final Color backgroundTop1 = HexColor("#B67EFE");
  static final Color backgroundBottom1 = HexColor("#FB28E6");

  /// theme colors
  static final Color primaryHighlightedColor = HexColor("#EF9BFF");
  static final Color primaryUnHighlightedColor = HexColor("#FFFFFF");
  static final Color secondaryColor = HexColor("#CECECE");

  /// button colors
  static final Color authButtonColor = HexColor("#A955F7");
  static final Color speakerButtonColor = HexColor('#8E31D5');
  static final Color eventsButtonGradientLeft = HexColor("#21d2fe");
  static final Color eventsButtonGradientMid = HexColor("#5e83fd");
  static final Color eventsButtonGradientRight = HexColor("#9f38ff");

  /// FrameCardWidget colors
  static final Color downArrowColor = HexColor("#FD8020");
  static const Color blendSocialIconColorOne = Colors.black12;
  static const Color blendSocialIconColorTwo = Colors.black38;

  //Speaker Card fonts
  static final Color cardFontColor = HexColor("#838383");
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
