import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MealModel extends Equatable {
  final String id;
  final String categoryId;
  final String name;
  final String description;
  final String fats;
  final String calories;
  final String rating;
  final String carbohydrates;
  final String proteins;
  final String ingredients;
  final String qrhash;
  final List<dynamic> facts;

  const MealModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.fats,
    required this.calories,
    required this.rating,
    required this.carbohydrates,
    required this.proteins,
    required this.ingredients,
    required this.qrhash,
    required this.facts,
  });

  static MealModel fromSnapShot(DocumentSnapshot snap) {
    MealModel meal = MealModel(
      name: snap['name'],
      id: snap['id'],
      categoryId: snap['categoryid'],
      rating: snap['rating'],
      description: snap['description'],
      fats: snap['fats'],
      facts: snap['facts'],
      calories: snap['calories'],
      carbohydrates: snap['carbohydrates'],
      proteins: snap['proteins'],
      qrhash: snap['qrhash'],
      ingredients: snap['ingredients'],
    );
    return meal;
  }

  @override
  List<Object?> get props => [
        name,
        id,
        categoryId,
        rating,
        description,
        calories,
        fats,
        facts,
        carbohydrates,
        proteins,
        qrhash,
        ingredients
      ];
}
