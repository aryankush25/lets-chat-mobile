import 'package:flutter/material.dart';

class Contacts {
  final String name;
  final String status;
  final Color imageUrl;

  const Contacts({
    @required this.name,
    @required this.status,
    this.imageUrl,
  });
}
