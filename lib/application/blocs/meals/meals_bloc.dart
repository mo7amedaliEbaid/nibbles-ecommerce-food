import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:nibbles_ecommerce/models/meal.dart';
import 'package:nibbles_ecommerce/repositories/meals_repos/meal_repo.dart';

part 'meals_event.dart';

part 'meals_state.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final MealsRepo _mealsRepo;

   final String categoryId;
  StreamSubscription? _mealsSubscription;

  MealsBloc({
    required MealsRepo mealsRepo,
    required this.categoryId
  })  : _mealsRepo = mealsRepo,
        super(MealsLoading()) {
    on<LoadMeals>(_mapLoadMealsToState);
    on<UpdateMeals>(_mapUpdateMealsToState);
  }

  FutureOr<void> _mapUpdateMealsToState(
      UpdateMeals event, Emitter<MealsState> emit) async {
    emit(MealsLoaded(meals: event.meals));
  }

  FutureOr<void> _mapLoadMealsToState(
      LoadMeals event, Emitter<MealsState> emit) async {
    _mealsSubscription?.cancel();
    _mealsSubscription = _mealsRepo.getMealsByCategory(categoryId).listen(
      (meals) {
        add(
          UpdateMeals(meals),
        );
      },
    );
  }
}
