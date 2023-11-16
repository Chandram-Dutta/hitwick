import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:hitwick/presentation/game/hitwick_game.dart';

class Pause extends SpriteComponent with HasGameRef<HitwickGame>, TapCallbacks {
  final Vector2 hudPosition;

  Pause({required this.hudPosition});

  @override
  Future<void> onLoad() async {
    position = hudPosition;
    Sprite pauseSprite = await gameRef.loadSprite('pause.png');
    size = Vector2(48, 48);
    sprite = pauseSprite;
    return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    game.pauseEngine();
    game.overlays.add('MainMenu');
    super.onTapUp(event);
  }
}
