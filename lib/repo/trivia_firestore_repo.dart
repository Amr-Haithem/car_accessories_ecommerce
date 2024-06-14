import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../models/trivia.dart';
import '../services/firestore/general_crud_firestore.dart';

class TriviaFirestoreRepo {
  GeneralCrudFirestore _generalCrudFirestore = GeneralCrudFirestore();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  getNextTriviumFromACertainCategory(
      {required String categoryId,
      required int? lastIdInCategory,
      required String textToSearchBy,
      required int limit}) async {
    var data = await _generalCrudFirestore
        .generalGetInAppCollectionInAppCollectionWithStartAfterAndLimit(
            firstCollectionName: AppFirestoreCollections.categoriesCollection,
            secondCollectionName: AppFirestoreCollections.triviumCollection,
            firstDocId: categoryId,
            attributeNameToOrderBy: "id",
            valueToStartAfter: lastIdInCategory,
            limit: limit);

    if (data.docs.isEmpty) {
      return null;
    } else {
      List trivium = data.docs.map((e) => Trivia.fromMap(e.data())).toList();

      return trivium;
    }
  }

//edit added nullable to this type
  Future<int?> getTriviumCountOfSingleCategory(
      {required String categoryId}) async {
    var data = await _firebaseFirestore
        .collection(AppFirestoreCollections.categoriesCollection)
        .doc(categoryId)
        .collection(AppFirestoreCollections.triviumCollection)
        .count()
        .get();

    return data.count;
  }

  Future<void> setTriviaToCategory(
      {required String categoryId, required Trivia trivia}) async {
    _generalCrudFirestore.generalSetdocInAppCollectionInAppCollection(
        firstCollectionName: AppFirestoreCollections.categoriesCollection,
        secondCollectionName: AppFirestoreCollections.triviumCollection,
        firstDocId: categoryId,
        secondDocId: trivia.id.toString(),
        docData: trivia.toMap());
  }
  

  Future<List<Trivia>> getTriviumFromSearchedText(
      {required String textToSearchBy, required String categoryId}) async {
    var dataSnapshot = await _firebaseFirestore
        .collection(AppFirestoreCollections.categoriesCollection)
        .doc(categoryId)
        .collection(AppFirestoreCollections.triviumCollection)
        .where('triviaText', isGreaterThanOrEqualTo: textToSearchBy)
        .where('triviaText', isLessThanOrEqualTo: '$textToSearchBy\uf8ff')
        .get();
    List<Trivia> trivium = [];
    for (var doc in dataSnapshot.docs) {
      trivium.add(Trivia.fromMap(doc.data()));
    }

    return trivium;
  }
}
