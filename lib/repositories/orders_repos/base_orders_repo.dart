part of 'orders_repo.dart';

abstract class BaseOrdersRepository {
  Future<void> placeOrder(OrderModel order);

  Stream<List<OrderModel>> getOrders(String userId);
}
