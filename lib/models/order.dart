import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderModel extends Equatable {
  final String kidName;
  final String packageName;
  final String totalPrice;
  final String addressTitle;
  final DateTime date;
  final String? userId;

  const OrderModel({
    required this.addressTitle,
    required this.date,
    this.userId,
    required this.kidName,
    required this.packageName,
    required this.totalPrice,
  });

  @override
  List<Object?> get props =>
      [kidName, packageName, totalPrice, addressTitle, date, userId];

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return OrderModel(
      kidName: data['kidName'],
      packageName: data['packageName'],
      totalPrice: data['totalPrice'],
      addressTitle: data['addressTitle'],
      date: data['date'].toDate(),
      userId: data['userId'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'kidName': kidName,
      'packageName': packageName,
      'totalPrice': totalPrice,
      'date': date,
      'addressTitle': addressTitle,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    };
  }
}
