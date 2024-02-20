import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import '../../helpers/logout.dart';
import '../commons/dialog.dart';

class AddNewJournalScreen extends StatelessWidget {
  final Journal journal;
  final bool isEditing;
  final String token;
  final int userId;
  final TextEditingController _contentController = TextEditingController();

  AddNewJournalScreen(
      {super.key,
      required this.journal,
      required this.isEditing,
      required this.token,
      required this.userId});

  @override
  Widget build(BuildContext context) {
    _contentController.text = journal.content;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _registerJournal(context, isEditing, id: userId, token: token);
              },
              icon: const Icon(Icons.check))
        ],
        title: Text("${WeekDay(journal.createdAt.weekday).long.toLowerCase()},"
            " ${journal.createdAt.day}/${journal.createdAt.month}/${journal.createdAt.year} "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          maxLines: null,
          expands: true,
        ),
      ),
    );
  }

  _registerJournal(BuildContext context, bool isEditing,
      {required int id, required String token}) {
    String content = _contentController.text;

    journal.content = content;

    JournalService service = JournalService();
    if (!isEditing) {
      service.register(journal, id: id, token: token).then((value) {
        Navigator.pop(context, value);
      }).catchError((error) {
        logout(context);
      }, test: (error) => error is TokenNotValidException).catchError((error) {
        var innerError = error as HttpException;
        showExceptionDialog(context, innerError.message);
      }, test: (error) => error is HttpException);
      ;
    } else {
      service.edit(journal.id, journal, id: id, token: token).then((value) {
        Navigator.pop(context, value);
      }).catchError((error) {
        logout(context);
      }, test: (error) => error is TokenNotValidException).catchError((error) {
        var innerError = error as HttpException;
        showExceptionDialog(context, innerError.message);
      }, test: (error) => error is HttpException);
    }
  }
}
