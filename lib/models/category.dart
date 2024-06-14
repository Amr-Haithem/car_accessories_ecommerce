// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  final String id;
  final int priority;
  final String name;
  String? imageLink;
  String? iconLink;
  final bool enabled;
  Category({
    required this.id,
    required this.priority,
    required this.name,
    this.imageLink,
    this.iconLink,
    required this.enabled,
  });
  // final bool hasAd;

  Category copyWith({
    String? id,
    int? priority,
    String? name,
    String? imageLink,
    String? iconLink,
    bool? enabled,
  }) {
    return Category(
      id: id ?? this.id,
      priority: priority ?? this.priority,
      name: name ?? this.name,
      imageLink: imageLink ?? this.imageLink,
      iconLink: iconLink ?? this.iconLink,
      enabled: enabled ?? this.enabled,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'priority': priority,
      'name': name,
      'imageLink': imageLink,
      'iconLink': iconLink,
      'enabled': enabled,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as String,
      priority: map['priority'] as int,
      name: map['name'] as String,
      imageLink: map['imageLink'] != null ? map['imageLink'] as String : null,
      iconLink: map['iconLink'] != null ? map['iconLink'] as String : null,
      enabled: map['enabled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(id: $id, priority: $priority, name: $name, imageLink: $imageLink, iconLink: $iconLink, enabled: $enabled)';
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.priority == priority &&
        other.name == name &&
        other.imageLink == imageLink &&
        other.iconLink == iconLink &&
        other.enabled == enabled;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        priority.hashCode ^
        name.hashCode ^
        imageLink.hashCode ^
        iconLink.hashCode ^
        enabled.hashCode;
  }
}
