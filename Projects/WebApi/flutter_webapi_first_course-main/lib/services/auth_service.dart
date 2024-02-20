import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserNotFoundException implements Exception {}

class AuthService {
  static const String url = "http://192.168.1.4:3000/";

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
      throw HttpException(response.body);
    } else {
      _saveUserInformationsInUserDefault(response.body);
      return true;
    }
  }

  Future<bool> register(
      {required String email, required String password}) async {
    String user = json.encode({
      'email': email,
      'password': password,
    });

    http.Response response = await http.post(
      Uri.parse("${url}register"),
      headers: {'Content-type': 'application/json'},
      body: user,
    );

    if (response.statusCode != 201) {
      throw HttpException(response.body);
    }
    _saveUserInformationsInUserDefault(response.body);
    return true;
  }

  _saveUserInformationsInUserDefault(String? body) async {
    if (body == null || body.isEmpty) {
      throw Exception("Response body is empty or null");
    }

    Map<String, dynamic> map = json.decode(body);
    String? token = map["accessToken"];

    Map<String, dynamic>? user = map["user"];
    String? email = user?["email"];
    int? id = user?["id"];

    if (token == null || email == null || id == null) {
      throw Exception("Invalid response body format");
    }

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("accessToken", token);
    sharedPreferences.setString("email", email);
    sharedPreferences.setInt("id", id);
  }

}
