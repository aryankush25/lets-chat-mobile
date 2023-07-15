import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/themes/theme.dart';
import '../routes/routes.dart';
import '../utils/helpers/navigator_keys.dart';
import '../bloc/authentication/authentication.dart';
import '../utils/constants/route_names.dart';
import '../repository/socket_io_repository.dart';

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.unauthenticated) {
          NavigatorKeys.getHomeNavigatorKeyCurrentState
              .pushNamedAndRemoveUntil(Routes.LOGIN, (route) => false);

          RepositoryProvider.of<SocketIoRepository>(context).disconnect();
        }

        if (state.status == AuthenticationStatus.authenticated) {
          NavigatorKeys.getHomeNavigatorKeyCurrentState
              .pushNamedAndRemoveUntil(Routes.HOME, (route) => false);

          RepositoryProvider.of<SocketIoRepository>(context).init();
        }
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
