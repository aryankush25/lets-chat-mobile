import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

import './app/app.dart';
import './bloc/global_bloc_observer.dart';

Future main() async {
  await DotEnv.load(fileName: ".env");

  Bloc.observer = GlobalBlocObserver();

  runApp(MyApp());
}
