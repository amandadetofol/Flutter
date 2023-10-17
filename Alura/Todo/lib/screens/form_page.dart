import 'package:flutter/material.dart';

final class FormPage extends StatefulWidget {
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Center(
            child: Text(
              "Nova Tarefa",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
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
                        validator: (String? value){
                          if (value!=null && value.isEmpty){
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
                        validator: (String? value){
                          if (int.parse(value!) > 5
                              ||  int.parse(value!) < 1){
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
                        validator: (String? value){
                          if (value!=null && value.isEmpty){
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
                            errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace){
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
                          if (_formKey.currentState!.validate()){
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    elevation: 150.0,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text("Salvando nova tarefa...")
                                )
                            );
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
