// Cubit
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/models/package.dart';
import 'package:nibbles_ecommerce/repositories/favourite_packages_repo/fav_packages_repo.dart';

part 'fav_packages_state.dart';

class FavouritePackagesCubit extends Cubit<FavoritesPackagesState> {
  final FavoritePackagesRepository _repository;
  StreamSubscription? _streamSubscription;

  FavouritePackagesCubit(this._repository) : super(FavoritesInitial());

  Future<void> loadFavorites(String userId) async {
    try {
      _streamSubscription?.cancel();
      _streamSubscription = _repository.getFavoritePackages(userId).listen(
        (packages) {
          emit(
            FavoritesLoaded(packages),
          );
        },
      );
    } catch (e) {
      emit(FavoritesError('Error loading favorite packages: $e'));
    }
  }

  void toggleFavorite(String userId, PackageModel packageModel) async {
    final isFavorite =
        await _repository.isPackageFavorite(userId, packageModel.id);

    if (isFavorite) {
      await _repository.removeFavoritePackage(userId, packageModel.id);
    } else {
      await _repository.addFavoritePackage(userId, packageModel);
    }

    loadFavorites(userId);
  }
}
