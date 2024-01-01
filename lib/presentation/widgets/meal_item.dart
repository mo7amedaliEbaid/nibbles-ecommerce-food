import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';

import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';
import 'package:nibbles_ecommerce/models/meal.dart';
import 'dart:math' as math;

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key, required this.mealModel, required this.isInVerticalList});

  final MealModel mealModel;
  final bool isInVerticalList;

  @override
  Widget build(BuildContext context) {
    final random = math.Random();
    return SizedBox(
      width: AppDimensions.normalize(125),
      height: AppDimensions.normalize(65),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(AppRouter.mealDetails, arguments: mealModel);
        },
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                right: AppDimensions.normalize(8),
                left: AppDimensions.normalize(5),
                top: AppDimensions.normalize(2),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    AppDimensions.normalize(10),
                  ),
                  topRight: Radius.circular(
                    AppDimensions.normalize(20),
                  ),
                  bottomLeft: Radius.circular(
                    AppDimensions.normalize(30),
                  ),
                  bottomRight: Radius.circular(
                    AppDimensions.normalize(8),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        AppAssets.mealsPng[random.nextInt(4)],
                        height: AppDimensions.normalize(40),
                        width: AppDimensions.normalize(35),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: AppDimensions.normalize(8),
                        left: AppDimensions.normalize(6)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: AppDimensions.normalize(65),
                          child: Text(
                            mealModel.name.toUpperCase(),
                            style: AppText.h3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Space.yf(.15),
                        Text(
                          "${mealModel.calories} Calories",
                          style: AppText.b1
                              ?.copyWith(color: AppColors.antiqueRuby),
                        ),
                        Space.yf(.15),
                        SizedBox(
                            width: AppDimensions.normalize(65),
                            child: Text(
                              mealModel.description,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: AppText.b1?.copyWith(
                                  color: AppColors.greyText,
                                  height: 1.5,
                                  letterSpacing: 0.5),
                            )),
                        Space.yf(.3),
                        SizedBox(
                          width: AppDimensions.normalize(52),
                          child: Text(
                            mealModel.ingredients,
                            style: AppText.b1?.copyWith(
                                color: AppColors.tabColor, letterSpacing: 0),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, userState) {
                  return userState.user.id != null
                      ? GestureDetector(
                          onTap: () {
                            context
                                .read<FavoriteMealsCubit>()
                                .toggleFavorite(userState.user.id!, mealModel);
                          },
                          child: BlocBuilder<FavoriteMealsCubit,
                              FavoriteMealsState>(
                            builder: (context, favState) {
                              if (favState is FavoriteMealsLoaded) {
                                final isFavorite = favState.favoriteMeals.any(
                                    (favoriteMeal) =>
                                        favoriteMeal.id == mealModel.id);
                                return RightFavIconStack(isFilled: isFavorite);
                              } else {
                                return RightFavIconStack(isFilled: false);
                              }
                            },
                          ),
                        )
                      : RightFavIconStack(isFilled: false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
