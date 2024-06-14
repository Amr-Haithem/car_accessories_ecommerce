import 'dart:math';

import 'package:firebase_database/firebase_database.dart';

class NoktaFirestore {
  final DatabaseReference nokatReference =
      FirebaseDatabase.instance.ref("nokat");
  Future<DataSnapshot> getAllNokat() async {
    return await nokatReference.get();
  }

  Future<DataSnapshot?> getRandomNokta(DataSnapshot snapshot) async {
    var count = snapshot.children.length;
    if (count < 1) {
      return null;
    }
    var randomIndex = Random().nextInt(count);
    var randomData = snapshot.children.toList()[randomIndex];
    return randomData;
  }
  // Future<QuerySnapshot<Object?>> getFirstNokat() async {
  //   return NokatCollection.orderBy("id").limit(2).get();
  // }

  // Future<QuerySnapshot<Object?>> getNextNokat(last) {
  //   return NokatCollection.orderBy("id").startAfter(last["id"]).limit(2).get();
  // }
}
