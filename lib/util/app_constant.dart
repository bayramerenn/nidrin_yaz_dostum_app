import 'package:flutter/material.dart';

class AppConstant {
  //region color
  static final Color textColor = Color(0xFFCDCDCD);
  static final Color colorPrimary = Color(0xFF282828);
  static final Color nidrinColor = Color(0xFFF59B1A);

  static const MaterialColor kPrimarySwatch = MaterialColor(
    0xFF282828,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      500: Color(0xFF282828),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
    },
  );
  //end color
  //region Page
  static final String pageSplash = "/";
  static final String pageChooseSecond = "/choose";
  //end region

//region fonts
  static const double fontSizeCaption = 12;
  static const double fontSizeBody2 = 14;
  static const double fontSizeBody = 16;
  static const double fontSizeTitle = 22;
  static const double fontSizeHeadline = 24;
  static const double fontSizeDisplay = 32;
  static const double fontSizeIdiomCardTitle = 18;
  static const double fontSizeIdiomCardContent = 12;

//endregion

}
