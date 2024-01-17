import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/core/core.dart';
import 'package:nibbles_ecommerce/models/models.dart';
import 'dart:math' as math;

import '../../configs/configs.dart';

Widget profileSvgStack() {
  return Stack(
    alignment: Alignment.center,
    children: [
      SvgPicture.asset(
        AppAssets.circle,
        colorFilter:
            const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
      ),
      SvgPicture.asset(
        AppAssets.profile,
        width: AppDimensions.normalize(9),
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      )
    ],
  );
}

Widget editSvg() {
  return Stack(
    alignment: Alignment.center,
    children: [
      SvgPicture.asset(
        AppAssets.rightIconRec,
        colorFilter:
            const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
      ),
      SvgPicture.asset(
        AppAssets.pencil,
        width: AppDimensions.normalize(9),
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      )
    ],
  );
}

Widget profileKidItem({
  required Kid kid,
  required BuildContext context,
}) {
  final random = math.Random();

  return GestureDetector(
    onTap: () {
      Navigator.of(context).pushNamed(
        AppRouter.kidProfile,
        arguments: kid,
      );
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
            Image.asset(
              AppAssets.kidsImages[random.nextInt(2)],
              height: AppDimensions.normalize(22),
            ),
            Space.yf(.5),
            Text(kid.name.capitalize())
          ],
        ),
      ),
    ),
  );
}
