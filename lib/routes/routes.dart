import 'package:flutter/material.dart';

import '../utils/constants/route_names.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/contacts_screen/contacts_screen.dart';
import '../screens/chat_screen/chat_screen.dart';
import '../screens/contact_view_screen/contact_view_screen.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/splash_screen/splash_screen.dart';

/// This file defines routing for this app.
/// Add the route name in utils/contants/route_names.dart and then create route entry below.

class SetupRoutes {
  /// App level routing

  static Map<String, WidgetBuilder> get rootRoutes {
    return {
      Routes.ROOT: (ctx) => SplashScreen(),
      Routes.LOGIN: (ctx) => LoginScreen(),
      Routes.HOME: (ctx) => HomeScreen(),
      Routes.CONTACTS: (ctx) => ContactsScreen(),
      Routes.CHAT: (ctx) => ChatScreen(),
      Routes.CONTACT_VIEW: (ctx) => ContactViewScreen(),
    };
  }
}
