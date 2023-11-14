import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';
import 'package:hitwick/presentation/game/hitwick_game.dart';

class MidLine extends RectangleComponent with HasGameRef<HitwickGame> {
  @override
  FutureOr<void> onLoad() {
    size = Vector2(game.size.x, 2);
    position = Vector2(0, game.size.y / 2);
    paint = Paint()..color = const Color(0xFFFFFFFF);
    return super.onLoad();
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void onGameResize(Vector2 newSize) {
    position = Vector2(0, newSize.y / 2);
    size = Vector2(newSize.x, 2);
    super.onGameResize(size);
  }
}
