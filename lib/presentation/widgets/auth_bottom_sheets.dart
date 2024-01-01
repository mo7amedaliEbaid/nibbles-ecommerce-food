import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';

import '../../configs/configs.dart';
import '../../core/constants/colors.dart';

Future<void> showSuccessfulAuthBottomSheet(
    BuildContext context, bool isFromSignUp) async {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.normalize(10)),
    ),
    constraints: BoxConstraints(
        minHeight: AppDimensions.normalize(135), maxWidth: double.infinity),
    builder: (BuildContext context) {
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
              Space.yf(.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    isFromSignUp
                        ? "Successfully Registered".toUpperCase()
                        : "Successfully Logged".toUpperCase(),
                    style: AppText.h3b,
                  ),
                  Space.xf(.7),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.clear))
                ],
              ),
              Space.yf(2),
              SvgPicture.asset(
                AppAssets.correct,
                colorFilter:
                    const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
              ),
              Space.yf(2),
              Text(
                isFromSignUp
                    ? "You are successfully registered".toUpperCase()
                    : "You are successfully logged in".toUpperCase(),
                style: AppText.h3,
              ),
              Space.yf(2.5),
              Padding(
                padding: EdgeInsets.only(
                    right: AppDimensions.normalize(7),
                    left: AppDimensions.normalize(3)),
                child: customElevatedButton(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRouter.root,
                        (route) => false,
                      );
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
    },
  );
}

Future<void> showErrorAuthBottomSheet(BuildContext context) async {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppDimensions.normalize(10)),
    ),
    constraints: BoxConstraints(
        minHeight: AppDimensions.normalize(135), maxWidth: double.infinity),
    builder: (BuildContext context) {
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
              Space.yf(.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Error".toUpperCase(),
                    style: AppText.h3b,
                  ),
                  Space.xf(5.7),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.clear))
                ],
              ),
              Space.yf(2),
              Image.asset(
                AppAssets.errorPng,
              ),
              Space.yf(2),
              Text(
                "Error, Try again".toUpperCase(),
                style: AppText.h3,
              ),
              Space.yf(2.5),
              Padding(
                padding: EdgeInsets.only(
                    right: AppDimensions.normalize(7),
                    left: AppDimensions.normalize(3)),
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
    },
  );
}
