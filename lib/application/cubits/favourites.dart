import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nibbles_ecommerce/models/meal.dart';

import '../../repositories/favourites.dart';

// States
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

// Events
abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class LoadFavorites extends FavoritesEvent {}

class ToggleFavorite extends FavoritesEvent {
  final String userId;
  final MealModel meal;

  const ToggleFavorite(this.userId, this.meal);

  @override
  List<Object> get props => [userId, meal];
}

// Cubit
class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoriteMealsRepository _repository;

  FavoritesCubit(this._repository) : super(FavoritesInitial());

  void loadFavorites(String userId) async {
    try {
      final favoriteMeals = await _repository.getFavoriteMeals(userId);
      emit(FavoritesLoaded(favoriteMeals));
    } catch (e) {
      emit(FavoritesError('Error loading favorite meals: $e'));
    }
  }

  void toggleFavorite(String userId, MealModel meal) async {
    final isFavorite = await _repository.isMealFavorite(userId, meal.id);

    if (isFavorite) {
      await _repository.removeFavoriteMeal(userId, meal.id);
    } else {
      await _repository.addFavoriteMeal(userId, meal);
    }

    loadFavorites(userId);
  }
}
