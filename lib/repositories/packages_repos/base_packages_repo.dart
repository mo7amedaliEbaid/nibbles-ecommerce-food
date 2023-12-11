import 'package:nibbles_ecommerce/models/package.dart';

abstract class BasePackagesRepository {
  Stream<List<PackageModel>> getAllPackages();
  Stream<List<PackageModel>> getPackagesByName(String name);
}
