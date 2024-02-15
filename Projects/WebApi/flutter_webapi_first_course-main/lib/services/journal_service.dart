import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

import '../models/journal.dart';

class JournalService {
  static const String url = "http://192.168.1.4:3000";
  static const String resource = "journals";

  Future<List<Journal>> getAll(
      {required int id, required String token}) async {
    var href = "$url/users/$id/$resource";

    http.Response response = await http
        .get(Uri.parse(href), headers: {"Authorization": "Bearer $token"});

    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired"){
        throw TokenNotValidException();
      }
      throw HttpException(response.body);
    }

    List<Journal> list = [];
    List<dynamic> dynamicList = json.decode(response.body);
    dynamicList.forEach((element) {
      var journal = Journal.fromMap(element);
      list.add(journal);
    });
    print(list.length);

    return list;
  }

  Future<bool> edit(String journalId, Journal journal,
      {required int id, required String token}) async {
    String jsonJournal = json.encode({
      'id': journal.id,
      'content': journal.content,
      'created_at': journal.createdAt.toString(),
      'updated_at': journal.updatedAt.toString(),
    });


    var href = "$url/users/$id/$resource/$journalId";

    http.Response response = await http.put(
      Uri.parse(href),
      headers: {
        'Content-type': 'application/json',
        "Authorization": "Bearer $token"
      },
      body: jsonJournal,
    );

    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired"){
        throw TokenNotValidException();
      }
      throw HttpException(response.body);
    }

    return true;
  }

  Future<bool> register(Journal journal,
      {required int id, required String token}) async {
    var href = "$url/users/$id/$resource";

    http.Response response = await http.post(
      Uri.parse(href),
      headers: {
        'Content-type': 'application/json',
        "Authorization": "Bearer $token"
      },
      body: json.encode({
        'id': journal.id,
        'content': journal.content,
        'created_at': journal.createdAt.toString(),
        'updated_at': journal.updatedAt.toString(),
      }),
    );

    if (response.statusCode != 201){
      if (json.decode(response.body) == "jwt expired"){
        throw TokenNotValidException();
      }
      throw HttpException(response.body);
    }

    return true;
  }

  Future<bool> delete(String journalId,
      {required int id, required String token}) async {
    var href = "$url/$resource/$journalId";

    http.Response response = await http
        .delete(Uri.parse(href),
        headers: {"Authorization": "Bearer $token"});

    if (response.statusCode != 200) {
      if (json.decode(response.body) == "jwt expired"){
        throw TokenNotValidException();
      }
      throw HttpException(response.body);
    }

    return true;
  }

}


class TokenNotValidException implements Exception {}