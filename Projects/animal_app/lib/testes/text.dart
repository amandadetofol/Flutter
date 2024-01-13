
import 'package:flutter/material.dart';

class LearningText extends StatelessWidget {
  const LearningText({super.key});
  
  @override
  Widget build(BuildContext context){
    return   const Text(
      "Oi!",
        style: TextStyle(
        fontSize: 30, 
        color: Colors.black, 
        fontWeight: FontWeight.bold, 
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.overline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy
      )
    );
  }

}