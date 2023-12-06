import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';
import 'package:nibbles_ecommerce/presentation/widgets/custom_elevated_button.dart';
import 'package:nibbles_ecommerce/presentation/widgets/custom_textformfield.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.only(top: AppDimensions.normalize(20)),
          child: Padding(
            padding: Space.hf(1),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Continue as\na guest",
                      style: AppText.b2?.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 3.5,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    Space.xf()
                  ],
                ),
                Space.yf(2.5),
                SvgPicture.asset(
                  AppAssets.logoRuby,
                  width: AppDimensions.normalize(65),
                  colorFilter: const ColorFilter.mode(
                      AppColors.antiqueRuby, BlendMode.srcIn),
                ),
                Space.yf(3),
                Text(
                  "SIGN UP",
                  style: AppText.h2b,
                ),
                Space.yf(2.5),
                  customTextFormField(label: "Name*", svgUrl: ""),
                Space.yf(1.3),
                customTextFormField(label: "Name*", svgUrl: ""),
                Space.yf(1.3),
                customTextFormField(label: "Name*", svgUrl: ""),
                Space.yf(1.3),
                customTextFormField(label: "Name*", svgUrl: ""),
                Space.yf(1.3),
                customTextFormField(label: "Name*", svgUrl: ""),
                Space.yf(2.5),
                customElevatedButton(onTap: (){
                  Navigator.of(context).pushNamed(AppRouter.root);
                }, text: "LOGIN", heightFraction: 20, width: double.infinity, color: AppColors.commonAmber)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
