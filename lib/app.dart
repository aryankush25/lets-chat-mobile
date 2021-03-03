import 'package:flutter/material.dart';
import 'package:lets_chat_mobile/routes/routes.dart';

import './utils/themes/theme.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s Chat',
      theme: Themes.defaultTheme,
      routes: SetupRoutes.rootRoutes,
    );
  }
}
