import '../models/general_data.dart';
import '../models/quote.dart';
import '../services/firestore/general_crud_firestore.dart';

class QuotesFirestoreRepo {
  final GeneralCrudFirestore _generalCrudFirestore = GeneralCrudFirestore();


  Future<List<Quote>> getNextQuotesWithGivenLastUsedId(
      {required String? lastId, required int limit}) async {
    //if last id is null it will get from the start of collection
    var data = await _generalCrudFirestore.generalGetWithStartAfterAndLimit(
        collectionName: AppFirestoreCollections.quotesCollection,
        attributeNameToOrderBy: "id",
        valueToStartAfter: lastId,
        limit: limit);
    List<Quote> quotes = [];
    for (var doc in data.docs) {
      quotes.add(Quote.fromMap(doc.data()));
    }

    return quotes;
  }

  Future<List<Quote>> searchByTextInQuotes(
    String textToSearchBy,
    String attributeNameToSearchIn,
  ) async {
    var data = await _generalCrudFirestore.generalSearchByTextInAppCollection(
        textToSearchBy: textToSearchBy,
        attributeNameToSearchIn: attributeNameToSearchIn,
        collectionName: AppFirestoreCollections.quotesCollection);
    List<Quote> quotes = [];
    for (var doc in data.docs) {
      quotes.add(Quote.fromMap(doc.data()));
    }

    return quotes;
  }

  Future<void> setQuote({
    required Quote quote,
  }) async {
    return _generalCrudFirestore.generalSetdocInAppCollection(
        AppFirestoreCollections.quotesCollection, quote.id, quote.toMap());
  }
}
