import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/helpers/weekday.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';

class AddNewJournalScreen extends StatelessWidget {
  final Journal journal;
  final TextEditingController _contentController = TextEditingController();

  AddNewJournalScreen({super.key, required this.journal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(
            onPressed: () {
              _registerJournal(context);
            },
            icon: const Icon(Icons.check))],
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

  _registerJournal(BuildContext context) async {
    journal.content = _contentController.text;

    JournalService service = JournalService();
    bool succeded = await service.register(journal);

    Navigator.pop(context, succeded);
  }

}
