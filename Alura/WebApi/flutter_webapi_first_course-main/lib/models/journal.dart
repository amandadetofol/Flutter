import 'package:uuid/uuid.dart';

class Journal {
  String id;
  String content;
  DateTime createdAt;
  DateTime updatedAt;

  Journal({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  Journal.fromMap(Map<String,dynamic> map):
        id = map["id"],
        content = map["content"],
        createdAt = DateTime.parse(map["created_at"]),
        updatedAt = DateTime.parse(map["updated_at"]);

  Journal.empty()
      : id = Uuid().v1(),
        content = "",
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  @override
  String toString() {
    return "$content \ncreated_at: $createdAt\nupdated_at:$updatedAt";
  }
}