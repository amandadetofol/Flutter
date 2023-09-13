
import 'package:flutter/material.dart';

final class HelloListView extends StatelessWidget {
  const HelloListView({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _body(context),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 186, 161, 103),
        title: Text("ListView")
        ),
    );
  }

  _body(BuildContext context){

    final imgs = [
        _image(context, img: "lib/assets/images/dog1.png"),
        _image(context, img: "lib/assets/images/dog2.png"),
        _image(context, img: "lib/assets/images/dog3.png"),
        _image(context, img: "lib/assets/images/dog4.png"),
        _image(context, img: "lib/assets/images/dog5.png"),
    ];

    /* Container(child:
     ListView(
      itemExtent: 500, //tamannho padrao da célula
      children: 
        //imgs -> passar diretamente a lista de widgets para dentro

      ),
    );*/

    return ListView.builder(
      itemCount: imgs.length,
      itemExtent: 300,
      itemBuilder: (BuildContext context, index) {
        return imgs[index];
    });
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


}