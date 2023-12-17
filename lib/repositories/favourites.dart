import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nibbles_ecommerce/models/meal.dart';

class FavoriteMealsRepository {
  final FirebaseFirestore _firebaseFirestore;

  FavoriteMealsRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<void> addFavoriteMeal(String userId, MealModel meal) async {
    final userDocRef = _firebaseFirestore.collection('favouritemeals').doc(userId);

    return _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocRef);

      if (snapshot.exists) {
        final currentFavoriteMeals = List.from(snapshot.get('meals') ?? []);
        if (!currentFavoriteMeals.contains(meal.id)) {
          currentFavoriteMeals.add(meal.id);
        }

        transaction.update(userDocRef, {'meals': currentFavoriteMeals});
      } else {
        transaction.set(userDocRef, {'meals': [meal.id]});
      }
    });
  }

  Future<void> removeFavoriteMeal(String userId, String mealId) async {
    final userDocRef = _firebaseFirestore.collection('favouritemeals').doc(userId);

    return _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocRef);

      if (snapshot.exists) {
        final currentFavoriteMeals = List.from(snapshot.get('meals') ?? []);
        currentFavoriteMeals.remove(mealId);

        transaction.update(userDocRef, {'meals': currentFavoriteMeals});
      }
    });
  }

  Future<List<MealModel>> getFavoriteMeals(String userId) async {
    final userDocRef = _firebaseFirestore.collection('favouritemeals').doc(userId);

    final snapshot = await userDocRef.get();

    if (snapshot.exists) {
      final mealIds = List<String>.from(snapshot.get('meals') ?? []);
      final List<MealModel> favoriteMeals = [];

      for (final mealId in mealIds) {
        final mealDoc = await _firebaseFirestore.collection('meals').doc(mealId).get();
        if (mealDoc.exists) {
          favoriteMeals.add(MealModel.fromSnapShot(mealDoc));
        }
      }

      return favoriteMeals;
    } else {
      return [];
    }
  }

  Future<bool> isMealFavorite(String userId, String mealId) async {
    final userDocRef = _firebaseFirestore.collection('favouritemeals').doc(userId);
    final snapshot = await userDocRef.get();

    if (snapshot.exists) {
      final mealIds = List<String>.from(snapshot.get('meals') ?? []);
      return mealIds.contains(mealId);
    } else {
      return false;
    }
  }
}
