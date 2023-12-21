import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/configs/space.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/presentation/widgets/top_rec_components.dart';

import '../widgets/kids_components.dart';

class NoKidsScreen extends StatelessWidget {
  const NoKidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: AppDimensions.normalize(164),
            child: Stack(
              children: [
                curvedlRecSvg(AppColors.deepTeal),
                positionedRow(context),
                positionedTitle("Select KID".toUpperCase()),
                Positioned(
                  top: AppDimensions.normalize(62),
                  left: AppDimensions.normalize(10),
                  child: addKidContainer(context),
                )
              ],
            ),
          ),
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
          Text("Please add a kid Profile First",style: AppText.b2,)
        ],
      ),
    );
  }
}
