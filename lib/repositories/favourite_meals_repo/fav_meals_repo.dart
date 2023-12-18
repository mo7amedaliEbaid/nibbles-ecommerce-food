import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/meal.dart';
import 'base_favmeals_repo.dart';

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
  Future<List<MealModel>> getFavoriteMeals(String userId) async {
    final userDocRef =
        _firebaseFirestore.collection('favouritemeals').doc(userId);

    final snapshot = await userDocRef.get();
    print('Snapshot data: ${snapshot.data()}');

    if (snapshot.exists) {
      final mealIds = List<String>.from(snapshot.get('meals') ?? []);
      print('Meal IDs: $mealIds');

      final List<MealModel> favoriteMeals = [];

      /*for (final mealId in mealIds) {
        try {
          final mealDoc =
          await _firebaseFirestore.collection('meals').where('id', isEqualTo: mealId).snapshots().;
          print('Meal Document for $mealId: ${mealDoc.data()}');

          if (mealDoc.exists) {
            favoriteMeals.add(MealModel.fromSnapShot(mealDoc));
          }
        } catch (e) {
          print('Error fetching meal with ID $mealId: $e');
        }
      }*/
     /* for (final mealId in mealIds) {
        try {
          final mealQuerySnapshot = await _firebaseFirestore
              .collection('meals')
              .where(FieldPath.documentId, isEqualTo: mealId)
              .get();

          if (mealQuerySnapshot.docs.isNotEmpty) {
            final mealDoc = mealQuerySnapshot.docs.first;
            print('Meal Document for $mealId: ${mealDoc.data()}');

            favoriteMeals.add(MealModel.fromSnapShot(mealDoc));
          }
        } catch (e) {
          print('Error fetching meal with ID $mealId: $e');
          // Optionally, add a default or placeholder meal to favoriteMeals
        }
      }*/
     /* for (final mealId in mealIds.map((id) => id.toString())) {
        try {
          final mealQuerySnapshot = await await _firebaseFirestore
              .collection('meals')
              .where(FieldPath.documentId, whereIn: ['0', '1'])
              .get(); *//*_firebaseFirestore
              .collection('meals')
              .where(FieldPath.documentId, isEqualTo: mealId)
              .get();*//*

          if (mealQuerySnapshot.docs.isNotEmpty) {
            final mealDoc = mealQuerySnapshot.docs.first;
            print('Meal Document for $mealId: ${mealDoc.data()}');

            favoriteMeals.add(MealModel.fromSnapShot(mealDoc));
          }
        } catch (e) {
          print('Error fetching meal with ID $mealId: $e');
          // Optionally, add a default or placeholder meal to favoriteMeals
        }
      }*/
      for (final mealId in mealIds) {
        try {
          final mealDoc = await _firebaseFirestore
              .collection('meals')
              .doc(mealId)  // Use doc() instead of where()
              .get();

          print('Meal Document for $mealId: ${mealDoc.data()}');

          if (mealDoc.exists) {
            favoriteMeals.add(MealModel.fromSnapShot(mealDoc));
          }
        } catch (e) {
          print('Error fetching meal with ID $mealId: $e');
        }
      }
      print('Favorite Meals: $favoriteMeals');
      return favoriteMeals;
    } else {
      print('User document does not exist.');
      return [];
    }
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
