
import 'package:flutter/material.dart';

final class HelloPage3 extends StatelessWidget {
  
  const HelloPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 186, 161, 103),
        title: 
        const Text(
          "Page 3",
          style: TextStyle(
            fontWeight: FontWeight.bold),
            )
        )
    );
  }

  _body(BuildContext context){
    return Center(
      child: ElevatedButton(onPressed: (){
        _onClickBack(context);
      }, child: Text("Voltar para a tela anterior")));
  }

  _onClickBack(BuildContext context){
    Navigator.pop(context, "Page3");
  }

}