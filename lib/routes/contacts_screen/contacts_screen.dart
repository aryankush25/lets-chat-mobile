import 'package:flutter/material.dart';
import '../../dummy_data/contacts.dart';

class ContactsScreen extends StatelessWidget {
  static const routeName = '/contacts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Contact'),
      ),
      body: Container(
        child: ListView(
          children: dummyContacts
              .map(
                (contact) => ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(contact.imageUrl),
                    backgroundColor: Colors.tealAccent.shade100,
                    radius: 30,
                  ),
                  title: Text(
                    contact.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    contact.status,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
