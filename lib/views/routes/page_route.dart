part of 'routes.dart';

class RoutePages {
  static final pages = [
    GetPage(name: RouteName.tabBar, page: () => TabBar()),
    GetPage(name: RouteName.login, page: () => LoginPage()),
  ];
}

class RouteName {
  static const tabBar = '/tabBar';
  static const login = '/login';
}
