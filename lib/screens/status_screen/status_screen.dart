import 'package:flutter/material.dart';

import '../../models/contact.dart';
import '../../dummy_data/contacts.dart';
import './status_item.dart';

class StatusScreen extends StatefulWidget {
  final bool isClicked;

  StatusScreen({this.isClicked});

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<Contact> contacts;

  @override
  void initState() {
    print('initState StatusScreen');

    contacts = [...dummyContacts];

    super.initState();
  }

  @override
  void deactivate() {
    print('deactivate StatusScreen');

    super.deactivate();
  }

  @override
  void dispose() {
    print('dispose StatusScreen');

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies StatusScreen');

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('didUpdateWidget StatusScreen ${oldWidget}');
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
    print('build StatusScreen ${widget.isClicked}');

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
