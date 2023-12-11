import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nibbles_ecommerce/models/meal.dart';

import '../../../repositories/meals_repos/meal_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final MealsRepo _mealsRepo;

  SearchCubit({required MealsRepo mealsRepo})
      : _mealsRepo = mealsRepo,
        super(SearchInitial());

  void searchMeals(String query) {
    emit(SearchLoading());
    _mealsRepo.getMealsByName(query).listen(
      (meals) {
        emit(SearchSuccess(meals));
      },
      onError: (error) {
        emit(SearchFailure(error.toString()));
      },
    );
  }
}
