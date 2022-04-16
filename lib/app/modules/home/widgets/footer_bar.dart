import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(CupertinoIcons.house_alt),
          activeIcon: Icon(CupertinoIcons.house_alt_fill),
        ),
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(Icons.search),
          activeIcon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "Categories",
          icon: Icon(CupertinoIcons.layers_alt),
          activeIcon: Icon(CupertinoIcons.layers_alt_fill),
        ),
        BottomNavigationBarItem(
          label: "Settings",
          icon: Icon(CupertinoIcons.gear),
          activeIcon: Icon(CupertinoIcons.gear_solid),
        ),
      ],
    );
  }
}
