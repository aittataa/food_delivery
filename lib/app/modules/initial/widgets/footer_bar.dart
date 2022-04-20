import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movies_land/app/config/messages/app_message.dart';

import '../../../config/themes/app_theme.dart';

class FooterBar extends StatelessWidget {
  final int index;
  final Function(int)? onTap;

  const FooterBar({
    Key? key,
    this.index = 0,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: index,
      elevation: 1,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppTheme.primaryBackColor,
      selectedItemColor: AppTheme.mainColor,
      unselectedItemColor: AppTheme.iconColor,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          label: AppMessage.labelHome,
          icon: Icon(IconlyBroken.home),
          activeIcon: Icon(IconlyBold.home),
        ),
        BottomNavigationBarItem(
          label: AppMessage.labelSearch,
          icon: Icon(IconlyBroken.search),
          activeIcon: Icon(IconlyBold.search),
        ),
        BottomNavigationBarItem(
          label: AppMessage.labelCategories,
          icon: Icon(IconlyBroken.category),
          activeIcon: Icon(IconlyBold.category),
        ),
        BottomNavigationBarItem(
          label: AppMessage.labelSettings,
          icon: Icon(IconlyBroken.setting),
          activeIcon: Icon(IconlyBold.setting),
        ),
      ],
    );
  }
}
