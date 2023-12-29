import 'package:nibbles_ecommerce/models/product.dart';

abstract class BaseProductsRepo {
  Stream<List<Product>> getAllProducts();
}
