// States

part of 'fav_packages_cubit.dart';

abstract class FavoritesPackagesState extends Equatable {
  const FavoritesPackagesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesPackagesState {}

class FavoritesLoaded extends FavoritesPackagesState {
  final List<PackageModel> favouritePackages;

  const FavoritesLoaded(this.favouritePackages);

  @override
  List<Object> get props => [favouritePackages];
}

class FavoritesError extends FavoritesPackagesState {
  final String message;

  const FavoritesError(this.message);

  @override
  List<Object> get props => [message];
}