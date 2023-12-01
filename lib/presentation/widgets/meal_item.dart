import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/configs/space.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppDimensions.normalize(90),
          width: AppDimensions.normalize(122),
          margin: EdgeInsets.only(right: AppDimensions.normalize(8)),
          padding: EdgeInsets.only(
            right: AppDimensions.normalize(8),
            left: AppDimensions.normalize(7),
            top: AppDimensions.normalize(2),
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimensions.normalize(10)),
                  topRight: Radius.circular(AppDimensions.normalize(20)),
                  bottomLeft: Radius.circular(AppDimensions.normalize(30)),
                  bottomRight: Radius.circular(AppDimensions.normalize(8)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    AppAssets.mealPng,
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
                    Text(
                      "Meal Name".toUpperCase(),
                      style: AppText.h3,
                    ),
                    Space.yf(.15),
                    Text(
                      "1000 Calories",
                      style: AppText.b1?.copyWith(color: AppColors.antiqueRuby),
                    ),
                    Space.yf(.15),
                    SizedBox(
                        width: AppDimensions.normalize(65),
                        child: Text(
                          "Lorem Ipsum is simply\ndummy text of the printing and….",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: AppText.b1?.copyWith(
                              color: AppColors.greyText, height: 1.5,letterSpacing: 0.5),
                        )),
                    Space.yf(.3),
                    Text(
                      "Sugar Free, Veggie, ...",
                      style: AppText.b1?.copyWith(color: AppColors.tabColor,letterSpacing: 0),
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
          child: Stack(
            children: [
              SvgPicture.asset(
                AppAssets.cart,
                colorFilter:
                    const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
              ),
              Positioned(
                right: AppDimensions.normalize(4),
                top: AppDimensions.normalize(1),
                bottom: 0,
                child: SvgPicture.asset(
                  AppAssets.favWhite,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
