import 'package:flutter/material.dart';

import '../../utils/helpers/navigator_keys.dart';
import '../../models/user.dart';

class ContactViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contact = ModalRoute.of(context).settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            NavigatorKeys.getHomeNavigatorKeyCurrentState.pop();
          },
        ),
        title: Text(
          'Contact',
        ),
        centerTitle: false,
      ),
      body: Stack(
        alignment: const Alignment(-1, 1),
        children: [
          Image.network(
            'https://www.w3schools.com/howto/img_avatar.png',
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
              contact.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
