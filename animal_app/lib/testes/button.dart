
import 'package:flutter/material.dart';

final class LearningButton extends StatelessWidget {
   const LearningButton({super.key});

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red),
        onPressed: () {
          onClickOk("Botao Pressionado");
        },
        child: const Text(
          'Meu Botão', 
          style: TextStyle(
            backgroundColor: Colors.red),
            ), 
    );
  }

  void onClickOk(String message){
    print(message);
  }

}