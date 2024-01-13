import 'package:animal_app/testes/button.dart';
import 'package:animal_app/pages/hello_page1.dart';
import 'package:flutter/material.dart';

final class LearningRow extends StatelessWidget {
 const LearningRow({super.key});

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height, //preciso colocar um tamanho para que o crossAxisAligment funcione, porque o padrao eh sempre o tamanho do maior widget
      color: Colors.amber,
    child:  Row(
      crossAxisAlignment: CrossAxisAlignment.stretch, // no caso da row, é para mexer o conteúdo na vertical
      mainAxisAlignment: MainAxisAlignment.center, //eixo vertical -> é a forma de alinhar os elementos na tela, funciona somente com o max
      mainAxisSize: MainAxisSize.max, //min -> ocupa somente o necessário / max -> ocupa até o final da tela
      children: [
        LearningButton(text: 'texto', onPressed: () { 
          onClickOk(context);
         }, ), 
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