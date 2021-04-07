import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './login_form.dart';
import '../../bloc/login/login.dart';
import '../../bloc/login/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: LoginForm(),
        ),
      ),
    );
  }
}
