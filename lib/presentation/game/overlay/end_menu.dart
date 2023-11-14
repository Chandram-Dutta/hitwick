import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hitwick/presentation/game/hitwick_game.dart';

class EndMenu extends StatelessWidget {
  const EndMenu({
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
    // const bodyTextStyle = TextStyle(
    //   fontFamily: 'Saira',
    //   fontSize: 18,
    //   color: Colors.black,
    // );
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
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        CupertinoIcons.xmark_circle_fill,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  "GAME OVER",
                  style: titleTextStyle,
                ),
                game.playerAScore > game.playerBScore
                    ? const Text(
                        "Player A wins!",
                        style: headingTextStyle,
                      )
                    : const Text(
                        "Player B wins!",
                        style: headingTextStyle,
                      ),
                const Spacer(),
                const SizedBox(
                  height: 48,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
