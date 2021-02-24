import 'package:flutter/material.dart';
import 'package:lets_chat_mobile/routes/contacts_screen/contacts_screen.dart';

import './routes/home_screen/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s Chat',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        ContactsScreen.routeName: (ctx) => ContactsScreen(),
      },
    );
  }
}
