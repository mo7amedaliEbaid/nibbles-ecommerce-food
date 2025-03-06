import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nibbles_ecommerce/models/info.dart';

part 'base_info_repo.dart';

class InfoRepo extends BaseInfoRepository {
  final FirebaseFirestore _firebaseFirestore;

  InfoRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<NibblesInfo> getAboutInfo() {
    return _firebaseFirestore
        .collection('info')
        .doc("about")
        .snapshots()
        .map((snap) => NibblesInfo.fromSnapshot(snap));
  }

  @override
  Stream<NibblesInfo> getPrivacyInfo() {
    return _firebaseFirestore
        .collection('info')
        .doc("privacy")
        .snapshots()
        .map((snap) => NibblesInfo.fromSnapshot(snap));
  }

  @override
  Stream<NibblesInfo> getTermsInfo() {
    return _firebaseFirestore
        .collection('info')
        .doc("terms")
        .snapshots()
        .map((snap) => NibblesInfo.fromSnapshot(snap));
  }
}
