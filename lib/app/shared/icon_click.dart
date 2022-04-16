import 'package:flutter/material.dart';

import '../config/themes/app_theme.dart';

class IconClick extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  const IconClick({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      color: AppTheme.primaryIconColor,
      splashColor: AppTheme.transparentColor,
      highlightColor: AppTheme.transparentColor,
      icon: Icon(icon, color: AppTheme.primaryIconColor),
    );
  }
}
