import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nibbles_ecommerce/models/meal.dart';

part 'base_meals_repo.dart';

class MealsRepo extends BaseMealRepository {
  final FirebaseFirestore _firebaseFirestore;

  MealsRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<MealModel>> getAllMeals() {
    return _firebaseFirestore.collection('meals').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return MealModel.fromSnapShot(doc);
      }).toList();
    });
  }

  @override
  Stream<List<MealModel>> getMealsByCategory(String categoryId) {
    return _firebaseFirestore
        .collection('meals')
        .where('categoryid', isEqualTo: categoryId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return MealModel.fromSnapShot(doc);
      }).toList();
    });
  }

  @override
  Stream<List<MealModel>> getMealsByName(String name) {
    return _firebaseFirestore
        .collection('meals')
        .where('name', isGreaterThanOrEqualTo: name)
        .where('name', isLessThan: '${name}z')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return MealModel.fromSnapShot(doc);
      }).toList();
    });
  }

  @override
  Stream<List<MealModel>> getMealsByQrCode(String qrhash) {
    return _firebaseFirestore
        .collection('meals')
        .where('qrhash', isEqualTo: qrhash)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return MealModel.fromSnapShot(doc);
      }).toList();
    });
  }

  @override
  Stream<List<MealModel>> getFilteredMealsByCalorieRange(
      int minCalories, int maxCalories) {
    return _firebaseFirestore
        .collection('meals')
        .where('calories',
            isGreaterThanOrEqualTo: minCalories.toString().padLeft(5, '0'))
        .where('calories',
            isLessThanOrEqualTo: maxCalories.toString().padLeft(5, '0'))
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => MealModel.fromSnapShot(doc))
            .toList());
  }

  @override
  Stream<List<MealModel>> getFilteredMealsByFacts(List<String> selectedFacts) {
    // Implement the logic to filter meals by facts in your repository
    // Use FirebaseFirestore and where clause to filter based on selectedFacts
    return _firebaseFirestore
        .collection('meals')
        .where('facts', arrayContainsAny: selectedFacts)
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => MealModel.fromSnapShot(doc))
            .toList());
  }
}
