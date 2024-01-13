import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_card.dart';
import 'package:todo_app/data/task_inherited.dart';
import 'package:todo_app/database/task_dao.dart';

final class FormPage extends StatefulWidget {
  final BuildContext context;

  const FormPage({super.key, required this.context});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    return value != null && value.isEmpty;
  }

  bool difficultyValidator(String? value) {
    return valueValidator(value) ||
        int.parse(value!) > 5 ||
        int.parse(value!) < 1;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(
            "Nova Tarefa",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: 375,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        validator: (String? value) {
                          if (valueValidator(value)) {
                            return "Campo obrigatório";
                          }
                          return null;
                        },
                        controller: nameController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Nome",
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        validator: (String? value) {
                          if (difficultyValidator(value)) {
                            return "O valor precisa ser um número entre 1 e 5.";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        controller: difficultyController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Dificuldade",
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextFormField(
                        validator: (String? value) {
                          if (valueValidator(value)) {
                            return "Campo obrigatório";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.url,
                        controller: imageController,
                        textAlign: TextAlign.center,
                        onChanged: (text) {
                          setState(() {});
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Imagem",
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 100,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black54, width: 2),
                        ),
                        child: ClipRRect(
                          child: Image.network(
                            errorBuilder: (BuildContext context, Object object,
                                StackTrace? stackTrace) {
                              return Icon(Icons.camera_alt_sharp);
                            },
                            imageController.text,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color?>(Colors.pink)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            TaskDao().save(TodoCard(
                                nameController.text,
                                imageController.text,
                               int.parse(difficultyController.text)));
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: 300,
                          child: const Text(
                            "ADICIONAR",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
