part of 'get_orders_cubit.dart';

abstract class GetOrdersState extends Equatable {
  const GetOrdersState();

  @override
  List<Object?> get props => [];
}

class GetOrdersInitial extends GetOrdersState {}

class GetOrdersLoading extends GetOrdersState {}

class GetOrdersLoaded extends GetOrdersState {
  final List<OrderModel> orders;

  const GetOrdersLoaded({required this.orders});

  @override
  List<Object?> get props => [orders];
}

class GetOrdersError extends GetOrdersState {
  final String errorMessage;

  const GetOrdersError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
