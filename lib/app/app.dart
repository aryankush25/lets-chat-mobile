import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './app_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: AppView(),
    );
  }
}
