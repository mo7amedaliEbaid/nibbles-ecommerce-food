import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Address extends Equatable {
  final String? userId;
  final String title;
  final String number;
  final String area;
  final String bloc;
  final String street;
  final String house;
  final String floor;
  final String apartment;
  final String instructions;

  const Address({
    this.userId,
    required this.bloc,
    required this.street,
    required this.house,
    required this.title,
    required this.number,
    required this.area,
    required this.floor,
    required this.apartment,
    required this.instructions,
  });

  @override
  List<Object?> get props => [
        title,
        number,
        area,
        bloc,
        street,
        house,
        floor,
        apartment,
        instructions,
        userId
      ];

  factory Address.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Address(
      userId: data['userId'],
      title: data['title'],
      number: data['number'],
      area: data['area'],
      bloc: data['bloc'],
      street: data['street'],
      house: data['house'],
      floor: data['floor'],
      apartment: data['apartment'],
      instructions: data['instructions'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'title': title,
      'number': number,
      'area': area,
      'street': street,
      'bloc': bloc,
      'house': house,
      'floor': floor,
      'apartment': apartment,
      'instructions': instructions,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    };
  }
}
