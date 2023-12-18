// States

part of 'fav_meals_cubit.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<MealModel> favoriteMeals;

  const FavoritesLoaded(this.favoriteMeals);

  @override
  List<Object> get props => [favoriteMeals];
}

class FavoritesError extends FavoritesState {
  final String message;

  const FavoritesError(this.message);

  @override
  List<Object> get props => [message];
}