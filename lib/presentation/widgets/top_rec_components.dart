import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/configs.dart';
import '../../core/constants/assets.dart';

Widget curvedlRecSvg(Color color) {
  return Positioned(
    top: 0,
    left: 0,
    child: SvgPicture.asset(
      AppAssets.curvedRec,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    ),
  );
}

Widget whiteLogoSvg() {
  return SvgPicture.asset(
    AppAssets.nibblesLogo,
    colorFilter: const ColorFilter.mode(
      Colors.white,
      BlendMode.srcIn,
    ),
  );
}

Widget positionedWhiteLogo() {
  return Positioned(
    top: AppDimensions.normalize(20),
    left: 0,
    right: 0,
    child: whiteLogoSvg(),
  );
}

Widget positionedRow(BuildContext context) {
  return Positioned(
    top: AppDimensions.normalize(13),
    left: AppDimensions.normalize(4.5),
    child: Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        Space.xf(5),
        SvgPicture.asset(
          AppAssets.nibblesLogo,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ],
    ),
  );
}

Widget positionedTitle(String title) {
  return Positioned(
    top: AppDimensions.normalize(43),
    left: AppDimensions.normalize(10),
    child: Text(
      title,
      style: AppText.h2b?.copyWith(color: Colors.white),
    ),
  );
}
