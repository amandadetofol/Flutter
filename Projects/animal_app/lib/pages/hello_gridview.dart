
import 'package:animal_app/pages/hello_dog_details.dart';
import 'package:animal_app/utils/nav.dart';
import 'package:flutter/material.dart';

final class HelloGridView extends StatefulWidget {
  const HelloGridView({super.key});

  @override
  State<HelloGridView> createState() => _HelloGridViewState();
}

class _HelloGridViewState extends State<HelloGridView> {
  bool gridView = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _body(context),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                gridView = false;
              });
            }, 
            icon: Icon(
              Icons.list)
          ), 
          IconButton(
            onPressed: (){
              setState(() {
                 gridView = true;
              });
            }, 
            icon: Icon(
              Icons.grid_3x3)
          )
        ],
        backgroundColor: Color.fromARGB(255, 186, 161, 103),
        title: Text("GridView")
        ),
    );
  }

  _body(BuildContext context){

    final dogs = [
      Dog("Jack Russel","lib/assets/images/dog1.png"),
      Dog("Labrador","lib/assets/images/dog2.png"),
      Dog("Pug","lib/assets/images/dog3.png"),
      Dog("RotWeiler","lib/assets/images/dog4.png"),
      Dog("Pastor","lib/assets/images/dog5.png"),
      Dog("Jack Russel","lib/assets/images/dog1.png"),
      Dog("Labrador","lib/assets/images/dog2.png"),
      Dog("Pug","lib/assets/images/dog3.png"),
      Dog("RotWeiler","lib/assets/images/dog4.png"),
      Dog("Pastor","lib/assets/images/dog5.png"),
      Dog("Jack Russel","lib/assets/images/dog1.png"),
      Dog("Labrador","lib/assets/images/dog2.png"),
      Dog("Pug","lib/assets/images/dog3.png"),
      Dog("RotWeiler","lib/assets/images/dog4.png"),
      Dog("Pastor","lib/assets/images/dog5.png"),
      Dog("Jack Russel","lib/assets/images/dog1.png"),
      Dog("Labrador","lib/assets/images/dog2.png"),
      Dog("Pug","lib/assets/images/dog3.png"),
      Dog("RotWeiler","lib/assets/images/dog4.png"),
      Dog("Pastor","lib/assets/images/dog5.png"),
      Dog("Jack Russel","lib/assets/images/dog1.png"),
      Dog("Labrador","lib/assets/images/dog2.png"),
      Dog("Pug","lib/assets/images/dog3.png"),
      Dog("RotWeiler","lib/assets/images/dog4.png"),
      Dog("Pastor","lib/assets/images/dog5.png"),
    ];

    if (gridView) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: dogs.length,
          itemBuilder: (BuildContext context, index) {
             var dog = dogs[index];
             return _item(dog);
       });
    } else {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 300,
        itemBuilder: (BuildContext context, index) {
            var dog = dogs[index];
             return _item(dog);
        });
    }
  
  }

  Image _image(
    BuildContext context, 
   {required String img}){
      Size size = MediaQuery.of(context).size;

      return Image.asset(
          height: size.width,
          width: size.width, 
          fit: BoxFit.cover, 
          img);
    }

    _item(Dog dog){
      return GestureDetector(
        child:Stack(
          children: [
            _image(context, img: dog.foto), 
            Container(
              alignment: Alignment.bottomRight,
              child: Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black45),
                  child: Text(
                  dog.nome, 
                  style: const TextStyle(
                    fontSize: 30, 
                    color: Colors.white, 
                    fontWeight: FontWeight.bold,),
                  ),  
                )
              )
            ]
        ),
        onTap: (){
          push(context, DogDetails(dog: dog));
      });
      
    }
}

final class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}