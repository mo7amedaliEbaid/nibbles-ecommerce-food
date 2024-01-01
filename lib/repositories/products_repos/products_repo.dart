import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nibbles_ecommerce/models/product.dart';

part 'base_products_repo.dart';

class ProductsRepo extends BaseProductsRepo {
  final FirebaseFirestore _firebaseFirestore;

  ProductsRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromSnapShot(doc);
      }).toList();
    });
  }
}
