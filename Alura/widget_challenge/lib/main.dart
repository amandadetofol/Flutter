import 'package:flutter/material.dart';
import 'package:widget_challenge/card.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter: Primeiros Passos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: CardRow(),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          leading: const Icon(
              Icons.monitor_heart,
              size: 35,
              color: Colors.white),
          title: const Text(
            "Flutter: Primeiros Passos",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
