import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meal_item.dart';

class MealsHorizontalListview extends StatelessWidget {
  const MealsHorizontalListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 3,
        padding: EdgeInsets.only(left: AppDimensions.normalize(12)),
        itemBuilder: (context, index) {
          return const MealItem();
        });
  }
}
