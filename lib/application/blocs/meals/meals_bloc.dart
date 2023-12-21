import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nibbles_ecommerce/models/meal.dart';
import 'package:nibbles_ecommerce/repositories/meals_repos/base_meals_repo.dart';
import 'package:nibbles_ecommerce/repositories/meals_repos/meal_repo.dart';

part 'meals_event.dart';

part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final BaseMealRepository _mealsRepo;

  StreamSubscription? _mealsSubscription;

  MealsBloc({
    required MealsRepo mealsRepo,
  })  : _mealsRepo = mealsRepo,
        super(MealsLoading()) {
    on<LoadMealsByCategory>(_mapLoadMealsByCatToState);
    on<UpdateMeals>(_mapUpdateMealsToState);
    on<LoadAllMeals>(_mapLoadAllMealsToState);
  }

  FutureOr<void> _mapUpdateMealsToState(
      UpdateMeals event, Emitter<MealsState> emit) async {
    emit(MealsLoaded(meals: event.meals));
  }

  FutureOr<void> _mapLoadAllMealsToState(
      LoadAllMeals event, Emitter<MealsState> emit) async {
    _mealsSubscription?.cancel();
    _mealsSubscription = _mealsRepo.getAllMeals().listen(
      (meals) {
        add(
          UpdateMeals(meals),
        );
      },
    );
  }

  FutureOr<void> _mapLoadMealsByCatToState(
      LoadMealsByCategory event, Emitter<MealsState> emit) async {
    _mealsSubscription?.cancel();
    _mealsSubscription = _mealsRepo.getMealsByCategory(event.categoryId).listen(
      (meals) {
        add(
          UpdateMeals(meals),
        );
      },
    );
  }

}
