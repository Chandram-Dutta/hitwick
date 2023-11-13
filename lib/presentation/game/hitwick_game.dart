import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:hitwick/presentation/game/ball.dart';
import 'package:hitwick/presentation/game/hit.dart';
import 'package:hitwick/presentation/game/midline.dart';

class HitwickGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  HitwickGame() : super();
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await Flame.images.load('player_block_one.png');
    await Flame.images.load('ball_one.png');

    add(MidLine(canvasSize: size));

    add(Hit(canvaseSize: size, player: Player.playerA));
    add(Hit(canvaseSize: size, player: Player.playerB));
    add(
      Ball(
        canvaseSize: size,
      ),
    );
  }
}
