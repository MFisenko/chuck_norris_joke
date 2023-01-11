import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({Key? key}) : super(key: key);

  static const routeName = "/jokeScreen";

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.close),
              Text("Random joke: \"Query Results\""),
            ],
          ),
          const Icon(Icons.image),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Another Random Joke"),
          )
        ],
      ),
    );
  }
}
