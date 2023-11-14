import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hitwick/presentation/game/hitwick_game.dart';
import 'package:hitwick/presentation/pages/help_page.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    super.key,
    required this.game,
  });

  final HitwickGame game;

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(
      fontFamily: 'Saira',
      fontSize: 32,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    const headingTextStyle = TextStyle(
      fontFamily: 'Saira',
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    const bodyTextStyle = TextStyle(
      fontFamily: 'Saira',
      fontSize: 18,
      color: Colors.black,
    );
    return Material(
      color: Colors.black12,
      child: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "PAUSED",
                  style: titleTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.xmark_circle_fill,
                        color: Colors.redAccent,
                        size: 32,
                      ),
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     game.playerAScore = 0;
                    //     game.playerBScore = 0;
                    //     game.resumeEngine();
                    //     game.destroyGame();
                    //     game.initializeGame();
                    //     game.overlays.remove('MainMenu');
                    //   },
                    //   icon: const Icon(
                    //     CupertinoIcons.refresh_circled_solid,
                    //     color: Colors.orangeAccent,
                    //     size: 32,
                    //   ),
                    // ),
                    IconButton(
                      onPressed: () {
                        game.resumeEngine();
                        game.overlays.remove('MainMenu');
                      },
                      icon: const Icon(
                        CupertinoIcons.play_circle_fill,
                        color: Colors.green,
                        size: 32,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        CupertinoIcons.question_circle_fill,
                        color: Colors.black,
                        size: 32,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
