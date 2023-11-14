import 'dart:async';

import 'package:flame/components.dart';
import 'package:hitwick/constants.dart';
import 'package:hitwick/presentation/game/hitwick_game.dart';
import 'package:hitwick/presentation/game/hud/score.dart';

class Hud extends PositionComponent with HasGameRef<HitwickGame> {
  @override
  FutureOr<void> onLoad() {
    add(
      Score(
        player: Player.playerA,
        hudPosition: Vector2(game.size.x - 24, (game.size.y / 2) - 24),
        reverse: false,
      ),
    );
    add(
      Score(
        player: Player.playerB,
        hudPosition: Vector2(game.size.x - 24, (game.size.y / 2) + 24),
        reverse: false,
      ),
    );
    add(
      Score(
        player: Player.playerA,
        hudPosition: Vector2(24, (game.size.y / 2) - 24),
        reverse: true,
      ),
    );
    add(
      Score(
        player: Player.playerB,
        hudPosition: Vector2(24, (game.size.y / 2) + 24),
        reverse: true,
      ),
    );
    return super.onLoad();
  }
}
