import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';

Widget customElevatedButton({
  required void Function()? onTap,
  required String text,
  required double heightFraction,
  required double width,
  required Color color,
  Color textColor=Colors.black,
  double radiusFraction = 5,
}) {
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
      child: Text(
        text,
        style: AppText.h3?.copyWith(color: textColor),
      ),
    ),
  );
}
