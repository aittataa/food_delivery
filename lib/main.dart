import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_land/app/config/themes/app_theme.dart';
import 'package:movies_land/app/modules/initial/views/initial_view.dart';

import 'app/config/functions/app_function.dart';
import 'app/config/messages/app_message.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies;
  await Firebase.initializeApp();
  runApp(MoviesLand());
}

class MoviesLand extends StatelessWidget {
  const MoviesLand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppMessage.appTitle,
      theme: AppTheme.light,
      home: InitialView(),
    );
  }
}
