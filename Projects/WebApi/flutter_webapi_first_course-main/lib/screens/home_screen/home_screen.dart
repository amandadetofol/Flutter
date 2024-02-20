import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/screens/add_new_journal_screen/add_new_journal_screen.dart';
import 'package:flutter_webapi_first_course/screens/home_screen/widgets/home_screen_list.dart';
import 'package:flutter_webapi_first_course/services/journal_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/logout.dart';
import '../../models/journal.dart';
import '../commons/dialog.dart';

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
  int? userId;
  String? userToken;

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
          IconButton(
              onPressed: () {
                refresh();
              },
              icon: Icon(Icons.refresh))
        ],
        title: Text(
          "${currentDay.day}  |  ${currentDay.month}  |  ${currentDay.year}",
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Sair"),
              leading: const Icon(Icons.logout_outlined),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
      body: ListView(
        controller: _listScrollController,
        children: generateListJournalCards(
            windowPage: windowPage,
            currentDay: currentDay,
            database: database,
            refreshFunction: refresh,
            userId: userId ?? 0,
            userToken: userToken ?? ""),
      ),
    );
  }

  void refresh() {
    SharedPreferences.getInstance().then((sharedPreferences) async {
      String? token = sharedPreferences.getString("accessToken");
      String? email = sharedPreferences.getString("email");
      int? id = sharedPreferences.getInt("id");

      if (token != null && email != null && id != null) {
        setState(() {
          userId = id;
          userToken = token;
        });

        List<Journal> journals = await service.getAll(id: id, token: token);
        setState(() {
          database = {};
          journals.forEach((element) {
            database[element.id] = element;
          });
        });
      } else {
        Navigator.pushReplacementNamed(context, "login");
      }
    }).catchError((error) {
      logout(context);
    }, test: (error) => error is TokenNotValidException).catchError((error) {
      var innerError = error as HttpException;
      showExceptionDialog(context, innerError.message);
    }, test: (error) => error is HttpException);
  }

}
