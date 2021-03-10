import 'package:flutter/material.dart';

import '../utils/constants/route_names.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/contacts_screen/contacts_screen.dart';
import '../screens/chat_screen/chat_screen.dart';
import '../screens/contact_view_screen/contact_view_screen.dart';
import '../screens/all_chats/all_chats.dart';

/// This file defines routing for this app.
/// Add the route name in utils/contants/route_names.dart and then create route entry below.

class SetupRoutes {
  /// App level routing

  static Map<String, WidgetBuilder> get rootRoutes {
    return {
      Routes.HOME: (ctx) => HomeScreen(),
      Routes.CONTACTS: (ctx) => ContactsScreen(),
    };
  }

  static Route generateChatsRoute(RouteSettings settings) {
    Widget page;

    print('#### settings 2 $settings');

    switch (settings.name) {
      case Routes.ALL_CHATS:
        page = AllChats();
        break;

      case Routes.CHAT:
        page = ChatScreen();
        break;

      case Routes.CONTACT_VIEW:
        page = ContactViewScreen();
        break;

      default:
        page = Container(
          child: Text('No Route'),
        );
        break;
    }

    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }

  static Route generateMainRoute(RouteSettings settings) {
    Widget page;

    print('#### settings 1 $settings');

    switch (settings.name) {
      case Routes.HOME:
        page = HomeScreen();
        break;

      case Routes.CONTACTS:
        page = ContactsScreen();
        break;

      default:
        page = Container(
          child: Text('No Route'),
        );
        break;
    }

    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }
}
