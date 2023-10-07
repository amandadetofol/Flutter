import 'package:flutter/material.dart';

import 'my_widget.dart';

void main() {
  runApp(const MyApp());
}

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Column(
        children: [
          MyWidget(nome: 'Amanda', idade: '21', sobrenome: 'Detofol',
          ),
        ],
      ),
    );
  }

  Widget _exploringWidgets(){
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
           children: [
             Container(
               color: Colors.green,
               height: 400,
               width: 400,
             ),
             Container(
               color: Colors.white,
               height: 300,
               width: 300,
             ),
             Container(
               color: Colors.pink,
               height: 200,
               width: 200,
             ),
             const Text("Estou aprendendo \n widgets.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),)
           ],
          ),
          Container(
            height: 48,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: (){
                    print("Cliquei nesse botao");
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 48,
                    width: 200,
                    child: Text("CLIQUE AQUI"),
                  ))
            ],
          )
        ],
      ),
    );
  }

  Widget _rowAndColumn() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.blue,
                height: 50,
                width: 50,
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Colors.blue,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.pink,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.green,
                height: 50,
                width: 50,
              ),
              Container(
                color: Colors.yellow,
                height: 50,
                width: 50,
              )
            ],
          ),
          Container(
            color: Colors.amber,
            height: 48,
            width: 300,
            child: const Text(
                "Olá",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            print("Clicou no botao");
          }, child: Text("Button"))
        ],
      ),
    );
  }

  Widget _stackAndContainer() {
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            color: Colors.black,
            height: 300,
            width: 300,
          ),
          Container(
            color: Colors.red,
            height: 150,
            width: 150,
          ),
          Container(
            color: Colors.blue,
            height: 75,
            width: 75,
          ),
          Container(
            color: Colors.yellow,
            height: 37,
            width: 37,
          ),
        ],
      ),
    );
  }
}
