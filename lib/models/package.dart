import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PackageModel extends Equatable {
  final String id;
  final String name;
  final String items;
  final String price;
  final String oldPrice;

  const PackageModel({
    required this.id,
    required this.name,
    required this.items,
    required this.price,
    required this.oldPrice,
  });

  static PackageModel fromSnapShot(DocumentSnapshot snap) {
    PackageModel packageModel = PackageModel(
      id: snap['id'],
      name: snap['name'],
      items: snap['items'],
      price: snap['price'],
      oldPrice: snap['oldprice'],
    );
    return packageModel;
  }

  @override
  List<Object?> get props => [id, name, items, price, oldPrice];
}
