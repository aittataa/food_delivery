import "package:flutter/material.dart";

import "../../../config/themes/app_theme.dart";

class ButtonClick extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const ButtonClick({Key? key, required this.label, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.mainColor, backgroundColor: AppTheme.mainColor,
        shadowColor: AppTheme.mainColor, disabledForegroundColor: AppTheme.mainColor.withOpacity(0.38),
        padding: const EdgeInsets.all(25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: AppTheme.primaryTextColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
