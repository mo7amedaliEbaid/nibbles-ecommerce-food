import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/models/kid.dart';
import '../../configs/configs.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';
import 'dart:math' as math;

Widget kidItem(Kid kid) {
  final random = math.Random();
  return Material(
    elevation: 1,
    borderRadius: BorderRadius.circular(AppDimensions.normalize(4)),
    child: Container(
      width: AppDimensions.normalize(52),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimensions.normalize(4))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.kidsImages[random.nextInt(2)],
            height: AppDimensions.normalize(18),
          ),
          Space.yf(.3),
          Text(kid.name),
          Space.yf(.3),
          SvgPicture.asset(
            AppAssets.checkCircle,
            colorFilter:
                const ColorFilter.mode(AppColors.greyText, BlendMode.srcIn),
          )
        ],
      ),
    ),
  );
}
