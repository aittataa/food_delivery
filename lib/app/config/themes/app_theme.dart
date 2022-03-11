import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color mainColor = Color(0xff0091fd);
  static const Color backColor = Color(0xfff0f0f0);
  static const Color primaryBackColor = Color(0xFFFFFFFF);
  static const Color backgroundColor_1 = Color(0xff254c71);
  static const Color backgroundColor_2 = Color(0xFF071930);
  static const Color imageColor = Color(0xFFFFFFFF);
  static const Color transparentColor = Color(0x00000000);

  /// Text Colors
  static const Color primaryTextColor = Color(0xFFFFFFFF);
  static const Color secondaryTextColor = Color(0xFF000000);

  static ThemeData get themeData {
    return ThemeData(
      scaffoldBackgroundColor: backColor,
      primaryColor: backColor,
      splashColor: backColor,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppTheme.mainColor,
        titleTextStyle: TextStyle(
          color: AppTheme.secondaryTextColor,
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
      ),
    );
  }
}
