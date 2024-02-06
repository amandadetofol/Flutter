import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/models/journal.dart';
import 'package:flutter_webapi_first_course/screens/add_new_journal_screen/add_new_journal_screen.dart';
import 'package:flutter_webapi_first_course/screens/login/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Journal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            color: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            actionsIconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white),
          ),
          textTheme: GoogleFonts.bitterTextTheme()),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: "login",
      routes: {
        "home": (context) => const HomeScreen(),
        "login": (context) => LoginScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "add-journal") {
          Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;

          final Journal journal = map['journal'] as Journal;
          final bool isEditing = map['is_editing'] as bool;

          return MaterialPageRoute(builder: (context){
            return AddNewJournalScreen(
              journal: journal,
              isEditing: isEditing);
          });
        }
        return null;
      },
    );
  }
}
