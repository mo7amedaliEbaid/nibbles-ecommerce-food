part of 'place_order_cubit.dart';

abstract class PlaceOrderState extends Equatable {
  const PlaceOrderState();

  @override
  List<Object?> get props => [];
}

class PlaceOrderInitial extends PlaceOrderState {}

class OrderPlacedSuccessfully extends PlaceOrderState {}

class PlaceOrderLoading extends PlaceOrderState {}

class PlaceOrderError extends PlaceOrderState {
  final String errorMessage;

  const PlaceOrderError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
