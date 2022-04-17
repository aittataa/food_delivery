import 'package:flutter/material.dart';

import '../config/themes/app_theme.dart';

class IconClick extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function()? onPressed;
  const IconClick({
    Key? key,
    required this.icon,
    this.color = AppTheme.iconColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      color: color,
      splashColor: AppTheme.transparentColor,
      highlightColor: AppTheme.transparentColor,
      icon: Icon(icon, color: color),
    );
  }
}
