import 'package:nibbles_ecommerce/models/meal.dart';

abstract class BaseMealRepository {
  Stream<List<MealModel>> getMealsByCategory(String categoryId);
}
