import 'package:flutter/material.dart';

class Contact {
  final String id;
  final String name;
  final String status;
  final String imageUrl;

  const Contact({
    @required this.id,
    @required this.name,
    @required this.status,
    @required this.imageUrl,
  });
}
