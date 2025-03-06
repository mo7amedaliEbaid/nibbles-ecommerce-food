part of 'fav_packages_repo.dart';

abstract class BaseFavoritePackagesRepository {
  Future<void> addFavoritePackage(String userId, PackageModel packageModel);

  Future<void> removeFavoritePackage(String userId, String packageId);

  Stream<List<PackageModel>> getFavoritePackages(String userId);

  Future<bool> isPackageFavorite(String userId, String packageId);
}
