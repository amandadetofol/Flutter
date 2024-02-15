import 'package:uuid/uuid.dart';

class Journal {
  String id;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;

  Journal({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.userId
  });

  Journal.fromMap(Map<String,dynamic> map):
        id = map["id"],
        content = map["content"],
        createdAt = DateTime.parse(map["created_at"]),
        userId = int.parse(map["userId"]),
        updatedAt = DateTime.parse(map["updated_at"]);

  Journal.empty({required int userId})
      : id = Uuid().v1(),
        content = "",
        userId = userId,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  @override
  String toString() {
    return "$content \ncreated_at: $createdAt\nupdated_at:$updatedAt";
  }
}
