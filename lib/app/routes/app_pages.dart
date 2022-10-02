import "package:get/get.dart";

import "../modules/admin/bindings/admin_binding.dart";
import "../modules/admin/views/admin_view.dart";
import "../modules/categories/bindings/categories_binding.dart";
import "../modules/categories/views/categories_view.dart";
import "../modules/details/bindings/details_binding.dart";
import "../modules/details/views/details_view.dart";
import "../modules/home/bindings/home_binding.dart";
import "../modules/home/views/home_view.dart";
import "../modules/search/bindings/search_binding.dart";
import "../modules/search/views/search_view.dart";
import "../modules/settings/bindings/settings_binding.dart";
import "../modules/settings/views/settings_view.dart";

part "app_routes.dart";

class AppPages {
  AppPages._();

  static const String INITIAL = Routes.HOME;

  static final List<GetPage> routes = [
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminView(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(),
      binding: DetailsBinding(),
    ),
  ];
}
