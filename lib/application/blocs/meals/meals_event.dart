part of 'meals_bloc.dart';

@immutable
abstract class MealsEvent extends Equatable {
  const MealsEvent();

  @override
  List<Object> get props => [];
}

class LoadAllMeals extends MealsEvent {}

class LoadMealsByCategory extends MealsEvent {
  final String categoryId;

  const LoadMealsByCategory({required this.categoryId});

  @override
  List<Object> get props => [categoryId];
}

class UpdateMeals extends MealsEvent {
  final List<MealModel> meals;

  const UpdateMeals(this.meals);

  @override
  List<Object> get props => [meals];
}

