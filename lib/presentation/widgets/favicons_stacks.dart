import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/configs.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';

Widget RightFavIconStack({required bool isFilled}) {
  return Stack(
    children: [
      SvgPicture.asset(
        AppAssets.rightIconRec,
        colorFilter:
            const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
      ),
      Positioned(
        right: AppDimensions.normalize(4),
        top: AppDimensions.normalize(1),
        bottom: 0,
        child: isFilled
            ? SvgPicture.asset(
                AppAssets.favWhite,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              )
            : Image.asset(
                AppAssets.favPng,
                fit: BoxFit.contain,
                height: AppDimensions.normalize(10),
                width: AppDimensions.normalize(10),
                // color: Colors.white,
              ),
      ),
    ],
  );
}

Widget LeftFavIconStack({required bool isFilled}) {
  return Stack(
    children: [
      SvgPicture.asset(
        AppAssets.favOutlined,
        colorFilter:
            const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
      ),
      Positioned(
        left: AppDimensions.normalize(4),
        top: AppDimensions.normalize(1),
        bottom: 0,
        child: isFilled
            ? SvgPicture.asset(
                AppAssets.favWhite,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              )
            : Image.asset(
                AppAssets.favPng,
                fit: BoxFit.contain,
                height: AppDimensions.normalize(10),
                width: AppDimensions.normalize(10),
                // color: Colors.white,
              ),
      ),
    ],
  );
}
