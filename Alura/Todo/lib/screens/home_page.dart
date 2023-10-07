import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_card.dart';

final class HomePage extends StatefulWidget {
  bool opacidade = true;
  IconData icon = Icons.remove_red_eye;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.opacidade = !widget.opacidade;
                widget.icon = widget.opacidade ? Icons.visibility_off : Icons.remove_red_eye;
              });
            },
            backgroundColor: Colors.pink,
            child: Icon(
                widget.icon,
                color: Colors.white),
          ),
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: const Center(
              child: Text(
                "Tarefas",
                textAlign: TextAlign.center,
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: widget.opacidade ? 1 : 0,
            child: ListView(
              children: const [
                TodoCard(
                    'Aprender Flutter',
                    "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                    3),
                TodoCard(
                    'Andar de Bike',
                    "https://jasminealimentos.com/wp-content/uploads/2022/06/Blog1_IMG_1-1-860x485.png",
                    2),
                TodoCard(
                    'Meditar',
                    "https://catracalivre.com.br/wp-content/uploads/sites/19/2017/05/Medita%C3%A7%C3%A3o-iStock.jpg",
                    5),
              ],
            ),
          )
      );
  }
}