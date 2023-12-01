import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';

import '../../configs/app_dimensions.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.commonAmber,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.adsPng,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
              bottom: AppDimensions.normalize(5),
              right: AppDimensions.normalize(2),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRouter.intro,
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Skip".toUpperCase(),
                    style: AppText.h3?.copyWith(color: Colors.white),
                  ))),
        ],
      ),
    );
  }
}
