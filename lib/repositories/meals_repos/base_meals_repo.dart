import 'package:nibbles_ecommerce/models/meal.dart';

abstract class BaseMealRepository {
  Stream<List<MealModel>> getAllMeals();
  Stream<List<MealModel>> getMealsByCategory(String categoryId);
  Stream<List<MealModel>> getMealsByName(String name);
}