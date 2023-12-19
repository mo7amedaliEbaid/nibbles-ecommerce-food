// States

part of 'fav_packages_cubit.dart';

abstract class FavoritesPackagesState extends Equatable {
  const FavoritesPackagesState();

  @override
  List<Object> get props => [];
}

class FavoritePackagesInitial extends FavoritesPackagesState {}

class FavoritePackagesLoaded extends FavoritesPackagesState {
  final List<PackageModel> favouritePackages;

  const FavoritePackagesLoaded(this.favouritePackages);

  @override
  List<Object> get props => [favouritePackages];
}

class FavoritePackagesError extends FavoritesPackagesState {
  final String message;

  const FavoritePackagesError(this.message);

  @override
  List<Object> get props => [message];
}