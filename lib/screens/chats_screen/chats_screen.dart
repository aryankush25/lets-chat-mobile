import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../utils/constants/route_names.dart';

class ChatsScreen extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      initialRoute: Routes.ALL_CHATS,
      onGenerateRoute: SetupRoutes.generateChatsRoute,
    );
  }
}
