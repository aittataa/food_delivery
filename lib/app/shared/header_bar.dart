import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../config/constants/app_constant.dart';
import '../config/themes/app_theme.dart';
import 'icon_click.dart';

class HeaderBar extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  const HeaderBar({Key? key, required this.title, this.leading, this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          color: AppTheme.backColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [AppConstant.boxShadow],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: IconClick(icon: IconlyLight.search),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.mainColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          trailing: IconClick(icon: IconlyBold.heart),
        ),
      ),
    );
  }
}
