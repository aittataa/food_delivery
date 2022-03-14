import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/config/messages/app_message.dart';
import 'app/config/themes/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'app/shared/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Foodie());
}

class Foodie extends StatelessWidget {
  const Foodie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppMessage.appTitle,
      theme: AppTheme.themeData,
      //initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: const Splash(),
    );
  }
}
