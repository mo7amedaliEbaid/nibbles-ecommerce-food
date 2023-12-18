// Cubit
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/meal.dart';
import '../../../repositories/favourite_meals_repo/fav_meals_repo.dart';

part 'fav_meals_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoriteMealsRepository _repository;
  StreamSubscription? _streamSubscription;

  FavoritesCubit(this._repository) : super(FavoritesInitial());

  Future<void> loadFavorites(String userId) async {
    try {
      _streamSubscription?.cancel();
      _streamSubscription = _repository.getFavoriteMeals(userId).listen(
        (meals) {
          emit(
            FavoritesLoaded(meals),
          );
        },
      );
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
