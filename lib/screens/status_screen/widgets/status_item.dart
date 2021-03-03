import 'package:flutter/material.dart';
import 'dart:math';

import '../../../models/contact.dart';

class StatusItem extends StatefulWidget {
  final Contact contact;
  final Function deleteContact;

  const StatusItem({
    Key key,
    this.contact,
    this.deleteContact,
  }) : super(key: key);

  @override
  _StatusItemState createState() {
    // print('createState StatusItem ${contact.id} $key');

    return _StatusItemState();
  }
}

class _StatusItemState extends State<StatusItem> {
  Color _bgColor;

  @override
  void initState() {
    // print('initState StatusItem ${widget.contact.id}');

    const availableColors = [
      Colors.red,
      Colors.amber,
      Colors.blue,
      Colors.pink,
    ];

    _bgColor = availableColors[Random().nextInt(4)];

    super.initState();
  }

  @override
  void deactivate() {
    // print('deactivate StatusItem ${widget.contact.id}');

    super.deactivate();
  }

  @override
  void dispose() {
    // print('dispose StatusItem ${widget.contact.id}');

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print('build StatusItem ${widget.contact.id}');

    return ListTile(
      tileColor: _bgColor,
      contentPadding: EdgeInsets.all(8),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.contact.imageUrl),
        backgroundColor: Colors.tealAccent.shade100,
        radius: 30,
      ),
      title: Text(
        widget.contact.name,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        widget.contact.status,
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          widget.deleteContact(widget.contact.id);
        },
      ),
    );
  }
}
