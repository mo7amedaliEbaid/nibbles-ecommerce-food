import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/app_dimensions.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';

Widget filledFavIconSrack(){
  return Stack(

    children: [
      SvgPicture.asset(
        AppAssets.rightIconRec,
        colorFilter: const ColorFilter.mode(
            AppColors.deepTeal, BlendMode.srcIn),
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
  );
}