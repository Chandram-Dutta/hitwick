import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:hitwick/constants.dart';
import 'package:hitwick/presentation/game/hitwick_game.dart';

class Score extends TextComponent with HasGameRef<HitwickGame> {
  final Player player;
  final Vector2 hudPosition;
  final bool reverse;

  Score({
    required this.player,
    required this.hudPosition,
    required this.reverse,
  });

  @override
  FutureOr<void> onLoad() async {
    position = hudPosition;
    anchor = Anchor.center;
    text = player == Player.playerA
        ? gameRef.playerAScore.toString()
        : gameRef.playerBScore.toString();
    textRenderer = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontFamily: 'Saira',
      ),
    );
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    // prepareCanvas(c);

    if (reverse) {
      canvas.save();
      canvas.translate(width / 2, height / 2);
      canvas.rotate(pi);
      canvas.translate(-width / 2, -height / 2);
    }

    textRenderer.render(
      canvas,
      text,
      Vector2.zero(),
    );

    if (reverse) {
      canvas.restore();
    }
  }

  @override
  void update(double dt) {
    text = player == Player.playerA
        ? gameRef.playerAScore.toString()
        : gameRef.playerBScore.toString();
    super.update(dt);
  }
}
