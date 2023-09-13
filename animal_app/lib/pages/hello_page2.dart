
import 'package:flutter/material.dart';

final class HelloPage2 extends StatelessWidget {
  
  const HelloPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 186, 161, 103),
        title: 
        const Text(
          "Page 2",
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
    Navigator.pop(context, "Page2");
  }

}