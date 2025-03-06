import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String price;

  const Product({
    required this.id,
    required this.name,
    required this.price,
  });

  static Product fromSnapShot(DocumentSnapshot snap) {
    Product product = Product(
      id: snap['id'],
      name: snap['name'],
      price: snap['price'],
    );
    return product;
  }

  @override
  List<Object?> get props => [id, name, price];
}
