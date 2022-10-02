import "package:flutter/material.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

import "../config/constants/app_constant.dart";
import "../config/themes/app_theme.dart";

class BouncePoint extends StatelessWidget {
  final bool? state;
  final double size;
  final Color color;

  const BouncePoint({
    Key? key,
    this.state,
    this.size = 50,
    this.color = AppTheme.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case true:
        return SpinKitSquareCircle(
          size: size,
          color: color,
          duration: AppConstant.durationSplash,
        );
      case false:
        return SpinKitCubeGrid(
          size: size,
          color: color,
          duration: AppConstant.durationSplash,
        );
      default:
        return SpinKitThreeBounce(
          size: size,
          color: color,
          duration: AppConstant.durationSplash,
        );
    }
  }
}
