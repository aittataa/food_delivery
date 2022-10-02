import "package:flutter/material.dart";

import "../../../config/messages/app_message.dart";
import "../../../config/themes/app_theme.dart";

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: const BoxDecoration(color: AppTheme.secondaryBackColor),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.asset(AppMessage.appIconRound),
        trailing: Image.asset(AppMessage.appLogo),
        title: const Text(
          AppMessage.appTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.primaryTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
