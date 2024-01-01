// Cubit
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/meal.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';
import '../../../repositories/favourite_meals_repo/fav_meals_repo.dart';

part 'fav_meals_state.dart';

class FavoriteMealsCubit extends Cubit<FavoriteMealsState> {
  final BaseFavoriteMealsRepository _repository;
  StreamSubscription? _streamSubscription;

  FavoriteMealsCubit(this._repository) : super(FavoriteMealsInitial());

  Future<void> loadFavorites(String userId) async {
    try {
      _streamSubscription?.cancel();
      _streamSubscription = _repository.getFavoriteMeals(userId).listen(
        (meals) {
          emit(
            FavoriteMealsLoaded(meals),
          );
        },
      );
    } catch (e) {
      emit(FavoriteMealsError('Error loading favorite meals: $e'));
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
