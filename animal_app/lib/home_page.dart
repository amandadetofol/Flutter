import 'package:animal_app/testes/column.dart';
import 'package:animal_app/testes/row.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: 
          Column(
             mainAxisAlignment: MainAxisAlignment.center,
             mainAxisSize: MainAxisSize.max,
             children: [
                const Text("Cute Dogs",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold, 
                    color: Colors.black,
                  )
                ),
                Image.asset(
                  height: size.width,
                  width: size.width, 
                  fit: BoxFit.cover, 
                  "lib/assets/images/dog2.png"),
                ElevatedButton(onPressed:(){
                  print("Like this dog");
                }
                , child: Text("Love"))  
              ],
          )
        ),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 186, 161, 103),
        title: const Text(
          "Welcome",
          style: TextStyle(
            fontWeight: FontWeight.bold),
            )
        )
      );
  }
}
