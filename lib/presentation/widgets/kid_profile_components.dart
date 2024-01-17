import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';

Widget personalDetailsItem({
  required String topText,
  required String bottomText,
}) {
  return Container(
    height: AppDimensions.normalize(30),
    width: AppDimensions.normalize(40),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(
        AppDimensions.normalize(4),
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            topText,
            style: AppText.b1,
          ),
          Space.yf(.2),
          Text(
            bottomText,
            style: AppText.h3b,
          ),
        ],
      ),
    ),
  );
}

Widget dietDetailsItem({
  required String topText,
  required String bottomText,
}) {
  return Container(
    //  height: AppDimensions.normalize(30),
    width: double.infinity,
    padding: Space.all(1.2, .7),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(
        AppDimensions.normalize(4),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topText,
          style: AppText.b1,
        ),
        Space.yf(.2),
        Text(
          bottomText,
          style: AppText.h3b,
        ),
      ],
    ),
  );
}

Widget foodDetailsItem({
  required String topText,
  required String bottomText,
}) {
  return Container(
    //  height: AppDimensions.normalize(30),
    width: double.infinity,
    padding: Space.all(1.2, .7),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(
        AppDimensions.normalize(4),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topText,
          style: AppText.b1,
        ),
        Space.yf(.2),
        Text(
          bottomText,
          style: AppText.h3b,
        ),
      ],
    ),
  );
}
