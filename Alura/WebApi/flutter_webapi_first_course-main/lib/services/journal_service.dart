import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

import '../models/journal.dart';

class JournalService {

  static const String url = "http://192.168.1.5:3000/";
  static const String resource = "journals";

  String getUrl(){
      return "$url$resource";
  }

  Future<List<Journal>> getAll() async {
    http.Response response = await http.get(Uri.parse(getUrl()));
    if (response.statusCode != 200) {
      throw Exception("Api call failed!");
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

  Future<bool> register(Journal journal) async {
    http.Response response = await http.post(
        Uri.parse(getUrl()),
        headers: {'Content-type': 'application/json'},
        body: json.encode({
          'id': journal.id,
          'content': journal.content,
          'created_at': journal.createdAt.toString(),
          'updated_at': journal.updatedAt.toString(),
        }),
    );
    print(response);
    print(response.statusCode);
    print(response.body);
    return response.statusCode == 201;

  }

}
