import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/configs/space.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';

class SuccessfulOrderScreen extends StatelessWidget {
  const SuccessfulOrderScreen({super.key, required this.packageName});

  final String packageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Space.yf(6),
          Center(
            child: SvgPicture.asset(
              AppAssets.logoRuby,
              colorFilter: const ColorFilter.mode(
                  AppColors.antiqueRuby, BlendMode.srcIn),
            ),
          ),
          Space.yf(3),
          SvgPicture.asset(
            AppAssets.correct,
            colorFilter:
                const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
          ),
          Space.yf(1.5),
          Text(
            "Order Successfully",
            style: AppText.h3b,
          ),
        ],
      ),
    );
  }
}
