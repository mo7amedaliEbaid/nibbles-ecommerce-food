import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/blocs/meals/meals_bloc.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/space.dart';

import '../../core/constants/strings.dart';
import 'tickers.dart';
import 'meal_item.dart';

class MealsVerticalListview extends StatelessWidget {
  const MealsVerticalListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsBloc, MealsState>(
      builder: (context, state) {
        if (state is MealsLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: state.meals.length,
            padding: EdgeInsets.only(
              left: AppDimensions.normalize(8),
              right: AppDimensions.normalize(8),
              top: AppDimensions.normalize(9),
              bottom: AppDimensions.normalize(15),
            ),
            itemBuilder: (context, index) {
              return MealItem(
                mealModel: state.meals[index],
                isInVerticalList: true,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Space.yf();
            },
          );
        } else {
          return const Center(
            child: LoadingTicker(
              text: AppStrings.loading,
            ),
          );
        }
      },
    );
  }
}
