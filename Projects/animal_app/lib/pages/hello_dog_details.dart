
import 'package:animal_app/pages/hello_gridview.dart';
import 'package:animal_app/pages/hello_listview.dart';
import 'package:flutter/material.dart';

final class DogDetails extends StatelessWidget {

  final Dog dog;

 const DogDetails({super.key, required this.dog}); 

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: _body(context, dog),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 186, 161, 103),
        title: Text("Detalhes"),
      ),
    );
  }

  _body(BuildContext context, Dog dog){
    return Center(
      child: Container(
        child:
          Column(
            children: [
              Text(dog.nome, 
                  style: const TextStyle(
                    color: Colors.black, 
                    fontWeight: FontWeight.w500, 
                    fontSize: 24
                )
              ), 
              _image(context, img: dog.foto)
            ],
        )
      ),
    );
  }

  _image(
    BuildContext context, 
   {required String img}){
      Size size = MediaQuery.of(context).size;

      return Image.asset(
          height: size.width,
          width: size.width, 
          fit: BoxFit.cover, 
          img);
    }

}