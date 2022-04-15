import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  /// TODO : Others Colors
  static const Color transparentColor = const Color(0x00000000);
  static const Color shadowColor = const Color(0xFF000000);

  /// TODO : Survey Color
  static const Color greenColor = const Color(0xffA1C158);
  static const Color yellowColor = const Color(0xfff3a112);
  static const Color greyColor = const Color(0xffA1A1A1);

  /// TODO : Main Colors
  static const Color mainColor_1 = const Color(0xffa7208c);
  static const Color mainColor_2 = const Color(0xff371573);
  static const Color mainColor_3 = const Color(0xff671a7e);
  static const Color mainColor_4 = const Color(0xff8c1d85);
  static const Color mainColor_5 = const Color(0xffD1B7D7);
  static const Color mainColor_6 = const Color(0xffEAEAEA);

  /// TODO : Back Colors
  static const Color backColor = const Color(0xFFF0F0F0);
  static const Color primaryBackColor = const Color(0xffffffff);
  static const Color secondaryBackColor = const Color(0xff000000);

  /// TODO : Text Colors
  static const Color textColor = const Color(0xFFA0A0A0);
  static const Color primaryTextColor = const Color(0xffffffff);
  static const Color secondaryTextColor = const Color(0xff000000);

  /// TODO : Icon Colors
  static const Color iconColor = const Color(0xffa0a0a0);
  static const Color primaryIconColor = const Color(0xffffffff);
  static const Color secondaryIconColor = const Color(0xff000000);

  static ThemeData get light {
    return ThemeData(
      scaffoldBackgroundColor: backColor,
      primaryColor: backColor,
      splashColor: transparentColor,
      appBarTheme: AppBarTheme(
        elevation: 1,
        centerTitle: true,
        color: transparentColor,
        titleTextStyle: TextStyle(
          color: primaryTextColor,
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
        iconTheme: IconThemeData(
          color: primaryIconColor,
          opacity: .75,
        ),
        actionsIconTheme: IconThemeData(
          color: primaryIconColor,
          opacity: .75,
        ),
      ),
    );
  }
}
