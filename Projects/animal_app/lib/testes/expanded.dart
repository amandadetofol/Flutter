
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final class ExpandedLearning extends StatelessWidget {
  const ExpandedLearning({super.key});
  
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Expanded"),),
      body: Column(
        children: [
          Expanded(child: _pageView(context)),
          Expanded(child: _pageView(context), flex: 3,),
          ],
      ),
    );
  }

  _pageView(BuildContext context){
    return PageView(
      children: [
        _image(context, img: "lib/assets/images/dog1.png"),
        _image(context, img: "lib/assets/images/dog2.png"),
        _image(context, img: "lib/assets/images/dog3.png"),
        _image(context, img: "lib/assets/images/dog4.png"),
        _image(context, img: "lib/assets/images/dog5.png"),
      ],
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