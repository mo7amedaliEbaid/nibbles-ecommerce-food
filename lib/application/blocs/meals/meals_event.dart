part of 'meals_bloc.dart';

@immutable
abstract class MealsEvent extends Equatable {
  const MealsEvent();

  @override
  List<Object> get props => [];
}

class LoadAllMeals extends MealsEvent {}

class LoadMeals extends MealsEvent {
  final String categoryId; // Add this line

  const LoadMeals({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}

class UpdateMeals extends MealsEvent {
  final List<MealModel> meals;

  const UpdateMeals(this.meals);

  @override
  List<Object> get props => [meals];
}

class SearchAllMeals extends MealsEvent {
  final String mealName;

  const SearchAllMeals({
    required this.mealName,
  });

  @override
  List<Object> get props => [mealName];
}
/*class SearchMeals extends MealsEvent {
  final String mealName;

  const SearchMeals({
    required this.mealName,
  });

  @override
  List<Object> get props => [mealName];
}*/
