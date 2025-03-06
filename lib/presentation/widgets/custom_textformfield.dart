import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';

Widget customTextFormField(
    {required String label,
    String? svgUrl,
    String? Function(String?)? validator,
    required TextEditingController controller}) {
  return TextFormField(
    cursorColor: AppColors.deepTeal,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: validator,
    controller: controller,
    style: AppText.b2b,
    decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.lightGrey)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.antiqueRuby)),
        prefixIcon: svgUrl == null
            ? null
            : Padding(
                padding: EdgeInsets.only(
                    right: AppDimensions.normalize(10),
                    top: AppDimensions.normalize(1)),
                child: SvgPicture.asset(
                  svgUrl,
                  colorFilter: const ColorFilter.mode(
                      AppColors.deepTeal, BlendMode.srcIn),
                ),
              ),
        errorStyle: AppText.l1b?.copyWith(color: Colors.red),
        errorMaxLines: 3,
        labelText: label,
        labelStyle: AppText.b1?.copyWith(color: AppColors.greyText)),
  );
}
