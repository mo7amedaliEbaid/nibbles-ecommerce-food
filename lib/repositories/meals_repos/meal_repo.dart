import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nibbles_ecommerce/models/meal.dart';
import 'package:nibbles_ecommerce/repositories/meals_repos/base_meals_repo.dart';

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
        .where('qrhash', isGreaterThanOrEqualTo: qrhash)
        //.where('name', isLessThan: '${name}z')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return MealModel.fromSnapShot(doc);
      }).toList();
    });
  }
}
