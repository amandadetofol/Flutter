
import 'package:flutter/material.dart';

final class HelloPage1 extends StatelessWidget {
  
  const HelloPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 186, 161, 103),
        title: 
        const Text(
          "Page 1",
          style: TextStyle(
            fontWeight: FontWeight.bold),
            )
        )
    );
  }

}