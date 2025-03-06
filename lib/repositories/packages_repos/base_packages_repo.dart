part of 'package_repo.dart';

abstract class BasePackagesRepository {
  Stream<List<PackageModel>> getAllPackages();

  Stream<List<PackageModel>> getPackagesByName(String name);
}
