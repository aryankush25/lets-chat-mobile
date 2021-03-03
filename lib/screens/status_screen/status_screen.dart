import 'package:flutter/material.dart';

import '../../models/contact.dart';
import '../../dummy_data/contacts.dart';
import './status_item.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<Contact> contacts;

  @override
  void initState() {
    contacts = dummyContacts;

    super.initState();
  }

  deleteContact(String id) {
    print('id $id');
    setState(() {
      contacts.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: contacts.map(
        (contact) {
          return StatusItem(
            key: ValueKey(contact.id),
            // key: GlobalKey(),
            contact: contact,
            deleteContact: deleteContact,
          );
        },
      ).toList(),
    );
  }
}
