import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';

import '../../configs/configs.dart';
import '../../core/constants/assets.dart';

PreferredSizeWidget customAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: Size(
      double.infinity,
      AppDimensions.normalize(37),
    ),
    child: Column(
      children: [
        Space.yf(1.5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Space.xf(.8),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: AppDimensions.normalize(12),
              ),
            ),
            Space.xf(5.5),
            SvgPicture.asset(
              AppAssets.nibblesLogo,
              colorFilter: const ColorFilter.mode(
                  AppColors.antiqueRuby, BlendMode.srcIn),
            ),
          ],
        ),
      ],
    ),
  );
}
