part of 'fav_meals_repo.dart';

abstract class BaseFavoriteMealsRepository {
  Future<void> addFavoriteMeal(String userId, MealModel meal);

  Future<void> removeFavoriteMeal(String userId, String mealId);

  Stream<List<MealModel>> getFavoriteMeals(String userId);

  Future<bool> isMealFavorite(String userId, String mealId);
}
