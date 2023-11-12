import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Help"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hitwick is a 2 player game",
                  ),
                  Divider(),
                  Text("It's like ice hockey"),
                  Divider(),
                  Text("It's dull ik. but not boring."),
                  Divider(),
                  Text(
                      "Heck! It's not even remotely multiplayable. Maybe I'll add it later."),
                  Divider(),
                  Text(
                    "No instructions needed. If you can't play this, maybe you skipped your school.",
                  ),
                ],
              ),
            ),
          ),
          Text("Chandram Dutta © 2023")
        ],
      ),
    );
  }
}
