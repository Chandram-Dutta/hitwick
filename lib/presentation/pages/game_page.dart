import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hitwick/presentation/game/hitwick_game.dart';
import 'package:hitwick/presentation/game/overlay/end_menu.dart';
import 'package:hitwick/presentation/game/overlay/main_menu.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GameWidget<HitwickGame>.controlled(
              overlayBuilderMap: {
                'MainMenu': (_, game) => MainMenu(game: game),
                'EndMenu': (_, game) => EndMenu(game: game),
              },
              gameFactory: HitwickGame.new,
            ),
          ),
        ),
      ),
    );
  }
}
