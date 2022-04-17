import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movies_land/app/modules/initial/views/initial_view.dart';
import 'package:movies_land/app/shared/bounce_point.dart';

import '../../../config/constants/app_constant.dart';
import '../../../config/themes/app_theme.dart';

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
