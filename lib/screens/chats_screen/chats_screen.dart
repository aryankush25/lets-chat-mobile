import 'package:flutter/material.dart';

import '../../routes/routes.dart';
import '../../utils/constants/route_names.dart';
import '../../utils/helpers/navigator_keys.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: NavigatorKeys.getChatsNavigatorKey,
      initialRoute: Routes.ALL_CHATS,
      onGenerateRoute: SetupRoutes.generateChatsRoute,
    );
  }
}
