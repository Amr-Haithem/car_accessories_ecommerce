// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Quote {
  final String id;
  final String content;
  final String personWhoSaidIt;
  Quote({
    required this.id,
    required this.content,
    required this.personWhoSaidIt,
  });

  Quote copyWith({
    String? id,
    String? content,
    String? personWhoSaidIt,
  }) {
    return Quote(
      id: id ?? this.id,
      content: content ?? this.content,
      personWhoSaidIt: personWhoSaidIt ?? this.personWhoSaidIt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'personWhoSaidIt': personWhoSaidIt,
    };
  }

  factory Quote.fromMap(Map<String, dynamic> map) {
    return Quote(
      id: map['id'] as String,
      content: map['content'] as String,
      personWhoSaidIt: map['personWhoSaidIt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quote.fromJson(String source) => Quote.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Quote(id: $id, content: $content, personWhoSaidIt: $personWhoSaidIt)';

  @override
  bool operator ==(covariant Quote other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.content == content &&
      other.personWhoSaidIt == personWhoSaidIt;
  }

  @override
  int get hashCode => id.hashCode ^ content.hashCode ^ personWhoSaidIt.hashCode;
}
