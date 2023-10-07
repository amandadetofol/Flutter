import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class MyWidget extends StatefulWidget {
  final String nome;
  final String sobrenome;
  final String idade;

  MyWidget({super.key, required this.nome, required this.idade, required this.sobrenome});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int cliques = 0 ;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      height: 140,
      width: 400,
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                  "Nome: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              Text(widget.nome,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),)
            ],
          ),
          Row(
            children: [
              const Text(
                "Sobrenome: ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              Text(widget.sobrenome,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),)
            ],
          ),
          Row(
            children: [
              const Text(
                "Idade: ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
              Text(widget.idade,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),)
            ],
          ),
          Container(
            color: Colors.blue,
            child: Text(
              "Cliques no botão: $cliques",
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              cliques++;
            });
          }, child: Text("Clique aqui!"))
        ],),
    );
  }
}