import 'package:flutter/material.dart';

import 'package:cloudflare_mobile/business/views/main_view.dart';
import 'package:cloudflare_mobile/business/views/not_found_view.dart';
import 'package:cloudflare_mobile/business/views/login_view.dart';

import '../../constants/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.loginView:
        return normalNavigation(const LoginView());
      case NavigationConstants.mainView:
        return normalNavigation(const MainView());
      default:
        return normalNavigation(const NotFoundView());
    }
  }

  Route<dynamic> normalNavigation(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }

  Route<dynamic> fullScreenNavigation(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
      fullscreenDialog: true,
    );
  }
}