import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/fun_fact.dart';
import '../services/firestore/general_crud_firestore.dart';

class FunFactFirestoreRepo {
  final GeneralCrudFirestore _generalCrudFirestore = GeneralCrudFirestore();
  Future<List<FunFact>> getNextFunFactsWithGivenLastUsedId(
      {required String? lastId,
      required int limit,
      required String textToSearchBy}) async {
    //if last id is null it will get from the start of collection

    QuerySnapshot<Map<String, dynamic>> data;

    data = await _generalCrudFirestore.generalGetWithStartAfterAndLimit(
        collectionName: AppFirestoreCollections.funFactsCollection,
        attributeNameToOrderBy: "id",
        valueToStartAfter: lastId,
        limit: limit);

    if (data.docs.isEmpty) {
      return [];
    } else {
      List<FunFact> funFacts =
          data.docs.map((e) => FunFact.fromMap(e.data())).toList();

      return funFacts;
    }
  }

  Future<void> setFunFact(FunFact funFact) {
    return _generalCrudFirestore.generalSetdocInAppCollection(
        AppFirestoreCollections.funFactsCollection,
        funFact.id!,
        funFact.toMap());
  }

  Future<void> getFunFactsCount() {
    return _generalCrudFirestore.getDocumentsCountOfSingleCollection(
        collectionName: AppFirestoreCollections.funFactsCollection);
  }

  Future<List<FunFact>> searchByTextInFunFacts(
      {required String textToSearchBy}) async {
    //if last id is null it will get from the start of collection
    var data = await _generalCrudFirestore.generalSearchByTextInAppCollection(
        textToSearchBy: textToSearchBy,
        attributeNameToSearchIn: "content",
        collectionName: AppFirestoreCollections.funFactsCollection);

    if (data.docs.isEmpty) {
      return [];
    } else {
      List<FunFact> funFacts =
          data.docs.map((e) => FunFact.fromMap(e.data())).toList();

      return funFacts;
    }
  }
}
