import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';

Widget customTextFormField(
    {required String label,
    required String svgUrl,
    String? Function(String?)? validator,
    required TextEditingController controller}) {
  return TextFormField(
    cursorColor: AppColors.deepTeal,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: validator,
    controller: controller,
    decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.antiqueRuby)),
        prefixIcon: Padding(
          padding: EdgeInsets.only(
              right: AppDimensions.normalize(10),
              top: AppDimensions.normalize(1)),
          child: SvgPicture.asset(
            svgUrl,
            colorFilter:
                const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
          ),
        ),
        labelText: label,
        labelStyle: AppText.b1?.copyWith(color: AppColors.greyText)),
  );
}
