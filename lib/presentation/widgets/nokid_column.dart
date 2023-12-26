import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/configs.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';

Widget noKidColumn() {
  return Column(
    children: [
      Text(
        "No Kid Avaliable",
        style: AppText.h2,
      ),
      Space.yf(),
      SvgPicture.asset(
        AppAssets.angryFace,
        colorFilter: const ColorFilter.mode(
          AppColors.antiqueRuby,
          BlendMode.srcIn,
        ),
      ),
      Space.yf(1.2),
      Text(
        "Please add a kid Profile First",
        style: AppText.b2,
      )
    ],
  );
}
