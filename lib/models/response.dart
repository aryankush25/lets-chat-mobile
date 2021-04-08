import 'package:flutter/material.dart';

class ResponseModel {
  final bool success;
  final Object body;
  final Object error;

  const ResponseModel({
    @required this.success,
    this.body,
    this.error,
  });
}
