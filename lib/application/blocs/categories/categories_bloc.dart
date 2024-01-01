import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';

import '../../../models/meal_category.dart';
import 'package:flutter/material.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final BaseCategoriesRepository _categoriesRepos;
  StreamSubscription? _streamSubscription;

  CategoriesBloc({required CategoriesRepo categoriesRepos})
      : _categoriesRepos = categoriesRepos,
        super(const CategoriesLoaded()) {
    on<LoadCategories>(_mapLoadCategoriesToState);
    on<UpdateCategories>(_mapUpdateCategoriesToState);
  }

  FutureOr<void> _mapUpdateCategoriesToState(
      UpdateCategories event, Emitter<CategoriesState> emit) async {
    emit(CategoriesLoaded(categories: event.categories));
  }

  FutureOr<void> _mapLoadCategoriesToState(
      LoadCategories event, Emitter<CategoriesState> emit) async {
    _streamSubscription?.cancel();
    _streamSubscription = _categoriesRepos.getAllmealcates().listen(
      (categories) {
        add(
          UpdateCategories(categories),
        );
      },
    );
  }
}
