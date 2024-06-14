import '../models/general_data.dart';
import '../services/firestore/general_crud_firestore.dart';

class GeneralDataFirestoreRepo {
  GeneralCrudFirestore generalCrudFirestore = GeneralCrudFirestore();

  Future<GeneralData> getGeneralData() async {
    try {
      var snapshot = await generalCrudFirestore.generalGetdocInAppCollection(
          AppFirestoreCollections.generalAppDataCollection,
          AppFirestoreCollections.generalAppDataCollection);
      print("got the snapshot");
      return GeneralData.fromMap(snapshot.data() as Map<String, dynamic>);
    } catch (e) {
      print("error in getting general data");
      print(e);
      return GeneralData(
        clicksUntilAd: 5,
        triviumQueryLimit: 20,
        funFactsQueryLimit: 15,
        charactersQueryLimit: 3,
        triviaTimeInSeconds: 60,
        deductedTimeEvery10Trivium: 5,
        lowerBoundTriviaTimeInSeconds: 30,
        singleTriviaScore: 10,
        charactersQueriesNumbers: 5,
        funFactQueriesNumbers: 8,
        scoreFactorIncreaseWithEvery10Trivium: 1.5,
      );
    }
  }

  Future<void> setGeneralData(GeneralData generalData) {
    return generalCrudFirestore.generalSetdocInAppCollection(
        AppFirestoreCollections.generalAppDataCollection,
        AppFirestoreCollections.generalAppDataCollection,
        generalData.toMap());
  }
}
