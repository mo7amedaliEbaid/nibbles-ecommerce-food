import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/models/order.dart';

import '../../../repositories/orders_repos/base_orders_repo.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  final BaseOrdersRepository ordersRepository;

  GetOrdersCubit({required this.ordersRepository}) : super(GetOrdersInitial());

  void getOrders(String userId) {
    emit(GetOrdersLoading());
    ordersRepository.getOrders(userId).listen(
      (orders) {
        emit(GetOrdersLoaded(orders: orders));
      },
      onError: (error) {
        emit(GetOrdersError(errorMessage: error.toString()));
      },
    );
  }
}
