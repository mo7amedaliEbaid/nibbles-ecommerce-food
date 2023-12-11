import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';
import 'package:nibbles_ecommerce/presentation/widgets/custom_elevated_button.dart';
import 'package:nibbles_ecommerce/presentation/widgets/custom_textformfield.dart';
import 'package:nibbles_ecommerce/core/extensions/extensions.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: EdgeInsets.only(top: AppDimensions.normalize(20)),
          child: Padding(
            padding: Space.hf(1.3),
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
                customTextFormField(label: "Name*", svgUrl: AppAssets.username),
                Space.yf(1.3),
                customTextFormField(label: "Email*", svgUrl: AppAssets.email),
                Space.yf(1.3),
                customTextFormField(
                    label: "Phone Number*", svgUrl: AppAssets.phone),
                Space.yf(1.3),
                customTextFormField(
                    label: "Password*", svgUrl: AppAssets.password),
                Space.yf(1.3),
                customTextFormField(
                    label: "Confirm Password*", svgUrl: AppAssets.password),
                Space.yf(1.5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppDimensions.normalize(10),
                      width: AppDimensions.normalize(10),
                      child: Material(
                        borderRadius:
                            BorderRadius.circular(AppDimensions.normalize(2)),
                        color: AppColors.lightGrey,
                        child: const Checkbox(
                          value: true,
                          onChanged: null,
                          checkColor: AppColors.antiqueRuby,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                    ),
                    Space.xf(),
                    Text(
                      "I accept all privacy policies and terms&\nConditions of Nibbles.",
                      style: AppText.b1
                          ?.copyWith(color: AppColors.greyText, height: 1.5),
                    ).withDifferentStyle("Nibbles",
                        AppText.h3b!.copyWith(color: AppColors.antiqueRuby))
                  ],
                ),
                Space.yf(1.5),
                customElevatedButton(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRouter.root);
                    },
                    text: "SIGN UP",
                    heightFraction: 20,
                    width: double.infinity,
                    color: AppColors.commonAmber),
                Space.yf(2.5),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: AppDimensions.normalize(35),
        decoration: BoxDecoration(
            color: AppColors.antiqueRuby,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimensions.normalize(7.5)),
                topRight: Radius.circular(AppDimensions.normalize(7.5)))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: AppText.b2?.copyWith(color: Colors.white),
            ),
            Space.yf(.5),
            Text(
              "Login".toUpperCase(),
              style: AppText.h3b?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
