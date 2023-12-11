import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nibbles_ecommerce/models/meal.dart';
import 'package:nibbles_ecommerce/models/package.dart';
import 'package:nibbles_ecommerce/repositories/packages_repos/package_repo.dart';

import '../../../repositories/meals_repos/meal_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final MealsRepo _mealsRepo;
  final PackagesRepos _packagesRepos;

  SearchCubit(
      {required MealsRepo mealsRepo, required PackagesRepos packagesRepos})
      : _mealsRepo = mealsRepo,
        _packagesRepos = packagesRepos,
        super(SearchInitial());

  void searchMeals(String query) {
    emit(SearchLoading());
    _mealsRepo.getMealsByName(query).listen(
      (meals) {
        emit(MealsSearchSuccess(meals));
      },
      onError: (error) {
        emit(SearchFailure(error.toString()));
      },
    );
  }

  void searchPackages(String query) {
    emit(SearchLoading());
    _packagesRepos.getPackagesByName(query).listen(
      (packages) {
        emit(PackagesSearchSuccess(packages));
      },
      onError: (error) {
        emit(SearchFailure(error.toString()));
      },
    );
  }
}
