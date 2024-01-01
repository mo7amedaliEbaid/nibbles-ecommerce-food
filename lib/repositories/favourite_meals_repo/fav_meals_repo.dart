import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/meal.dart';

part 'base_favmeals_repo.dart';

class FavoriteMealsRepository implements BaseFavoriteMealsRepository {
  final FirebaseFirestore _firebaseFirestore;

  FavoriteMealsRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addFavoriteMeal(String userId, MealModel meal) async {
    final userDocRef =
        _firebaseFirestore.collection('favouritemeals').doc(userId);

    return _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocRef);

      if (snapshot.exists) {
        final currentFavoriteMeals = List.from(snapshot.get('meals') ?? []);
        if (!currentFavoriteMeals.contains(meal.id)) {
          currentFavoriteMeals.add(meal.id);
        }

        transaction.update(userDocRef, {'meals': currentFavoriteMeals});
      } else {
        transaction.set(userDocRef, {
          'meals': [meal.id]
        });
      }
    });
  }

  @override
  Future<void> removeFavoriteMeal(String userId, String mealId) async {
    final userDocRef =
        _firebaseFirestore.collection('favouritemeals').doc(userId);

    return _firebaseFirestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDocRef);

      if (snapshot.exists) {
        final currentFavoriteMeals = List.from(snapshot.get('meals') ?? []);
        currentFavoriteMeals.remove(mealId);

        transaction.update(userDocRef, {'meals': currentFavoriteMeals});
      }
    });
  }

  @override
  Stream<List<MealModel>> getFavoriteMeals(String userId) async* {
    final userDocRef =
        _firebaseFirestore.collection('favouritemeals').doc(userId);

    final StreamController<List<MealModel>> controller =
        StreamController<List<MealModel>>();

    userDocRef.snapshots().listen((snapshot) async {
      print('Snapshot data: ${snapshot.data()}');

      if (snapshot.exists) {
        final mealIds = List<String>.from(snapshot.get('meals') ?? []);
        print('Meal IDs: $mealIds');

        final List<MealModel> favoriteMeals = [];

        for (final mealId in mealIds.map((id) => id.toString())) {
          final mealQuerySnapshot = await _firebaseFirestore
              .collection('meals')
              .where('id', isEqualTo: mealId)
              .snapshots()
              .first;

          final meals = mealQuerySnapshot.docs.map((doc) {
            return MealModel.fromSnapShot(doc);
          }).toList();

          if (meals.isNotEmpty) {
            final meal = meals.first;
            print('Meal Description for $mealId: ${meal.description}');
            favoriteMeals.add(meal);
          }
        }

        print('Favorite Meals: $favoriteMeals');
        controller.add(favoriteMeals);
      } else {
        print('User document does not exist.');
        controller.add([]);
      }
    });

    yield* controller.stream;
  }

  @override
  Future<bool> isMealFavorite(String userId, String mealId) async {
    final userDocRef =
        _firebaseFirestore.collection('favouritemeals').doc(userId);
    final snapshot = await userDocRef.get();

    if (snapshot.exists) {
      final mealIds = List<String>.from(snapshot.get('meals') ?? []);
      return mealIds.contains(mealId);
    } else {
      return false;
    }
  }
}
