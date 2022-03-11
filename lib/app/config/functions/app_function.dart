import 'package:flutter/services.dart';

class AppFunction {
  AppFunction._();

  static configureDependencies() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
