// States

part of 'fav_meals_cubit.dart';

abstract class FavoriteMealsState extends Equatable {
  const FavoriteMealsState();

  @override
  List<Object> get props => [];
}

class FavoriteMealsInitial extends FavoriteMealsState {}

class FavoriteMealsLoaded extends FavoriteMealsState {
  final List<MealModel> favoriteMeals;

  const FavoriteMealsLoaded(this.favoriteMeals);

  @override
  List<Object> get props => [favoriteMeals];
}

class FavoriteMealsError extends FavoriteMealsState {
  final String message;

  const FavoriteMealsError(this.message);

  @override
  List<Object> get props => [message];
}