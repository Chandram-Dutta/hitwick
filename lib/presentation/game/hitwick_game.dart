import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:hitwick/presentation/game/ball.dart';

class HitwickGame extends FlameGame {
  HitwickGame();
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await Flame.images.load('player_block_one.png');
    await Flame.images.load('ball_one.png');

    add(
      Ball(
        canvaseSize: Vector2(canvasSize.x, canvasSize.y),
      ),
    );
  }
}
