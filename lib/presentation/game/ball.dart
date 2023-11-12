import 'dart:math';

import 'package:flame/components.dart';
import 'package:hitwick/presentation/game/hitwick_game.dart';

class Ball extends SpriteComponent with HasGameRef<HitwickGame> {
  final Vector2 canvaseSize;
  late Vector2 direction;
  double speed = 200.0;

  Ball({
    required this.canvaseSize,
  }) : super(size: Vector2(32, 32));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    final ballImage = game.images.fromCache('ball_one.png');
    sprite = Sprite(ballImage);
    position = Vector2(canvaseSize.x / 2, canvaseSize.y / 2);
    // Generate a random direction
    final random = Random();
    final angle = random.nextDouble() * 2 * pi;
    direction = Vector2(cos(angle), sin(angle));

    // Other initialization code...
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Update position
    position += direction * speed * dt;

    // Reflect direction if hitting a boundary
    if (position.x <= 0 || position.x >= canvaseSize.x) {
      direction = Vector2(-direction.x, direction.y);
    }
    if (position.y <= 0 || position.y >= canvaseSize.y) {
      direction = Vector2(direction.x, -direction.y);
    }
  }
}
