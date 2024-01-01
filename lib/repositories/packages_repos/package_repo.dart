import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nibbles_ecommerce/models/package.dart';

part 'base_packages_repo.dart';

class PackagesRepos extends BasePackagesRepository {
  final FirebaseFirestore _firebaseFirestore;

  PackagesRepos({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<PackageModel>> getAllPackages() {
    return _firebaseFirestore
        .collection('packages')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return PackageModel.fromSnapShot(doc);
      }).toList();
    });
  }

  @override
  Stream<List<PackageModel>> getPackagesByName(String name) {
    return _firebaseFirestore
        .collection('packages')
        .where('name', isGreaterThanOrEqualTo: name)
        .where('name', isLessThan: '${name}z')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return PackageModel.fromSnapShot(doc);
      }).toList();
    });
  }
}
