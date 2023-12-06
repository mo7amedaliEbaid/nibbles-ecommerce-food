import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MealCategory extends Equatable {
  final String categoryid;
  final String categoryname;
  final String categoryimage;

  const MealCategory({
    required this.categoryid,
    required this.categoryname,
    required this.categoryimage,
  });

  static MealCategory fromSnapShot(DocumentSnapshot snap) {
    MealCategory category = MealCategory(
      categoryid: snap['mealid'],
      categoryname: snap['mealname'],
      categoryimage: snap['mealimage'],
    );
    return category;
  }

  @override
  List<Object?> get props => [categoryid, categoryname, categoryimage];
}
