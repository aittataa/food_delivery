import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/config/functions/app_function.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies();
  runApp(const Foodie());
}

class Foodie extends StatelessWidget {
  const Foodie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
