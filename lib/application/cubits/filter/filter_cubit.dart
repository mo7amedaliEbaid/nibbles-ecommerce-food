import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/meal.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';
import '../../../repositories/meals_repos/meal_repo.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  final BaseMealRepository _mealsRepo;

  FilterCubit({required MealsRepo mealsRepo})
      : _mealsRepo = mealsRepo,
        super(FilterInitial());

  final Map<String, bool> selectedFacts = {
    'Sugar Free': false,
    'Healthy': false,
    'Cheap': false,
    'Veggie': false,
    'Fast Cook': false,
    'Cold': false,
    'Delicious': false,
    'Power Giver': false,
    'Muscle Builder': false,
    'Easy Cook': false,

    // Add more facts as needed
  };

  void resetAllFacts() {
    selectedFacts.forEach((fact, _) {
      selectedFacts[fact] = false;
    });
    emit(FilterInitial());
  }

  void toggleFact(String fact, bool selected) {
    selectedFacts[fact] = selected;
  }

  bool isFactSelected(String fact) {
    return selectedFacts[fact] ?? false;
  }

  void filterMealsByFacts(List<String> selectedFacts) async {
    try {
      emit(FilterLoading());
      _mealsRepo.getFilteredMealsByFacts(selectedFacts).listen((meals) {
        emit(FilterSuccess(meals));
      });
    } catch (e) {
      emit(FilterError(e.toString()));
    }
  }

  void filterMealsByCalorieRange(int minCalories, int maxCalories) async {
    try {
      emit(FilterLoading());
      _mealsRepo
          .getFilteredMealsByCalorieRange(minCalories, maxCalories)
          .listen((meals) {
        emit(FilterSuccess(meals));
      });
    } catch (e) {
      emit(FilterError(e.toString()));
    }
  }
}
