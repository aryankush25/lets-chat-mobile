import 'package:flutter/material.dart';
import 'package:lets_chat_mobile/routes/routes.dart';

import './utils/themes/theme.dart';
import './routes/routes.dart';
import '../utils/helpers/navigator_keys.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s Chat',
      theme: Themes.defaultTheme,
      navigatorKey: NavigatorKeys.getHomeNavigatorKey,
      routes: SetupRoutes.rootRoutes,
      // onGenerateRoute: SetupRoutes.generateMainRoute,
    );
  }
}
