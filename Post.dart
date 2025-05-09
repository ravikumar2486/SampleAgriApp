// To parse this JSON data, do
//
//     final post = postFromMap(jsonString);

import 'dart:convert';

List<Post> postFromMap(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

String postToMap(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Post {
  int userId;
  int id;
  String title;
  String? body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toMap() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
