import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';

import '../../core/constants/strings.dart';

class MealsHorizontalListview extends StatelessWidget {
  const MealsHorizontalListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsBloc, MealsState>(
      builder: (context, state) {
        if (state is MealsLoaded) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: state.meals.length,
            padding: EdgeInsets.only(
              left: AppDimensions.normalize(8),
              right: AppDimensions.normalize(11),
            ),
            itemBuilder: (context, index) {
              return MealItem(
                mealModel: state.meals[index],
                isInVerticalList: false,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Space.xf(.9);
            },
          );
        } else {
          return const Center(
              child: LoadingTicker(
            text: AppStrings.loading,
          ));
        }
      },
    );
  }
}
