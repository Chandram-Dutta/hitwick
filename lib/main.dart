import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitwick/presentation/pages/game_page.dart';
import 'package:hitwick/presentation/pages/help_page.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Saira',
        textTheme: const TextTheme(
          displayMedium: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
            foregroundColor: MaterialStateProperty.all(
              Colors.black,
            ),
            overlayColor: MaterialStateProperty.all(
              Colors.grey,
            ),
          ),
        ),
      ),
      home: const LandingPage(),
    );
  }
}

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
                  Text(
                    "HitWick",
                    style: Theme.of(context).textTheme.displayMedium,
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
