import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/models/meal.dart';
import 'package:nibbles_ecommerce/models/package.dart';

import 'package:nibbles_ecommerce/repositories/repositories.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final BaseMealRepository _mealsRepo;
  final BasePackagesRepository _packagesRepos;

  SearchCubit(
      {required MealsRepo mealsRepo, required PackagesRepos packagesRepos})
      : _mealsRepo = mealsRepo,
        _packagesRepos = packagesRepos,
        super(SearchInitial());

  void searchMealsByName(String query) {
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

  void searchMealsByQrCode(String qrhash) {
    emit(SearchLoading());
    _mealsRepo.getMealsByQrCode(qrhash).listen(
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
