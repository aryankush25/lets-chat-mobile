import 'package:flutter/material.dart';
import '../calls_screen.dart';

class CountLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var count = Count.of(context).count;

    return Container(
      child: Text(
        'Count -> $count',
      ),
    );
  }
}
