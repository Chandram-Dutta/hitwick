import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';

class MidLine extends RectangleComponent {
  final Vector2 canvasSize;

  MidLine({
    required this.canvasSize,
  }) : super(
          size: Vector2(canvasSize.x, 2),
          position: Vector2(0, canvasSize.y / 2),
          paint: Paint()..color = const Color(0xFFFFFFFF),
        );

  @override
  void onGameResize(Vector2 newSize) {
    position = Vector2(0, newSize.y / 2);
    size = Vector2(newSize.x, 2);
    super.onGameResize(size);
  }
}
