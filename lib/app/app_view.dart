import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_chat_mobile/utils/constants/route_names.dart';

import '../utils/themes/theme.dart';
import '../routes/routes.dart';
import '../utils/helpers/navigator_keys.dart';
import '../bloc/authentication/authentication.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        print('#### $state');

        NavigatorKeys.getHomeNavigatorKeyCurrentState
            .pushNamedAndRemoveUntil(Routes.HOME, (route) => false);
      },
      child: MaterialApp(
        title: 'Let\'s Chat',
        theme: Themes.defaultTheme,
        navigatorKey: NavigatorKeys.getHomeNavigatorKey,
        routes: SetupRoutes.rootRoutes,
        // initialRoute: Routes.LOGIN,
        // onGenerateRoute: SetupRoutes.generateMainRoute,
      ),
    );
  }
}
