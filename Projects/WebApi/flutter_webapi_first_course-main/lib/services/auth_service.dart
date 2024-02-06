import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class UserNotFoundException implements Exception {}

class AuthService {

  static const String url = "http://192.168.1.7:3000/";

  Future<bool> login({required String email, required String password}) async {
    String user = json.encode({
      'email': email,
      'password': password,
    });

    http.Response response = await http.post(
      Uri.parse("${url}login"),
      headers: {'Content-type': 'application/json'},
      body: user,
    );

    if (response.statusCode != 200) {
      String data = json.decode(response.body);
      switch (data) {
        case "Cannot find user":
          throw UserNotFoundException();
      }
      return false; // Return false for unsuccessful login
    } else {
      return true; // Return true for successful login
    }
  }

  Future<bool> register({required String email, required String password}) async {
   return true;
  }

}