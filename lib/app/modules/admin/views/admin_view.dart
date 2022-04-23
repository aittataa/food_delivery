import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../config/messages/app_message.dart';
import '../../../config/themes/app_theme.dart';

class AdminView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                tileColor: AppTheme.appBarColor,
                leading: Image.asset(
                  AppMessage.appIconRound,
                ),
                title: Text(
                  AppMessage.appTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.primaryTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                trailing: Image.asset(
                  AppMessage.appLogo,
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: 300,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MouseRegion(
                            onHover: (hover) {},
                            child: ListTile(
                              leading: Icon(IconlyBold.category),
                              title: Text(
                                "Dashboard",
                                style: TextStyle(color: AppTheme.textColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container(color: Colors.red, child: Icon(IconlyBold.message))),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
