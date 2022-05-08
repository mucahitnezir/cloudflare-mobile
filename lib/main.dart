import 'package:flutter/material.dart';

import './core/constants/navigation_constants.dart';
import './core/constants/enums/locale_keys.dart';
import './core/init/cache/locale_manager.dart';
import './core/init/navigation/navigation_route.dart';
import './core/init/navigation/navigation_service.dart';


import './business/services/cloudflare_service.dart';

void main() async {
  await init();

  runApp(const MyApp());
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize locale config manager
  await LocaleManager.initPreferences();
  // await LocaleManager.instance.clearAll();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check that Cloudflare api token is set
    var apiToken = LocaleManager.instance.getString(LocaleKeys.cfApiToken) ?? '';
    if (apiToken.isNotEmpty) {
      CloudflareService.instance.setToken(apiToken);
    }

    var initialRoute = apiToken.isNotEmpty ? NavigationConstants.mainRoute : NavigationConstants.loginRoute;

    return MaterialApp(
      title: 'Cloudflare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // navigation
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: initialRoute,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
    );
  }
}
