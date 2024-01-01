import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nibbles_ecommerce/models/package.dart';

part 'base_favpackages_repo.dart';

class FavoritePackagesRepository implements BaseFavoritePackagesRepository {
  final FirebaseFirestore _firebaseFirestore;

  FavoritePackagesRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addFavoritePackage(
      String userId, PackageModel packageModel) async {
    final userDocRef =
        _firebaseFirestore.collection('favouritepackages').doc(userId);

    return _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocRef);

      if (snapshot.exists) {
        final currentFavoritePackages =
            List.from(snapshot.get('packages') ?? []);
        if (!currentFavoritePackages.contains(packageModel.id)) {
          currentFavoritePackages.add(packageModel.id);
        }

        transaction.update(userDocRef, {'packages': currentFavoritePackages});
      } else {
        transaction.set(userDocRef, {
          'packages': [packageModel.id]
        });
      }
    });
  }

  @override
  Future<void> removeFavoritePackage(String userId, String packageId) async {
    final userDocRef =
        _firebaseFirestore.collection('favouritepackages').doc(userId);

    return _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocRef);

      if (snapshot.exists) {
        final currentFavoritePackages =
            List.from(snapshot.get('packages') ?? []);
        currentFavoritePackages.remove(packageId);

        transaction.update(userDocRef, {'packages': currentFavoritePackages});
      }
    });
  }

  @override
  Stream<List<PackageModel>> getFavoritePackages(String userId) async* {
    final userDocRef =
        _firebaseFirestore.collection('favouritepackages').doc(userId);

    final StreamController<List<PackageModel>> controller =
        StreamController<List<PackageModel>>();

    userDocRef.snapshots().listen((snapshot) async {
      print('Snapshot data: ${snapshot.data()}');

      if (snapshot.exists) {
        final packageIds = List<String>.from(snapshot.get('packages') ?? []);
        print('Package IDs: $packageIds');

        final List<PackageModel> favouritePackages = [];

        for (final packageId in packageIds.map((id) => id.toString())) {
          final packageQuerySnapshot = await _firebaseFirestore
              .collection('packages')
              .where('id', isEqualTo: packageId)
              .snapshots()
              .first;

          final packages = packageQuerySnapshot.docs.map((doc) {
            return PackageModel.fromSnapShot(doc);
          }).toList();

          if (packages.isNotEmpty) {
            final package = packages.first;
            print('Package Name for $packageId: ${package.name}');
            favouritePackages.add(package);
          }
        }

        print('Favorite Packages: $favouritePackages');
        controller.add(favouritePackages);
      } else {
        print('User document does not exist.');
        controller.add([]);
      }
    });

    yield* controller.stream;
  }

  @override
  Future<bool> isPackageFavorite(String userId, String packageId) async {
    final userDocRef =
        _firebaseFirestore.collection('favouritepackages').doc(userId);
    final snapshot = await userDocRef.get();

    if (snapshot.exists) {
      final packageIds = List<String>.from(snapshot.get('packages') ?? []);
      return packageIds.contains(packageId);
    } else {
      return false;
    }
  }
}
