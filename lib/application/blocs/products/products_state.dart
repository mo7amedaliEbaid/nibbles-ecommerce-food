part of 'products_bloc.dart';

@immutable
abstract class ProductsState extends Equatable {
  const ProductsState();

  List<Object> get props => [];
}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  const ProductsLoaded({this.products = const <Product>[]});

  @override
  List<Object> get props => [products];
}
