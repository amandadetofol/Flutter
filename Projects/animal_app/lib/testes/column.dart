import 'package:animal_app/testes/button.dart';
import 'package:flutter/material.dart';

import '../pages/hello_page1.dart';

final class LearningColumn extends StatelessWidget{
  const LearningColumn({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.amber,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end, // no caso da coluna, é para mexer o conteúdo no eixo horizontal
      mainAxisAlignment: MainAxisAlignment.center, //eixo vertical -> é a forma de alinhar os elementos na tela, funciona somente com o max
      mainAxisSize: MainAxisSize.max, //min -> ocupa somente o necessário / max -> ocupa até o final da tela
      children: [
        LearningButton(text: 'texto', onPressed: () {  
          onClickOk(context);
        },), 
        LearningButton(text: 'texto', onPressed: () {  
          onClickOk(context);
        }, ),
        LearningButton(text: 'texto', onPressed: () { 
          onClickOk(context);
         }, )]
      ),
    );
  }

  onClickOk( 
    BuildContext context){
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
        return HelloPage1();
      }));
  }

}