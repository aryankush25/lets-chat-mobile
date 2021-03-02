import 'package:flutter/material.dart';

import '../../models/contact.dart';

class ContactViewScreen extends StatelessWidget {
  static const routeName = '/contactView';

  @override
  Widget build(BuildContext context) {
    final contact = ModalRoute.of(context).settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
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
            contact.imageUrl,
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
