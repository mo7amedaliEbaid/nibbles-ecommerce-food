import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/core/extensions/extensions.dart';
import 'package:nibbles_ecommerce/models/package.dart';
import 'package:nibbles_ecommerce/models/product.dart';
import 'dart:math' as math;
import 'package:nibbles_ecommerce/presentation/widgets.dart';

import '../../configs/configs.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/colors.dart';

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

Widget couponContainer(TextEditingController controller) {
  return Container(
    height: AppDimensions.normalize(55),
    width: double.infinity,
    margin: Space.all(1.2, 1),
    padding: Space.all(1, 1.2),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.normalize(10))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Coupon Code",
          style: AppText.h2,
        ),
        TextField(
          cursorColor: AppColors.deepTeal,
          decoration: InputDecoration(
            labelText: "Type here",
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.lightGrey)),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.antiqueRuby)),
            labelStyle: AppText.b1?.copyWith(color: AppColors.greyText),
            suffixIcon: customElevatedButton(
                onTap: () {},
                text: "Redeem",
                heightFraction: 15,
                width: AppDimensions.normalize(35),
                color: AppColors.commonAmber),
          ),
        )
        /* customTextFormField(
            label: "Type here",
            controller: controller,
            suffix: customElevatedButton(
                onTap: () {},
                text: "Redeem",
                heightFraction: 15,
                width: AppDimensions.normalize(35),
                color: AppColors.commonAmber))*/
      ],
    ),
  );
}

Widget pricesContainer(PackageModel packageModel) {
  return Container(
    height: AppDimensions.normalize(80),
    margin: Space.hf(1.2),
    padding: Space.all(2, 2),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimensions.normalize(9))),
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      priceRow(
          "Package Total", "${packageModel.price.substring(0, 3)}.000 KWD"),
      priceRow("Add ons", "0.000 KWD"),
      priceRow("Promo Discount", "0.000 KWD"),
      priceRow("Grand total", "${packageModel.price.substring(0, 3)}.000 KWD"),
    ]),
  );
}

Widget priceRow(String leftText, String rightText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        leftText,
        style: AppText.h3?.copyWith(color: AppColors.greyText),
      ),
      Text(
        rightText,
        style: AppText.h3?.copyWith(color: AppColors.deepTeal),
      ),
    ],
  );
}
