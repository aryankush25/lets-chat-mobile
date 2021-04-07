import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/themes/theme.dart';
import '../routes/routes.dart';
import '../utils/helpers/navigator_keys.dart';
import '../bloc/authentication/authentication.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {},
      child: MaterialApp(
        title: 'Let\'s Chat',
        theme: Themes.defaultTheme,
        navigatorKey: NavigatorKeys.getHomeNavigatorKey,
        routes: SetupRoutes.rootRoutes,
        // onGenerateRoute: SetupRoutes.generateMainRoute,
      ),
    );
  }
}
