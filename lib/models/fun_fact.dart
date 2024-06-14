// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FunFact {
  final String id;
  final String content;
  FunFact({
    required this.id,
    required this.content,
  });

  FunFact copyWith({
    String? id,
    String? content,
  }) {
    return FunFact(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
    };
  }

  factory FunFact.fromMap(Map<String, dynamic> map) {
    return FunFact(
      id: map['id'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FunFact.fromJson(String source) =>
      FunFact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FunFact(id: $id, content: $content)';

  @override
  bool operator ==(covariant FunFact other) {
    if (identical(this, other)) return true;

    return other.id == id && other.content == content;
  }

  @override
  int get hashCode => id.hashCode ^ content.hashCode;
}
