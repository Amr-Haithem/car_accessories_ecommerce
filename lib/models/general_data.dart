// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class GeneralData {
  final int clicksUntilAd;
  final int triviumQueryLimit;
  final int funFactsQueryLimit;
  final int charactersQueryLimit;
  final int triviaTimeInSeconds;
  final int deductedTimeEvery10Trivium;
  final int lowerBoundTriviaTimeInSeconds;
  final int singleTriviaScore;
  final int charactersQueriesNumbers;
  final int funFactQueriesNumbers;
  final double scoreFactorIncreaseWithEvery10Trivium;
  GeneralData({
    required this.clicksUntilAd,
    required this.triviumQueryLimit,
    required this.funFactsQueryLimit,
    required this.charactersQueryLimit,
    required this.triviaTimeInSeconds,
    required this.deductedTimeEvery10Trivium,
    required this.lowerBoundTriviaTimeInSeconds,
    required this.singleTriviaScore,
    required this.charactersQueriesNumbers,
    required this.funFactQueriesNumbers,
    required this.scoreFactorIncreaseWithEvery10Trivium,
  });

  GeneralData copyWith({
    int? clicksUntilAd,
    int? triviumQueryLimit,
    int? funFactsQueryLimit,
    int? charactersQueryLimit,
    int? triviaTimeInSeconds,
    int? deductedTimeEvery10Trivium,
    int? lowerBoundTriviaTimeInSeconds,
    int? singleTriviaScore,
    int? charactersQueriesNumbers,
    int? funFactQueriesNumbers,
    double? scoreFactorIncreaseWithEvery10Trivium,
  }) {
    return GeneralData(
      clicksUntilAd: clicksUntilAd ?? this.clicksUntilAd,
      triviumQueryLimit: triviumQueryLimit ?? this.triviumQueryLimit,
      funFactsQueryLimit: funFactsQueryLimit ?? this.funFactsQueryLimit,
      charactersQueryLimit: charactersQueryLimit ?? this.charactersQueryLimit,
      triviaTimeInSeconds: triviaTimeInSeconds ?? this.triviaTimeInSeconds,
      deductedTimeEvery10Trivium:
          deductedTimeEvery10Trivium ?? this.deductedTimeEvery10Trivium,
      lowerBoundTriviaTimeInSeconds:
          lowerBoundTriviaTimeInSeconds ?? this.lowerBoundTriviaTimeInSeconds,
      singleTriviaScore: singleTriviaScore ?? this.singleTriviaScore,
      charactersQueriesNumbers:
          charactersQueriesNumbers ?? this.charactersQueriesNumbers,
      funFactQueriesNumbers:
          funFactQueriesNumbers ?? this.funFactQueriesNumbers,
      scoreFactorIncreaseWithEvery10Trivium:
          scoreFactorIncreaseWithEvery10Trivium ??
              this.scoreFactorIncreaseWithEvery10Trivium,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clicksUntilAd': clicksUntilAd,
      'triviumQueryLimit': triviumQueryLimit,
      'funFactsQueryLimit': funFactsQueryLimit,
      'charactersQueryLimit': charactersQueryLimit,
      'triviaTimeInSeconds': triviaTimeInSeconds,
      'deductedTimeEvery10Trivium': deductedTimeEvery10Trivium,
      'lowerBoundTriviaTimeInSeconds': lowerBoundTriviaTimeInSeconds,
      'singleTriviaScore': singleTriviaScore,
      'charactersQueriesNumbers': charactersQueriesNumbers,
      'funFactQueriesNumbers': funFactQueriesNumbers,
      'scoreFactorIncreaseWithEvery10Trivium':
          scoreFactorIncreaseWithEvery10Trivium,
    };
  }

  factory GeneralData.fromMap(Map<String, dynamic> map) {
    return GeneralData(
      clicksUntilAd: map['clicksUntilAd'] as int,
      triviumQueryLimit: map['triviumQueryLimit'] as int,
      funFactsQueryLimit: map['funFactsQueryLimit'] as int,
      charactersQueryLimit: map['charactersQueryLimit'] as int,
      triviaTimeInSeconds: map['triviaTimeInSeconds'] as int,
      deductedTimeEvery10Trivium: map['deductedTimeEvery10Trivium'] as int,
      lowerBoundTriviaTimeInSeconds:
          map['lowerBoundTriviaTimeInSeconds'] as int,
      singleTriviaScore: map['singleTriviaScore'] as int,
      charactersQueriesNumbers: map['charactersQueriesNumbers'] as int,
      funFactQueriesNumbers: map['funFactQueriesNumbers'] as int,
      scoreFactorIncreaseWithEvery10Trivium:
          map['scoreFactorIncreaseWithEvery10Trivium'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneralData.fromJson(String source) =>
      GeneralData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GeneralData(clicksUntilAd: $clicksUntilAd, triviumQueryLimit: $triviumQueryLimit, funFactsQueryLimit: $funFactsQueryLimit, charactersQueryLimit: $charactersQueryLimit, triviaTimeInSeconds: $triviaTimeInSeconds, deductedTimeEvery10Trivium: $deductedTimeEvery10Trivium, lowerBoundTriviaTimeInSeconds: $lowerBoundTriviaTimeInSeconds, singleTriviaScore: $singleTriviaScore, charactersQueriesNumbers: $charactersQueriesNumbers, funFactQueriesNumbers: $funFactQueriesNumbers, scoreFactorIncreaseWithEvery10Trivium: $scoreFactorIncreaseWithEvery10Trivium)';
  }

  @override
  bool operator ==(covariant GeneralData other) {
    if (identical(this, other)) return true;

    return other.clicksUntilAd == clicksUntilAd &&
        other.triviumQueryLimit == triviumQueryLimit &&
        other.funFactsQueryLimit == funFactsQueryLimit &&
        other.charactersQueryLimit == charactersQueryLimit &&
        other.triviaTimeInSeconds == triviaTimeInSeconds &&
        other.deductedTimeEvery10Trivium == deductedTimeEvery10Trivium &&
        other.lowerBoundTriviaTimeInSeconds == lowerBoundTriviaTimeInSeconds &&
        other.singleTriviaScore == singleTriviaScore &&
        other.charactersQueriesNumbers == charactersQueriesNumbers &&
        other.funFactQueriesNumbers == funFactQueriesNumbers &&
        other.scoreFactorIncreaseWithEvery10Trivium ==
            scoreFactorIncreaseWithEvery10Trivium;
  }

  @override
  int get hashCode {
    return clicksUntilAd.hashCode ^
        triviumQueryLimit.hashCode ^
        funFactsQueryLimit.hashCode ^
        charactersQueryLimit.hashCode ^
        triviaTimeInSeconds.hashCode ^
        deductedTimeEvery10Trivium.hashCode ^
        lowerBoundTriviaTimeInSeconds.hashCode ^
        singleTriviaScore.hashCode ^
        charactersQueriesNumbers.hashCode ^
        funFactQueriesNumbers.hashCode ^
        scoreFactorIncreaseWithEvery10Trivium.hashCode;
  }
}
