import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';

Widget customElevatedButton(
    {required void Function()? onTap,
    required String text,
    required double heightFraction,
    required double width,
    required Color color,
    Color textColor = Colors.black,
    double radiusFraction = 5,
    bool withSmallText = false}) {
  return SizedBox(
    height: AppDimensions.normalize(heightFraction),
    width: width,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(AppDimensions.normalize(radiusFraction)),
        ),
      ),
      child: FittedBox(
        child: Text(
          text,
          style: withSmallText
              ? AppText.l1b?.copyWith(color: textColor)
              : AppText.h3?.copyWith(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ),
  );
}
