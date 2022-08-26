import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Comments {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Comments({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory Comments.fromMap(Map<String, dynamic> map) {
    return Comments(
      postId: map['postId'] != null ? map['postId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comments.fromJson(String source) => Comments.fromMap(json.decode(source) as Map<String, dynamic>);
}
