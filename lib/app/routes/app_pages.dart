// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/initial/bindings/initial_binding.dart';
import '../modules/initial/views/initial_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.INITIAL;

  static final routes = [
    GetPage(
      name: _Paths.INITIAL,
      page: () => InitialView(),
      binding: InitialBinding(),
    ),
  ];
}
