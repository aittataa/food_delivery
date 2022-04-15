import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movies_land/app/config/themes/app_theme.dart';

class AppFunction {
  AppFunction._();

  static String dateShape(DateTime date) => DateFormat('MMM dd, yyyy - HH:mm').format(date);

  static snackBar({required String title, required String message}) {
    return Get.snackbar(
      "",
      "",
      backgroundColor: Colors.red.shade600,
      margin: EdgeInsets.only(top: 25, right: 15, left: 15),
      duration: Duration(milliseconds: 2500),
      titleText: Text(
        title,
        style: TextStyle(
          color: AppTheme.primaryTextColor,
          fontWeight: FontWeight.w900,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          color: AppTheme.primaryTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static get configureDependencies {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: [SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppTheme.transparentColor,
        systemNavigationBarDividerColor: AppTheme.transparentColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: true,
        statusBarColor: AppTheme.transparentColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemStatusBarContrastEnforced: true,
      ),
    );
  }
}
