import 'package:flutter/material.dart';

import '../../../config/themes/app_theme.dart';

class ButtonClick extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const ButtonClick({Key? key, required this.label, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppTheme.primaryTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: AppTheme.mainColor,
        shadowColor: AppTheme.mainColor,
        primary: AppTheme.mainColor,
        onSurface: AppTheme.mainColor,
        padding: EdgeInsets.all(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
