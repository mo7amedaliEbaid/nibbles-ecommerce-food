
import 'package:nibbles_ecommerce/models/meal_category.dart';


abstract class BaseCategoriesRepository {
  Stream<List<MealCategory>> getAllmealcates();
}
