import '../models/historical_character.dart';
import '../services/firestore/general_crud_firestore.dart';

class HistoricalCharactersFirestoreRepo {
  final GeneralCrudFirestore _generalCrudFirestore = GeneralCrudFirestore();

  Future<List<HistoricalCharacter>>
      getNextHistoricalCharactersWithGivenLastUsedId(
          {required String? lastId, required int limit}) async {
    //if last id is null it will get from the start of collection

    var data = await _generalCrudFirestore.generalGetWithStartAfterAndLimit(
        collectionName: AppFirestoreCollections.historicalCharactersCollection,
        attributeNameToOrderBy: "id",
        valueToStartAfter: lastId,
        limit: limit);
    if (data.docs.isEmpty) {
      return [];
    } else {
      List<HistoricalCharacter> historicalCharacters =
          data.docs.map((e) => HistoricalCharacter.fromMap(e.data())).toList();

      return historicalCharacters;
    }
  }

  Future<List<HistoricalCharacter>> searchByTextInHistoricalCharacters({
    required String textTosearchBy,
    required String attributeNameToSearchIn,
  }) async {
    var data = await _generalCrudFirestore.generalSearchByTextInAppCollection(
        textToSearchBy: textTosearchBy,
        attributeNameToSearchIn: attributeNameToSearchIn,
        collectionName: AppFirestoreCollections.historicalCharactersCollection);
    List<HistoricalCharacter> historicalCharacters = [];
    for (var doc in data.docs) {
      historicalCharacters.add(HistoricalCharacter.fromMap(doc.data()));
    }
    return historicalCharacters;
  }

  Future<void> setHistoricalCharacter(HistoricalCharacter historicalCharacter) {
    return _generalCrudFirestore.generalSetdocInAppCollection(
        AppFirestoreCollections.historicalCharactersCollection,
        historicalCharacter.id,
        historicalCharacter.toMap());
  }

  Future<void> getHistoricalCharacterCollectionCount() {
    return _generalCrudFirestore.getDocumentsCountOfSingleCollection(
      collectionName: AppFirestoreCollections.historicalCharactersCollection,
    );
  }
}
