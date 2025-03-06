import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/kid.dart';

part 'base_kid_repo.dart';

class KidsRepository extends BaseKidsRepository {
  final CollectionReference kidsCollection =
      FirebaseFirestore.instance.collection('kids');

  @override
  Future<void> addKid(Kid kid) async {
    await kidsCollection.doc().set(kid.toDocument());
  }

  @override
  Stream<List<Kid>> getKids(String userId) {
    return kidsCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Kid.fromSnapshot(doc)).toList();
    });
  }
}
