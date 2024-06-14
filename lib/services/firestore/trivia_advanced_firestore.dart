// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:wanas/3_data/firebase/firestore/general_crud_firestore.dart';

// class TriviaAdvancedFirestore {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   final String _triviumCollection = AppFirestoreCollections.triviumCollection;
//   final String _categoriesCollection =
//       AppFirestoreCollections.categoriesCollection;
//   Future<QuerySnapshot<Map<String, dynamic>>>
//       getOrderedListOfTriviumFromCategory(
//           {required int? idOfLastOpenedDocument,
//           required String categoryId,
//           required int length}) {
//     if (idOfLastOpenedDocument != null) {
//       return _firebaseFirestore
//           .collection(_categoriesCollection)
//           .doc(categoryId)
//           .collection(_triviumCollection)
//           .orderBy("id")
//           .startAfter([idOfLastOpenedDocument])
//           .limit(length)
//           .get();
//     } else {
//       return _firebaseFirestore
//           .collection(_categoriesCollection)
//           .doc(categoryId)
//           .collection(_triviumCollection)
//           .orderBy("id")
//           .limit(length)
//           .get();
//     }
//   }

//   Future<QuerySnapshot<Map<String, dynamic>>>
//       getRandomListOfTriviumFromCategory(
//           {required String categoryId, required int length}) async {
//     // String randomId = categoryIds[Random().nextInt(categoryIds.length)];
//     // will be used again
//     int totalTriviumCount = (await _firebaseFirestore
//             .collection(_categoriesCollection)
//             .doc(categoryId)
//             .collection(_triviumCollection)
//             .count()
//             .get())
//         .count;

//     List<int> selectedIndices = [];
//     for (var i = 0; i < length; i++) {
//       selectedIndices.add(Random().nextInt(totalTriviumCount));
//     }

//     return _firebaseFirestore
//         .collection(_categoriesCollection)
//         .doc(categoryId)
//         .collection(_triviumCollection)
//         .where("id", whereIn: selectedIndices)
//         .get();
//   }
// }
