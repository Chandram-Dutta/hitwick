import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:hitwick/presentation/game/hit.dart';
import 'package:hitwick/presentation/game/hitwick_game.dart';

class Ball extends CircleComponent
    with HasGameRef<HitwickGame>, CollisionCallbacks {
  final Vector2 canvaseSize;
  late Vector2 direction;
  double speed = 200.0;

  Ball({
    required this.canvaseSize,
  }) : super(
          radius: 18,
          position: Vector2.zero(),
          paint: Paint()..color = const Color(0xFFFFFFFF),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();

    position = Vector2(canvaseSize.x / 2, canvaseSize.y / 2);

    final random = Random();
    double angle;
    do {
      angle = random.nextDouble() * 2 * pi;
    } while ((angle > 0.05 * pi && angle < 0.45 * pi) ||
        (angle > 0.55 * pi && angle < 0.95 * pi) ||
        (angle > 1.05 * pi && angle < 1.45 * pi) ||
        (angle > 1.55 * pi && angle < 1.95 * pi));
    direction = Vector2(cos(angle), sin(angle));

    add(
      CircleHitbox.relative(1, parentSize: size),
    );

    await Future.delayed(const Duration(seconds: 3), () {});
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Hit) {
      speed += 5;

      // Calculate the deviation based on where the ball hit
      double hitPosition = (position.x - other.position.x) / other.width;
      hitPosition =
          hitPosition.clamp(-1, 1); // Ensure the value is between -1 and 1

      // Calculate the new direction
      double deviation;
      if (other.player == Player.playerA) {
        deviation = -0.6 * pi * hitPosition; // Reflect PlayerB's hit
        direction =
            Vector2(-sin(deviation), cos(deviation)); // Downwards for PlayerA
      } else {
        deviation = 0.6 * pi * hitPosition; // Normal behavior for PlayerB
        direction =
            Vector2(sin(deviation), -cos(deviation)); // Upwards for PlayerB
      }
    }
    super.onCollision(intersectionPoints, other);
  }

  @override
  void update(double dt) {
    super.update(dt);

    position += direction * speed * dt;

    if (position.x <= 0 || position.x >= canvaseSize.x - 32) {
      direction = Vector2(-direction.x, direction.y);
    }
    if (position.y <= 0 || position.y >= canvaseSize.y - 32) {
      direction = Vector2(direction.x, -direction.y);
    }
  }
}
