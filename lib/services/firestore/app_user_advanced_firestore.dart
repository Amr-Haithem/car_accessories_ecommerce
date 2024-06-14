import 'package:cloud_firestore/cloud_firestore.dart';
import 'general_crud_firestore.dart';

class AppUserAdvancedFirestore {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final GeneralCrudFirestore _generalCrudFirestore = GeneralCrudFirestore();
  String appUsersCollection = AppFirestoreCollections.appUsersCollection;
  Future<QuerySnapshot<Map<String, dynamic>>> getTop10AppUsers() {
    return _firebaseFirestore
        .collection(appUsersCollection)
        .orderBy("kps", descending: true)
        .limit(10)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppUsersFromIds(
      List<String> appUsersIds) {
    return _firebaseFirestore
        .collection(appUsersCollection)
        .where("id", whereIn: appUsersIds)
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>?>> getSingleAppUser(
      String uid) {
    return _generalCrudFirestore.generalGetdocInAppCollection(
        AppFirestoreCollections.appUsersCollection, uid);
  }
}
