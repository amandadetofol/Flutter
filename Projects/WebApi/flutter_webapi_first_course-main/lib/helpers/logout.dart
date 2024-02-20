
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

logout(BuildContext context) {
  SharedPreferences.getInstance().then((sharedPreferences) {
    sharedPreferences.clear();
    Navigator.pushReplacementNamed(context, "login");
  });
}