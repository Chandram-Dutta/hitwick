import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hitwick/presentation/pages/game_page.dart';
import 'package:hitwick/presentation/pages/help_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  12,
                ),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      IconButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpPage(),
                          ),
                        ),
                        icon: const Icon(CupertinoIcons.question_circle),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/appicon.png",
                        height: 200,
                        width: 200,
                      ),
                      Text(
                        "HitWick",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: FilledButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GamePage(),
                          ),
                        ),
                        child: const Text("Play!"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
