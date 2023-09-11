
import 'package:animal_app/testes/image.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        color: Colors.white,
        child:  LearningImage()  
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 74, 46),
        title: const Text(
          "Bem-Vindo!",
          style: TextStyle(
            fontWeight: FontWeight.bold),
            )
        )
      );
  }

}