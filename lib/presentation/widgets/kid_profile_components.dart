import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/core.dart';

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
            style: AppText.b1?.copyWith(color: AppColors.greyText),
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
          style: AppText.b1?.copyWith(color: AppColors.greyText),
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

Widget foodDetailsItem(
    {required String topText,
    required List<String> bottomTexts,
    required BuildContext context}) {
  return Container(
    //  height: AppDimensions.normalize(30),
    width: double.infinity,
    padding: Space.all(.8, 1),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(5),
        ),
        border: Border.all(color: AppColors.lightGrey)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topText,
          style: AppText.b1?.copyWith(color: AppColors.greyText),
        ),
        Space.yf(.9),
        SizedBox(
          height: AppDimensions.normalize(15),
          child: ListView.separated(
            itemCount: bottomTexts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return bottomTextContainer(bottomTexts[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Space.xf(.5);
            },
          ),
        ),
        Space.yf(.2),
      ],
    ),
  );
}

Widget bottomTextContainer(String bottomText) {
  return Container(
    padding: Space.all(.8, 0),
    decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(AppDimensions.normalize(10))),
    child: Center(
      child: Text(
        bottomText,
        style: AppText.b1?.copyWith(color: Colors.white),
      ),
    ),
  );
}
