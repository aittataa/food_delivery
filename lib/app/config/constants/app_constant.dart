import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../ignores/app_ignore.dart";
import "../themes/app_theme.dart";

class AppConstant {
  AppConstant._();

  /// TODO : Curves
  static const Curve curve = Curves.linearToEaseOut;

  /// TODO : Screen Size
  static double screenWidth = Get.width;
  static double screenHeight = Get.height;

  /// TODO : Durations
  static const Duration duration = Duration(milliseconds: 1500);
  static const Duration durationAnimation = Duration(milliseconds: 750);
  static const Duration durationCheck = Duration(milliseconds: 1000);
  static const Duration durationSplash = Duration(milliseconds: 1500);

  /// TODO : Decoration
  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: const BorderSide(width: 2.5, color: AppTheme.borderColor),
  );

  static BoxDecoration decorationBox = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: mainGradient,
  );

  static LinearGradient mainGradient = const LinearGradient(
    colors: [AppTheme.mainColor, AppTheme.mainColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static BoxShadow boxShadow = BoxShadow(
    color: AppTheme.shadowColor.withOpacity(.25),
    blurRadius: 10,
    spreadRadius: .1,
  );

  static FirebaseOptions options = const FirebaseOptions(
    apiKey: AppIgnore.apiKey,
    appId: AppIgnore.appId,
    messagingSenderId: AppIgnore.messagingSenderId,
    projectId: AppIgnore.projectId,
  );
}
