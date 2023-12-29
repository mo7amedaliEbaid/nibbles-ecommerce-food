import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/core/extensions/extensions.dart';
import 'package:nibbles_ecommerce/models/product.dart';
import 'dart:math' as math;

import '../../configs/configs.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';
import 'custom_elevated_button.dart';

Widget productItem(Product product) {
  final random = math.Random();

  return Container(
    width: AppDimensions.normalize(53),
    padding: Space.all(.6, .6),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.normalize(4))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: AppDimensions.normalize(35),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimensions.normalize(5)),
              image: DecorationImage(
                  image: AssetImage(AppAssets.productsPng[random.nextInt(3)]),
                  fit: BoxFit.none)),
        ),
        Space.yf(.4),
        Text(
          product.name.capitalize(),
          style: AppText.h3b,
        ),
        Text(
          product.price,
          style: AppText.b1,
        ),
        Space.yf(.5),
        Padding(
          padding: Space.hf(.5),
          child: customElevatedButton(
              onTap: () {},
              text: "Add Product",
              heightFraction: 12,
              width: double.infinity,
              color: AppColors.commonAmber,
              withSmallText: true,
              radiusFraction: 2.5),
        )
      ],
    ),
  );
}
