part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class MealsSearchSuccess extends SearchState {
  final List<MealModel> meals;

  const MealsSearchSuccess(this.meals);

  @override
  List<Object?> get props => [meals];
}

class PackagesSearchSuccess extends SearchState {
  final List<PackageModel> packages;

  const PackagesSearchSuccess(this.packages);

  @override
  List<Object?> get props => [packages];
}

class SearchFailure extends SearchState {
  final String error;

  const SearchFailure(this.error);

  @override
  List<Object?> get props => [error];
}
