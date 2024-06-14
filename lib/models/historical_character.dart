// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class HistoricalCharacter {
  final String id;
  final String name;
  final String title;
  String? imageLink;
  final List<String> facts;
  final int birthYear;
  final int? deathYear;
  HistoricalCharacter({
    required this.id,
    required this.name,
    required this.title,
    this.imageLink,
    required this.facts,
    required this.birthYear,
    this.deathYear,
  });


  HistoricalCharacter copyWith({
    String? id,
    String? name,
    String? title,
    String? imageLink,
    List<String>? facts,
    int? birthYear,
    int? deathYear,
  }) {
    return HistoricalCharacter(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      imageLink: imageLink ?? this.imageLink,
      facts: facts ?? this.facts,
      birthYear: birthYear ?? this.birthYear,
      deathYear: deathYear ?? this.deathYear,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'title': title,
      'imageLink': imageLink,
      'facts': facts,
      'birthYear': birthYear,
      'deathYear': deathYear,
    };
  }

  factory HistoricalCharacter.fromMap(Map<String, dynamic> map) {
    return HistoricalCharacter(
      id: map['id'] as String,
      name: map['name'] as String,
      title: map['title'] as String,
      imageLink: map['imageLink'] != null ? map['imageLink'] as String : null,
      facts: List<String>.from((map['facts'] as List<dynamic>)),
      birthYear: map['birthYear'] as int,
      deathYear: map['deathYear'] != null ? map['deathYear'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoricalCharacter.fromJson(String source) => HistoricalCharacter.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HistoricalCharacter(id: $id, name: $name, title: $title, imageLink: $imageLink, facts: $facts, birthYear: $birthYear, deathYear: $deathYear)';
  }

  @override
  bool operator ==(covariant HistoricalCharacter other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.title == title &&
      other.imageLink == imageLink &&
      listEquals(other.facts, facts) &&
      other.birthYear == birthYear &&
      other.deathYear == deathYear;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      title.hashCode ^
      imageLink.hashCode ^
      facts.hashCode ^
      birthYear.hashCode ^
      deathYear.hashCode;
  }
}
