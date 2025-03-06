import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/core/constants/strings.dart';

import 'app_dimensions.dart';

class AppText {
  static TextStyle? btn;

  // Headings
  static TextStyle? h1;
  static TextStyle? h1b;
  static TextStyle? h2;
  static TextStyle? h2b;
  static TextStyle? h3;
  static TextStyle? h3b;

  // Body
  static TextStyle? b1;
  static TextStyle? b1b;
  static TextStyle? b2;
  static TextStyle? b2b;

  // Label
  static TextStyle? l1;
  static TextStyle? l1b;
  static TextStyle? l2;
  static TextStyle? l2b;

  static init() {
    const b = FontWeight.bold;
    const baseStyle = TextStyle(fontFamily: AppStrings.fontFamily,letterSpacing: 1);

    h1 = baseStyle.copyWith(fontSize: AppDimensions.font(12.0));
    h1b = h1!.copyWith(fontWeight: b);

    h2 = baseStyle.copyWith(fontSize: AppDimensions.font(10));
    h2b = h2!.copyWith(fontWeight: b);

    h3 = baseStyle.copyWith(fontSize: AppDimensions.font(8));
    h3b = h3!.copyWith(fontWeight: b);

    b1 = baseStyle.copyWith(fontSize: AppDimensions.font(7));
    b1b = b1!.copyWith(fontWeight: b);

    b2 = baseStyle.copyWith(fontSize: AppDimensions.font(6.25));
    b2b = b2!.copyWith(fontWeight: b);

    l1 = baseStyle.copyWith(fontSize: AppDimensions.font(5));
    l1b = l1!.copyWith(fontWeight: b);

    l2 = baseStyle.copyWith(fontSize: AppDimensions.font(4));
    l2b = l2!.copyWith(fontWeight: b);
  }
}
