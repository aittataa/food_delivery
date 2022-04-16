import 'package:flutter/cupertino.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../config/constants/app_constant.dart';
import '../config/themes/app_theme.dart';

class FloatingButton extends StatelessWidget {
  final bool visible;
  final IconData icon;
  final Function() onPress;

  const FloatingButton({
    Key? key,
    this.visible = true,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      onPress: onPress,
      visible: visible,
      backgroundColor: AppTheme.transparentColor,
      activeForegroundColor: AppTheme.transparentColor,
      activeBackgroundColor: AppTheme.transparentColor,
      foregroundColor: AppTheme.transparentColor,
      overlayColor: AppTheme.transparentColor,
      gradient: AppConstant.mainGradient,
      elevation: 1,
      overlayOpacity: 0,
      curve: AppConstant.curve,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppConstant.mainGradient,
        ),
        child: Icon(
          icon,
          color: AppTheme.primaryIconColor,
        ),
      ),
      // child: Icon(
      //   CupertinoIcons.plus_app,
      //   color: AppTheme.primaryIconColor,
      // ),
    );
  }
}
