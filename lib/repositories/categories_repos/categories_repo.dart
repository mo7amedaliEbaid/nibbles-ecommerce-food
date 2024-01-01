import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nibbles_ecommerce/models/meal_category.dart';

part 'base_categories_repo.dart';

class CategoriesRepo extends BaseCategoriesRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoriesRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<MealCategory>> getAllmealcates() {
    return _firebaseFirestore
        .collection('categories')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return MealCategory.fromSnapShot(doc);
      }).toList();
    });
  }
}
