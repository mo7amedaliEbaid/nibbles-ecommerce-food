import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Kid extends Equatable {
  final String name;
  final String age;
  final String? weight;
  final String gender;
  final String? height;
  final String? userId;

  const Kid({
    required this.gender,
    this.height,
    this.userId,
    required this.name,
    required this.age,
    this.weight,
  });

  @override
  List<Object?> get props => [name, age, weight, gender, height, userId];

  factory Kid.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Kid(
      name: data['name'],
      age: data['age'],
      weight: data['weight'],
      gender: data['gender'],
      height: data['height'],
      userId: data['userId'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'height': height,
      'gender': gender,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    };
  }
}

extension KidCopyWith on Kid {
  Kid copyWith({
    String? name,
    String? age,
    String? weight,
    String? height,
    String? gender,
    String? userId,
  }) {
    return Kid(
      name: name ?? this.name,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      gender: gender ?? this.gender,
      userId: userId ?? this.userId,
    );
  }
}
