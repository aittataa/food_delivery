part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const ADMIN = _Paths.ADMIN;
  static const HOME = _Paths.HOME;
  static const SEARCH = _Paths.SEARCH;
  static const CATEGORIES = _Paths.CATEGORIES;
  static const SETTINGS = _Paths.SETTINGS;
  static const DETAILS = _Paths.DETAILS;
}

abstract class _Paths {
  _Paths._();
  static const ADMIN = '/admin';
  static const HOME = '/home';
  static const SEARCH = '/search';
  static const CATEGORIES = '/categories';
  static const SETTINGS = '/settings';
  static const DETAILS = '/details';
}
