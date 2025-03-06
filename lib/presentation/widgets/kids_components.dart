import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';

import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';

Widget addKidContainer(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(AppRouter.addKid);
    },
    child: Container(
      width: AppDimensions.normalize(52),
      height: AppDimensions.normalize(55),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimensions.normalize(6)),
          color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.circle,
                  height: AppDimensions.normalize(15),
                  colorFilter: const ColorFilter.mode(
                      AppColors.deepTeal, BlendMode.srcIn),
                ),
                SvgPicture.asset(
                  AppAssets.plus,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                )
              ],
            ),
            Space.yf(),
            Text(
              "Add New",
              style: AppText.h3,
            )
          ],
        ),
      ),
    ),
  );
}

Widget addStack(bool withKid) {
  return withKid
      ? Image.asset(
          AppAssets.addKidPng,
          height: AppDimensions.normalize(40),
        )
      : Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.circle,
              colorFilter:
                  const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
              height: AppDimensions.normalize(34),
              width: AppDimensions.normalize(34),
            ),
            Container(
              height: AppDimensions.normalize(15),
              width: AppDimensions.normalize(15),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
            //  Icon(Icons.add,color: AppColors.deepTeal,size: AppDimensions.normalize(12),)
            SvgPicture.asset(
              AppAssets.plus,
              colorFilter:
                  const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
            )
          ],
        );
}

Widget stepStack({required String stepImage, required String svgIcon}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Image.asset(stepImage),
      SvgPicture.asset(
        svgIcon,
        colorFilter:
            const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
        height: AppDimensions.normalize(11),
      ),
    ],
  );
}

Widget stepNumberTexts(String stepNumber, String stepName) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Space.yf(.8),
      Text(
        "Step $stepNumber of 3",
        style: AppText.h3b?.copyWith(color: AppColors.antiqueRuby),
      ),
      Space.yf(.5),
      Text(
        stepName,
        style: AppText.h3b,
      )
    ],
  );
}
