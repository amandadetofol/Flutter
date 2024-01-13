import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/database/database.dart';
import 'package:flutter_webapi_first_course/screens/add_new_journal_screen/add_new_journal_screen.dart';
import 'package:flutter_webapi_first_course/screens/home_screen/widgets/home_screen_list.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';

import '../../models/journal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // O último dia apresentado na lista
  DateTime currentDay = DateTime.now();

  // Tamanho da lista
  int windowPage = 10;

  // A base de dados mostrada na lista
  Map<String, Journal> database = {};

  JournalService service = JournalService();

  final ScrollController _listScrollController = ScrollController();

  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            refresh();
          }, icon: Icon(Icons.refresh))
        ],
        // Título basado no dia atual
        title: Text(
          "${currentDay.day}  |  ${currentDay.month}  |  ${currentDay.year}",
        ),
      ),
      body: ListView(
        controller: _listScrollController,
        children: generateListJournalCards(
          windowPage: windowPage,
          currentDay: currentDay,
          database: database,
          refreshFunction: refresh,
        ),
      ),
    );
  }

  void refresh() async {
    List<Journal> journals = await service.getAll();
    setState(() {
      database = {};
      journals.forEach((element) {
        database[element.id] = element;
      });
    });
  }
}