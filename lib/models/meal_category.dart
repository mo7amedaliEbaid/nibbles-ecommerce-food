import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MealCategory extends Equatable {
  final String categoryid;
  final String categoryname;

  const MealCategory({
    required this.categoryid,
    required this.categoryname,
  });

  static MealCategory fromSnapShot(DocumentSnapshot snap) {
    MealCategory category = MealCategory(
      categoryid: snap['id'],
      categoryname: snap['name'],
    );
    return category;
  }

  @override
  List<Object?> get props => [categoryid, categoryname];
}
