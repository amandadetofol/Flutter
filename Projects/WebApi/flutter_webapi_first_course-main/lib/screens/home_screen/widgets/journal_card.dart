import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/screens/commons/dialog.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import 'package:uuid/uuid.dart';
import '../../../helpers/logout.dart';

class JournalCard extends StatelessWidget {
  final Journal? journal;
  final DateTime showedDate;
  final Function refresh;
  final int userId;
  final String token;

  const JournalCard(
      {Key? key,
      this.journal,
      required this.showedDate,
      required this.refresh,
      required this.userId,
      required this.token})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((journal?.content?.length ?? 0) > 1) {
      return InkWell(
        onTap: () {
          goToDetails(context, journal);
        },
        child: Container(
          height: 115,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87,
            ),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 75,
                    width: 75,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      border: Border(
                          right: BorderSide(color: Colors.black87),
                          bottom: BorderSide(color: Colors.black87)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      journal!.createdAt.day.toString(),
                      style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 38,
                    width: 75,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.black87),
                      ),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text(WeekDay(journal!.createdAt.weekday).short),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    journal!.content,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _deleteJournal(context);
                  },
                  icon: Icon(Icons.delete))
            ],
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          goToDetails(context, null);
        },
        child: Container(
          height: 115,
          alignment: Alignment.center,
          child: Text(
            "${WeekDay(showedDate.weekday).short} - ${showedDate.day}",
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  _deleteJournal(BuildContext context) async {
    showConfirmationDialog(
            context,
            DialogModel(
                description: "Deseja realmente excluir essa informação?",
                confirmation: "remover"))
        .then((value) async {
      if (value != null) {
        if (value) {
          JournalService service = JournalService();
          bool operationSucceded =
              await service.delete(journal?.id ?? "", id: userId, token: token);

          if (operationSucceded) {
            refresh();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Registro removido!"),
              backgroundColor: Colors.greenAccent,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Algo deu errado!"),
              backgroundColor: Colors.red,
            ));
          }
        }
      }
    }).catchError((error) {
      logout(context);
    }, test: (error) => error is TokenNotValidException).catchError((error) {
      var innerError = error as HttpException;
      showExceptionDialog(context, innerError.message);
    }, test: (error) => error is HttpException);
  }

  void goToDetails(BuildContext context, Journal? journal) {
    Journal innerJournal = journal ??
        Journal(
            id: const Uuid().v1(),
            content: "",
            createdAt: showedDate,
            updatedAt: showedDate,
            userId: userId);

    if (journal != null) {
      journal = innerJournal;
    }

    Map<String, dynamic> map = {};
    map['journal'] = innerJournal;
    map['is_editing'] = journal?.content != null;
    map['token'] = token;
    map['userId'] = userId;

    print(journal?.content != null);

    Navigator.pushNamed(context, "add-journal", arguments: map).then((value) {
      if (value != null && value == true) {
        refresh();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Registro feito com sucesso!"),
          backgroundColor: Colors.green,
        ));
      }
    });
  }

}
