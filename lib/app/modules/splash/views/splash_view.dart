import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import '../../../config/constants/app_constant.dart';
import '../../../config/themes/app_theme.dart';
import '../../../shared/bounce_point.dart';
import '../../initial/views/initial_view.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: BouncePoint(),
      nextScreen: InitialView(),
      curve: AppConstant.curve,
      backgroundColor: AppTheme.primaryBackColor,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: AppConstant.durationSplash,
      splashIconSize: double.infinity,
    );
  }
}
