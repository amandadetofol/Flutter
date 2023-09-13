import 'package:animal_app/testes/button.dart';
import 'package:animal_app/pages/hello_listview.dart';
import 'package:animal_app/pages/hello_page1.dart';
import 'package:animal_app/pages/hello_page2.dart';
import 'package:animal_app/pages/hello_page3.dart';
import 'package:animal_app/testes/expanded.dart';
import 'package:animal_app/utils/nav.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body:
       Padding(
        padding: const EdgeInsets.all(16), 
        child: Container(
          color: Colors.white,
          child: 
            //Column nao expande autaticamente, preciso sempre colocar um tamanho
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                    _title(),
                    _pageView(context),
                    _column(context),
                ],
            )
        ),
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

  _column(BuildContext context){
    return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
          [LearningButton(text: 'List View', onPressed: () { 
              _handleListViewButtonTap(context);
           },
          ),
            LearningButton(text: 'Page 2',onPressed: () { 
              _handlePage2ButtonTap(context);
           },
          ),
            LearningButton(text: 'Page 3',onPressed: () { 
              _handlePage3ButtonTap(context);
           },
          ),
           LearningButton(text: 'Expanded',onPressed: () { 
              _handleExpandedButtonTap(context);
           },)
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
          [ LearningButton(text: 'Snack',onPressed: () { 
              _handleSnackButtonTap(context);
           },
          ),
            LearningButton(text: 'Dialog', onPressed: () { 
              _handleDialogButtonTap(context);
           },
          ),
            LearningButton(text: 'Toast',onPressed: () { 
              _handleToastButtonTap(context);
           },
         ),
        ]) 
      ],
    );
  }

  _handleExpandedButtonTap(BuildContext context){
    goToNavigator(context, ExpandedLearning());
  }

  _handleListViewButtonTap(BuildContext context){
    goToNavigator(context, const HelloListView());
  }

  _handlePage2ButtonTap(BuildContext context){
    goToNavigator(context, const HelloPage2());
  }

  _handlePage3ButtonTap(BuildContext context){
    goToNavigator(context, const HelloPage3());
  }

  _handleSnackButtonTap(BuildContext context){
    print(context);
  }

  _handleDialogButtonTap(BuildContext context){
    print(context);
  }

  _handleToastButtonTap(BuildContext context){
    print(context);
  }

  
  goToNavigator( 
    BuildContext context,
    Widget page) async {
      String s = await push(context, page);
      print("Conteúdo retornado $s");
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

  _title(){
    return const Text(
      "Cute Dogs",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold, 
        color: Colors.black,
      )
    );
  }

  _pageView(BuildContext context){
     return Container(
        margin: EdgeInsets.all(10),
        height: 300, 
        child:PageView(children: [
            _image(context, img: "lib/assets/images/dog1.png"),
            _image(context, img: "lib/assets/images/dog2.png"),
            _image(context, img: "lib/assets/images/dog3.png"),
            _image(context, img: "lib/assets/images/dog4.png"),
            _image(context, img: "lib/assets/images/dog5.png"),
        ],
        ),
      );
  }

}
