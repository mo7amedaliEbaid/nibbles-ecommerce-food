import '../../models/meal.dart';

abstract class BaseFavoriteMealsRepository {
  Future<void> addFavoriteMeal(String userId, MealModel meal);

  Future<void> removeFavoriteMeal(String userId, String mealId);

  Future<List<MealModel>> getFavoriteMeals(String userId);

  Future<bool> isMealFavorite(String userId, String mealId);
}
