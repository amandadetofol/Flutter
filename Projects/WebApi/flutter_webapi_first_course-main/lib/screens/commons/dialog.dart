import 'package:flutter/material.dart';

class DialogModel {
  String title;
  String description;
  String confirmation;

  DialogModel({
    String? title,
    String? description,
    String? confirmation,
  })  : title = title ?? "Atenção!",
        description = description ?? "Realmente deseja executar essa operação?",
        confirmation = confirmation ?? "Confirmar";
}

Future<dynamic> showConfirmationDialog(BuildContext context, DialogModel model) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          title: Text(
            model.title,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          content: Text(model.description),
          actions: [
            TextButton(onPressed: () {
              Navigator.pop(context, false);
            }, child: Text("Cancelar")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(
                  model.confirmation.toUpperCase(),
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.green,
                  ),
                )),
          ]);
    },
  );
}
