import 'package:flutter/material.dart';

import '../config/constants/app_constant.dart';

class FlexibleSpace extends StatelessWidget {
  final Widget? child;
  const FlexibleSpace({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppConstant.mainGradient,
      ),
      child: child,
    );
  }
}
