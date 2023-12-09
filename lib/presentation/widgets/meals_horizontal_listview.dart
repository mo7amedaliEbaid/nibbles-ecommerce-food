import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/blocs/meals/meals_bloc.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/presentation/widgets/loading_ticker.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meal_item.dart';


class MealsHorizontalListview extends StatelessWidget {
  const MealsHorizontalListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsBloc, MealsState>(
      builder: (context, state) {
        if (state is MealsLoaded) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state.meals.length,
              padding: EdgeInsets.only(left: AppDimensions.normalize(8)),
              itemBuilder: (context, index) {
                return MealItem(
                  mealModel: state.meals[index],
                  isInVerticalList: false,
                );
              });
        } else {
          return const Center(
            child: LoadingTicker()
          );
        }
      },
    );
  }
}
