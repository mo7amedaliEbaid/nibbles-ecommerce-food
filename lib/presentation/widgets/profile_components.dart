import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';

import '../../configs/app_dimensions.dart';

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
