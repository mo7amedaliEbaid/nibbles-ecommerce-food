part of 'products_repo.dart';

abstract class BaseProductsRepo {
  Stream<List<Product>> getAllProducts();
}
