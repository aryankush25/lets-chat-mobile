import 'package:flutter/material.dart';

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius});

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}
