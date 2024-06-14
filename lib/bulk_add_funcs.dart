import 'package:car_accessories_ecommerce/models/historical_character.dart';
import 'package:car_accessories_ecommerce/repo/fun_facts_firestore_repo.dart';
import 'package:car_accessories_ecommerce/repo/quotes_firestore_repo.dart';
import 'package:car_accessories_ecommerce/repo/trivia_firestore_repo.dart';

import 'models/fun_fact.dart';
import 'models/quote.dart';
import 'models/trivia.dart';

class BulkAddFuncs {
  static TriviaFirestoreRepo triviaFirestoreRepo = TriviaFirestoreRepo();
  static QuotesFirestoreRepo quotesFirestoreRepo = QuotesFirestoreRepo();
  static FunFactFirestoreRepo funfactsFirestoreRepo = FunFactFirestoreRepo();

  static addTrivium(
      {required List<Trivia> trivium, required String categoryId}) async {
    for (var trivia in trivium) {
      await triviaFirestoreRepo.setTriviaToCategory(
          categoryId: categoryId, trivia: trivia);
    }
  }

  static addQuotes(List<Quote> quotes) async {
    for (var quote in quotes) {
      await quotesFirestoreRepo.setQuote(quote: quote);
    }
  }

  static addFunfacts(List<FunFact> funfacts) async {
    for (var funfact in funfacts) {
      await funfactsFirestoreRepo.setFunFact(funfact);
    }
  }
}
