
import 'package:flutter/material.dart';

final class LearningButton extends StatelessWidget {
  String text = "";
  VoidCallback onPressed;

  LearningButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red),
        onPressed: () {
          onPressed();
        },
        child: Text(
          text, 
          style: const TextStyle(
            backgroundColor: Colors.red),
            ), 
    );
  }
}