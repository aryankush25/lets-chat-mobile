import 'package:flutter/material.dart';

import './routes/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s Chat',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomeScreen(),
      },
    );
  }
}
