part of 'categories_repo.dart';

abstract class BaseCategoriesRepository {
  Stream<List<MealCategory>> getAllmealcates();
}
