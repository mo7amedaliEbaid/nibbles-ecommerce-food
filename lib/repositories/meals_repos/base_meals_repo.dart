part of 'meal_repo.dart';

abstract class BaseMealRepository {
  Stream<List<MealModel>> getAllMeals();

  Stream<List<MealModel>> getMealsByCategory(String categoryId);

  Stream<List<MealModel>> getMealsByName(String name);

  Stream<List<MealModel>> getMealsByQrCode(String qrhash);

  Stream<List<MealModel>> getFilteredMealsByCalorieRange(
      int minCalories, int maxCalories);

  Stream<List<MealModel>> getFilteredMealsByFacts(List<String> selectedFacts);
}
