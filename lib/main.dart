import 'package:chuck_norris_joke_app/providers/joke_provider.dart';
import 'package:chuck_norris_joke_app/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => JokeProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
          buttonColor: const Color.fromRGBO(224, 100, 55, 1),
          accentColor: const Color.fromRGBO(224, 100, 55, 1),
        ),
        home: const MenuScreen(),
      ),
    );
  }
}
