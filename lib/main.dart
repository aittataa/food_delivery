import 'package:flutter/material.dart';
import 'package:food_delivery/app/config/themes/app_theme.dart';
import 'package:food_delivery/app/shared/splash.dart';
import 'package:get/get.dart';

import 'app/config/messages/app_message.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Foodie());
}

class Foodie extends StatelessWidget {
  const Foodie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppMessage.appTitle,
      theme: AppTheme.themeData,
      // initialRoute: AppPages.INITIAL,
      // getPages: AppPages.routes,
      home: const Splash(),
    );
  }
}
