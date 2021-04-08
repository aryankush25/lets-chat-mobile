import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './app_view.dart';
import '../bloc/authentication/authentication.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthenticationBloc()
            ..add(
              AuthenticationVerifyRequested(),
            ),
        ),
      ],
      child: AppView(),
    );
  }
}
