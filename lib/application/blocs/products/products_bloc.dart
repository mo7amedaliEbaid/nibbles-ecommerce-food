import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';

import '../../../models/product.dart';

import 'package:flutter/material.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final BaseProductsRepo _productsRepo;
  StreamSubscription? _streamSubscription;

  ProductsBloc({required ProductsRepo productsRepo})
      : _productsRepo = productsRepo,
        super(const ProductsLoaded()) {
    on<LoadProducts>(_mapLoadProductsToState);
    on<UpdateProducts>(_mapUpdateProductsToState);
  }

  FutureOr<void> _mapUpdateProductsToState(
      UpdateProducts event, Emitter<ProductsState> emit) async {
    emit(ProductsLoaded(products: event.products));
  }

  FutureOr<void> _mapLoadProductsToState(
      LoadProducts event, Emitter<ProductsState> emit) async {
    _streamSubscription?.cancel();
    _streamSubscription = _productsRepo.getAllProducts().listen(
      (products) {
        add(
          UpdateProducts(products),
        );
      },
    );
  }
}
