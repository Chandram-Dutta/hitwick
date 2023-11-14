import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'package:hitwick/constants.dart';
import 'package:hitwick/presentation/game/hitwick_game.dart';

class Hit extends RectangleComponent
    with KeyboardHandler, HasGameRef<HitwickGame> {
  Hit({
    required this.player,
  }) : super(
          size: Vector2(64, 16),
          paint: Paint()..color = const Color(0xFFFFFFFF),
        );

  final Player player;

  @override
  FutureOr<void> onLoad() {
    position = player == Player.playerA
        ? Vector2((game.size.x - 48) / 2, 16)
        : Vector2((game.size.x - 48) / 2, game.size.y - 32);
    add(RectangleHitbox.relative(Vector2(1, 1), parentSize: size));
    return super.onLoad();
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;
    if (isKeyDown && player == Player.playerA) {
      if (keysPressed.contains(LogicalKeyboardKey.keyW) && position.y > 0) {
        position.y -= 10;
      }
      if (keysPressed.contains(LogicalKeyboardKey.keyA) && position.x > 0) {
        position.x -= 10;
      }
      if (keysPressed.contains(LogicalKeyboardKey.keyS) &&
          position.y < game.size.y / 2 - 100) {
        position.y += 10;
      }
      if (keysPressed.contains(LogicalKeyboardKey.keyD) &&
          position.x < game.size.x - 64) {
        position.x += 10;
      }
    }
    if (isKeyDown && player == Player.playerB) {
      if (keysPressed.contains(LogicalKeyboardKey.arrowUp) &&
          position.y > game.size.y / 2 + 100) {
        position.y -= 10;
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowLeft) &&
          position.x > 0) {
        position.x -= 10;
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowDown) &&
          position.y < game.size.y - 16) {
        position.y += 10;
      }
      if (keysPressed.contains(LogicalKeyboardKey.arrowRight) &&
          position.x < game.size.x - 64) {
        position.x += 10;
      }
    }
    return super.onKeyEvent(event, keysPressed);
  }
}
