import 'package:flutter/material.dart';

class LearningImage extends StatelessWidget {
  const LearningImage({super.key});
  
  @override
  Widget build(BuildContext context){
    return SizedBox.expand( //Permite expandir para a tela toda
      child: Image.asset(
        "lib/assets/images/dog2.png",
        width: 300,
        height: 300,
        fit: BoxFit.cover,
        )
      );
  }

}