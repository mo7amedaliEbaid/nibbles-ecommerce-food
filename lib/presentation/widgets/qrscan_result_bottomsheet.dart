import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';

import '../../configs/configs.dart';
import '../../core/constants/colors.dart';
import '../../models/meal.dart';

Future<void> showQrScanResultBottomSheet(
    BuildContext context, List<MealModel> meals) async {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.normalize(10)),
    ),
    backgroundColor: meals.isEmpty ? Colors.white : Colors.grey.shade200,
    constraints: BoxConstraints(
        minHeight: AppDimensions.normalize(125), maxWidth: double.infinity),
    builder: (BuildContext context) {
      return meals.isNotEmpty
          ? SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppDimensions.normalize(7),
                  right: AppDimensions.normalize(3),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Space.yf(1.2),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.clear))
                      ],
                    ),
                    SizedBox(
                      width: AppDimensions.normalize(147),
                      child: MealItem(
                        mealModel: meals.first,
                        isInVerticalList: true,
                      ),
                    ),
                    Space.yf(2),
                    Padding(
                      padding:
                          EdgeInsets.only(right: AppDimensions.normalize(4)),
                      child: customElevatedButton(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                AppRouter.mealDetails,
                                arguments: meals.first);
                          },
                          text: "View Details".toUpperCase(),
                          heightFraction: 22,
                          width: double.infinity,
                          color: AppColors.commonAmber),
                    ),
                    Space.yf(.8),
                  ],
                ),
              ),
            )
          : qrScanError(context);
    },
  );
}

Widget qrScanError(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.only(
        left: AppDimensions.normalize(7),
        right: AppDimensions.normalize(3),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Space.yf(1.2),
          Text(
            "Invalid QR code".toUpperCase(),
            style: AppText.h2b,
          ),
          Space.yf(1.3),
          SvgPicture.asset(
            AppAssets.invalidQr,
            colorFilter:
                const ColorFilter.mode(AppColors.antiqueRuby, BlendMode.srcIn),
          ),
          Space.yf(1.4),
          Text(
            "QR Code Is invalid".toUpperCase(),
            style: AppText.h3,
          ),
          Space.yf(2.3),
          Padding(
            padding: EdgeInsets.only(right: AppDimensions.normalize(4)),
            child: customElevatedButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: "OK".toUpperCase(),
                heightFraction: 22,
                width: double.infinity,
                color: AppColors.commonAmber),
          ),
          Space.yf(.8),
        ],
      ),
    ),
  );
}
