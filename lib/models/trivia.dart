// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum AllAnswers { firstAnswer, secondAnswer, thirdAnswer, fourthAnswer }

class Trivia {
  int? id;
  final String triviaText;
  final String categoryId;
  final String firstAnswer;
  final String secondAnswer;
  final String thirdAnswer;
  final String fourthAnswer;
  final AllAnswers rightAnswer;
   String? triviaImageLink;
  Trivia({
    required this.id,
    required this.triviaText,
    required this.categoryId,
    required this.firstAnswer,
    required this.secondAnswer,
    required this.thirdAnswer,
    required this.fourthAnswer,
    required this.rightAnswer,
    this.triviaImageLink,
  });

  Trivia copyWith({
    int? id,
    String? triviaText,
    String? categoryId,
    String? firstAnswer,
    String? secondAnswer,
    String? thirdAnswer,
    String? fourthAnswer,
    AllAnswers? rightAnswer,
    String? triviaImageLink,
  }) {
    return Trivia(
      id: id ?? this.id,
      triviaText: triviaText ?? this.triviaText,
      categoryId: categoryId ?? this.categoryId,
      firstAnswer: firstAnswer ?? this.firstAnswer,
      secondAnswer: secondAnswer ?? this.secondAnswer,
      thirdAnswer: thirdAnswer ?? this.thirdAnswer,
      fourthAnswer: fourthAnswer ?? this.fourthAnswer,
      rightAnswer: rightAnswer ?? this.rightAnswer,
      triviaImageLink: triviaImageLink ?? this.triviaImageLink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'triviaText': triviaText,
      'categoryId': categoryId,
      'firstAnswer': firstAnswer,
      'secondAnswer': secondAnswer,
      'thirdAnswer': thirdAnswer,
      'fourthAnswer': fourthAnswer,
      'rightAnswer': rightAnswer.index,
      'triviaImageLink': triviaImageLink,
    };
  }

  factory Trivia.fromMap(Map<String, dynamic> map) {
    return Trivia(
      id: map['id'] as int,
      triviaText: map['triviaText'] as String,
      categoryId: map['categoryId'] as String,
      firstAnswer: map['firstAnswer'] as String,
      secondAnswer: map['secondAnswer'] as String,
      thirdAnswer: map['thirdAnswer'] as String,
      fourthAnswer: map['fourthAnswer'] as String,
      rightAnswer: AllAnswers.values[map['rightAnswer'] as int],
      triviaImageLink: map['triviaImageLink'] != null
          ? map['triviaImageLink'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Trivia.fromJson(String source) =>
      Trivia.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Trivia(id: $id, triviaText: $triviaText, categoryId: $categoryId, firstAnswer: $firstAnswer, secondAnswer: $secondAnswer, thirdAnswer: $thirdAnswer, fourthAnswer: $fourthAnswer, rightAnswer: $rightAnswer, triviaImageLink: $triviaImageLink)';
  }

  @override
  bool operator ==(covariant Trivia other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.triviaText == triviaText &&
        other.categoryId == categoryId &&
        other.firstAnswer == firstAnswer &&
        other.secondAnswer == secondAnswer &&
        other.thirdAnswer == thirdAnswer &&
        other.fourthAnswer == fourthAnswer &&
        other.rightAnswer == rightAnswer &&
        other.triviaImageLink == triviaImageLink;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        triviaText.hashCode ^
        categoryId.hashCode ^
        firstAnswer.hashCode ^
        secondAnswer.hashCode ^
        thirdAnswer.hashCode ^
        fourthAnswer.hashCode ^
        rightAnswer.hashCode ^
        triviaImageLink.hashCode;
  }
}
