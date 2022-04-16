import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../themes/app_theme.dart';

enum QuestionType { regular, single, multiple, date }
enum QuestionDateType { date, time, datetime }

class AppConstant {
  AppConstant._();

  // static Users mainUser;

  ///
  static const double iconSize = 27.5;

  /// TODO : Curves
  static const Curve curve = Curves.linearToEaseOut;

  /// TODO : Transitions
  //static const Transition transitionRoute = Transition.fadeIn;
  /// TODO : Screen Size
  static double screenWidth = Get.width;
  static double screenHeight = Get.height;

  /// TODO : Durations
  static const Duration duration = Duration(milliseconds: 1500);
  static const Duration durationCheck = Duration(milliseconds: 500);
  static const Duration durationSplash = Duration(milliseconds: 1500);

  /// TODO : Decoration
  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(10),
  );

  static BoxDecoration decorationBox = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    gradient: mainGradient,
  );

  static LinearGradient mainGradient = LinearGradient(
    colors: [AppTheme.mainColor, AppTheme.mainColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static BoxShadow boxShadow = BoxShadow(
    color: AppTheme.shadowColor.withOpacity(.1),
    blurRadius: 10,
    spreadRadius: .1,
  );
}
