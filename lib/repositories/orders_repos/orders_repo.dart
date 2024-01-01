import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nibbles_ecommerce/models/order.dart';

part 'base_orders_repo.dart';

class OrdersRepository extends BaseOrdersRepository {
  final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection('orders');

  @override
  Future<void> placeOrder(OrderModel order) async {
    await ordersCollection.doc().set(order.toDocument());
  }

  @override
  Stream<List<OrderModel>> getOrders(String userId) {
    return ordersCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList();
    });
  }
}
