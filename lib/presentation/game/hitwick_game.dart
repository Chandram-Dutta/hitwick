import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/src/components/core/component.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hitwick/constants.dart';
import 'package:hitwick/presentation/game/components/ball.dart';
import 'package:hitwick/presentation/game/components/hit.dart';
import 'package:hitwick/presentation/game/components/midline.dart';
import 'package:hitwick/presentation/game/hud/hud.dart';

class HitwickGame extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  HitwickGame() : super();

  int playerAScore = 0;
  int playerBScore = 0;

  final midline = MidLine();
  final playerAHit = Hit(
    player: Player.playerA,
  );
  final playerBHit = Hit(
    player: Player.playerB,
  );
  final hud = Hud();
  final ball = Ball();

  void initializeGame() {
    add(midline);
    add(playerAHit);
    add(playerBHit);
    add(hud);
    add(ball);
  }

  void destroyGame() {
    midline.removeFromParent();
    playerAHit.removeFromParent();
    playerBHit.removeFromParent();
    hud.removeFromParent();
    ball.removeFromParent();
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await Flame.images.load('player_block_one.png');
    await Flame.images.load('ball_one.png');

    initializeGame();
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.space) {
      pauseEngine();
      overlays.add('MainMenu');
      return KeyEventResult.handled;
    }
    return super.onKeyEvent(event, keysPressed);
  }

  @override
  void update(double dt) {
    if (playerAScore == 5 || playerBScore == 5) {
      pauseEngine();
      overlays.add('EndMenu');
    }
    super.update(dt);
  }
}
