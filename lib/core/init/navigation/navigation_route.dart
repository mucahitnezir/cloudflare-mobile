import 'package:flutter/material.dart';

import 'package:cloudflare_mobile/business/models/zone.dart';
import 'package:cloudflare_mobile/business/models/account.dart';

import 'package:cloudflare_mobile/business/views/account/account_main_view.dart';
import 'package:cloudflare_mobile/business/views/main/main_view.dart';
import 'package:cloudflare_mobile/business/views/not_found_view.dart';
import 'package:cloudflare_mobile/business/views/login_view.dart';
import 'package:cloudflare_mobile/business/views/website/website_main_view.dart';

import 'package:cloudflare_mobile/core/constants/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.loginRoute:
        return normalNavigation(const LoginView());
      case NavigationConstants.mainRoute:
        return normalNavigation(const MainView());
      case NavigationConstants.accountRoute:
        var account = settings.arguments as Account;
        return normalNavigation(AccountMainView(account: account));
      case NavigationConstants.websiteRoute:
        var website = settings.arguments as Zone;
        return normalNavigation(WebsiteMainView(zone: website));
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
