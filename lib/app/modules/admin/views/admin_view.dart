import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movies_land/app/config/constants/app_constant.dart';
import 'package:movies_land/app/config/functions/app_function.dart';

import '../../../config/messages/app_message.dart';
import '../../../config/themes/app_theme.dart';

class AdminView extends StatefulWidget {
  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.backColor,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                decoration: BoxDecoration(
                  color: AppTheme.appBarColor,
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset(AppMessage.appIconRound),
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
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: AppTheme.appBarColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(flex: 1, child: SizedBox()),
                          DashButton(icon: IconlyBold.category, title: "Dashboard", onTap: () {}),
                          DashButton(icon: IconlyBold.ticket, title: "Movies", onTap: () {}),
                          DashButton(icon: IconlyBold.setting, title: "Settings", onTap: () {}),
                          Expanded(flex: 3, child: SizedBox()),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.all(30),
                        scrollDirection: Axis.vertical,
                        gridDelegate: AppFunction.gridDelegate(
                          crossAxisCount: 4,
                          spacing: 30,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: 10,
                        itemBuilder: (_, i) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [AppConstant.boxShadow],
                            ),
                            child: Center(
                              child: Text("$i"),
                            ),
                          );
                        },
                      ),
                    ),
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

class DashButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  const DashButton({Key? key, required this.icon, required this.title, required this.onTap}) : super(key: key);
  @override
  State<DashButton> createState() => _DashButtonState(icon, title, onTap);
}

class _DashButtonState extends State<DashButton> {
  final IconData icon;
  final String title;
  final Function() onTap;
  _DashButtonState(this.icon, this.title, this.onTap);
  late Color _textColor = AppTheme.textColor;
  late Color _iconColor = AppTheme.iconColor;
  late Color _backColor = AppTheme.transparentColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {});
        _textColor = AppTheme.primaryTextColor;
        _iconColor = AppTheme.primaryIconColor;
        _backColor = AppTheme.hoverColor;
      },
      onExit: (value) {
        setState(() {});
        _textColor = AppTheme.textColor;
        _iconColor = AppTheme.iconColor;
        _backColor = AppTheme.transparentColor;
      },
      child: ListTile(
        onTap: onTap,
        tileColor: _backColor,
        contentPadding: EdgeInsets.all(10),
        leading: Icon(icon, color: _iconColor),
        title: Text(title, style: TextStyle(color: _textColor)),
      ),
    );
  }
}
