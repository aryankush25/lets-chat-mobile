import 'package:flutter/material.dart';

import './routes/chat_screen/chat_screen.dart';
import './routes/home_screen/home_screen.dart';
import './routes/contacts_screen/contacts_screen.dart';
import './routes/contact_view_screen/contact_view_screen.dart';

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
        ChatScreen.routeName: (ctx) => ChatScreen(),
        ContactViewScreen.routeName: (ctx) => ContactViewScreen(),
      },
    );
  }
}
