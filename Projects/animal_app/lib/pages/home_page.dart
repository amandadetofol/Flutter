import 'package:animal_app/pages/drawer_list.dart';
import 'package:animal_app/pages/hello_gridview.dart';
import 'package:animal_app/testes/button.dart';
import 'package:animal_app/pages/hello_listview.dart';
import 'package:animal_app/pages/hello_page1.dart';
import 'package:animal_app/pages/hello_page2.dart';
import 'package:animal_app/pages/hello_page3.dart';
import 'package:animal_app/testes/expanded.dart';
import 'package:animal_app/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context){
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
      drawer: TesteDrawer(),
      floatingActionButton: _fab(),
      body:
        TabBarView(children: [
          _firstChild(context),
          Container(color: Colors.amber,)
        ],),
      appBar: 
        AppBar(
          backgroundColor: Color.fromARGB(255, 186, 161, 103),
          title: const Text(
            "Welcome",
            style: TextStyle(
              fontWeight: FontWeight.bold),
              ),
            bottom: const TabBar(tabs: [
              Tab(text: "Tab 1",),
              Tab(text: "Tab 2",)
            ]),
          ),
      ));
  }

  _column(BuildContext context){
    return Builder(builder: (BuildContext context) {
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
           },),
          
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
          LearningButton(text: 'GridView',onPressed: () { 
              _handleGridViewButtonTap(context);
           },)
        ]) 
      ],
    );
    });
  }

  _firstChild(BuildContext context){
    return Padding(
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

  _handleGridViewButtonTap(BuildContext context){
    goToNavigator(context, HelloGridView());
  }

  _handlePage3ButtonTap(BuildContext context){
    goToNavigator(context, const HelloPage3());
  }

  _handleSnackButtonTap(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Olá")
        )
      );
  }

  _handleDialogButtonTap(BuildContext context){
    showDialog(
      barrierDismissible: false, //impede de fechar o alerta se o usuario clicar fora o dialog
      context: context,
      builder: (context) {
        return WillPopScope(
          // ignore: sort_child_properties_last
          child:   AlertDialog(
          title: Text("Mensagem"),
          actions: [
            TextButton(
              child: Text("Ok"),
              onPressed: (){
                print("Clicou");
                Navigator.pop(context);
            }),
             TextButton(
              child: const Text("Cancelar",
              style: TextStyle(color: Colors.red),),
              onPressed: (){
                print("Cancelar");
                Navigator.pop(context);
            })
          ],
        ), 
        onWillPop: () async => false,); //impede que o android de pop no dialog quando clica no btn de voltar do celular      
      });
  }

  _handleToastButtonTap(BuildContext context){
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_LONG, //tempo pro android
        gravity: ToastGravity.CENTER_LEFT,
        timeInSecForIosWeb: 6, //tempo pro ios 
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
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

  _fabWithWidget(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: _fab(),
          height: 100,
          width: 100,
        ),
        _fab(),
        SizedBox(width: 16,),
        _fab()
    ],);
  }

  _fab(){
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print("Aqui");
      });
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
