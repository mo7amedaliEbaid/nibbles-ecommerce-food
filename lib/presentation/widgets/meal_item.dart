import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/configs/space.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';
import 'package:nibbles_ecommerce/models/meal.dart';
import 'dart:math' as math;

import 'package:nibbles_ecommerce/presentation/widgets/filled_favicon_stack.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key, required this.mealModel, required this.isInVerticalList});

  final MealModel mealModel;
  final bool isInVerticalList;

  @override
  Widget build(BuildContext context) {
    final _random = math.Random();
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRouter.mealDetails, arguments: mealModel);
      },
      child: Stack(
        children: [
          Container(
            height: AppDimensions.normalize(isInVerticalList ? 63 : 90),
            width: AppDimensions.normalize(isInVerticalList ? 133 : 122),
            margin: isInVerticalList
                ? EdgeInsets.only(
                    top: AppDimensions.normalize(10),
                  )
                : EdgeInsets.only(
                    right: AppDimensions.normalize(8.2),
                  ),
            padding: EdgeInsets.only(
              right: AppDimensions.normalize(8),
              left: AppDimensions.normalize(7),
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
                      AppAssets.mealsPng[_random.nextInt(4)],
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
                        style:
                            AppText.b1?.copyWith(color: AppColors.antiqueRuby),
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
              right: AppDimensions.normalize(8),
              child: filledFavIconSrack()),
        ],
      ),
    );
  }
}
