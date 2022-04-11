import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_land/app/config/functions/app_function.dart';
import 'package:movies_land/app/config/messages/app_message.dart';
import 'package:movies_land/app/modules/initial/views/initial_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies;
  runApp(MoviesLand());
}

class MoviesLand extends StatelessWidget {
  const MoviesLand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppMessage.appTitle,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      home: InitialView(),
    );
  }
}
