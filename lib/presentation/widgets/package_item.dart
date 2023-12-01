import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';

class PackageItem extends StatelessWidget {
  const PackageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      /*height: AppDimensions.normalize(100),*/
      width: AppDimensions.normalize(120),
      child: Padding(
        padding: EdgeInsets.only(right: AppDimensions.normalize(7)),
        child: Stack(
          children: [
            Column(
              children: [
                Space.yf(3.5),
                Stack(
                  children: [
                    Container(
                      height: AppDimensions.normalize(100),
                      width: AppDimensions.normalize(120),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            AppDimensions.normalize(8),
                          ),
                          topRight: Radius.circular(
                            AppDimensions.normalize(40),
                          ),
                          bottomRight: Radius.circular(
                            AppDimensions.normalize(8),
                          ),
                          bottomLeft: Radius.circular(
                            AppDimensions.normalize(8),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: AppDimensions.normalize(48),
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            "Package 1".toUpperCase(),
                            style: AppText.h3?.copyWith(letterSpacing: 1.7),
                          ),
                          Space.yf(.4),
                          Text("2 lunch, 1 Breakfast, 1 Drink",
                              style: AppText.b1?.copyWith(
                                color: AppColors.deepTeal,
                              )),
                          Space.yf(.6),
                          Text(
                            "120 KWD (1 Month 26 Days)".toUpperCase(),
                            style: AppText.h3,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            AppAssets.favOutlined,
                            colorFilter: const ColorFilter.mode(
                                AppColors.deepTeal, BlendMode.srcIn),
                          ),
                          Positioned(
                            left: AppDimensions.normalize(4),
                            top: AppDimensions.normalize(1),
                            bottom: 0,
                            child: Image.asset(
                              AppAssets.favPng,
                              fit: BoxFit.contain,
                              height: AppDimensions.normalize(10),
                              width: AppDimensions.normalize(10),
                              // color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            AppAssets.cart,
                            colorFilter: const ColorFilter.mode(
                                AppColors.deepTeal, BlendMode.srcIn),
                          ),
                          Positioned(
                            right: AppDimensions.normalize(4),
                            top: AppDimensions.normalize(1),
                            bottom: 0,
                            child: SvgPicture.asset(
                              AppAssets.cartWhite,
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: AppDimensions.normalize(9),
              child: Image.asset(
                AppAssets.packagesPng,
                width: AppDimensions.normalize(90),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
