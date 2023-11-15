import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/components/global_level.dart';
import 'package:todo_app/components/todo_card.dart';
import 'package:todo_app/data/task_inherited.dart';
import 'package:todo_app/database/task_dao.dart';
import 'package:todo_app/screens/form_page.dart';

class HomePage extends StatefulWidget {
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
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (newContext) => FormPage(
                        context: context,
                      )),
            ).then((value) => setState((){}));
          },
          backgroundColor: Colors.pink,
          child: const Icon(Icons.add, color: Colors.white),
        ),
        appBar: AppBar(
            leading: Center(
              child: IconButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color?>(Colors.pink),
                  ),
                  onPressed: () {
                    setState(() {
                      widget.opacidade = !widget.opacidade;
                      widget.icon = widget.opacidade
                          ? Icons.visibility_off
                          : Icons.remove_red_eye;
                    });
                  },
                  icon: Icon(widget.icon, color: Colors.white)),
            ),
            backgroundColor: Colors.pink,
            title: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  child: Text(
                    "Tarefas",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
        body: AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: widget.opacidade ? 1 : 0,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: FutureBuilder<List<TodoCard>>(
              future: TaskDao().findAll(),
              builder: (context, snapshot) {
                List<TodoCard>? items = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Container(
                      child: const Center(
                        child: Text("Conectando ao banco..."),
                      ),
                    );

                  case ConnectionState.waiting:
                    return Container(
                      child: const Center(
                        child: Text("Carregando..."),
                      ),
                    );

                  case ConnectionState.active:
                    return Container(
                      child: const Center(
                        child: Text("Conexão estabelecida com banco de dados..."),
                      ),
                    );

                  case ConnectionState.done:
                    if (snapshot.hasData && items != null) {
                      if (items.isNotEmpty) {
                        return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              final task = items[index];
                              return task;
                            });
                      } else {
                        return Container(
                          child: const Center(
                            child: Text("Nenhuma tarefa encontrada."),
                          ),
                        );
                      }
                    } else {
                      return Container(
                        child: const Center(
                          child: Text("Nenhuma tarefa encontrada."),
                        ),
                      );
                    }

                }
              },
            ),
          ),
        ));
  }
}
