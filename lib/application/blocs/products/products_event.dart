
part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  List<Object> get props => [];
}

class LoadProducts extends ProductsEvent {}

class UpdateProducts extends ProductsEvent {
  final List<Product> products;

  const UpdateProducts(this.products);

  @override
  List<Object> get props => [products];
}
