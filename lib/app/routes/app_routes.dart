part of "app_pages.dart";

abstract class Routes {
  Routes._();
  static const String ADMIN = _Paths.ADMIN;
  static const String HOME = _Paths.HOME;
  static const String SEARCH = _Paths.SEARCH;
  static const String CATEGORIES = _Paths.CATEGORIES;
  static const String SETTINGS = _Paths.SETTINGS;
  static const String DETAILS = _Paths.DETAILS;
}

abstract class _Paths {
  _Paths._();
  static const String ADMIN = "/admin";
  static const String HOME = "/home";
  static const String SEARCH = "/search";
  static const String CATEGORIES = "/categories";
  static const String SETTINGS = "/settings";
  static const String DETAILS = "/details";
}
