import "package:flutter/material.dart";

import "../../../config/themes/app_theme.dart";

class IconsButton extends StatelessWidget {
  final IconData icon;
  final double size;
  final Function()? onTap;
  const IconsButton({Key? key, required this.icon, this.size = 50, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        //padding: EdgeInsets.all(10),
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.mainColor,
          border: Border.all(width: 2, color: AppTheme.mainColor),
        ),
        child: Icon(
          icon,
          size: size * .5,
          color: AppTheme.primaryIconColor,
        ),
      ),
    );
  }
}
