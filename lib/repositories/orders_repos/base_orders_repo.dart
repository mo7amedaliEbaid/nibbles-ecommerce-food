import 'package:nibbles_ecommerce/models/order.dart';

abstract class BaseOrdersRepository {
  Future<void> placeOrder(OrderModel order);

  Stream<List<OrderModel>> getOrders(String userId);
}
