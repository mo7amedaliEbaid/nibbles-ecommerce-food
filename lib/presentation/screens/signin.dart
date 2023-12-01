import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: AppDimensions.normalize(20)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Continue as",
                  style: AppText.b2
                      ?.copyWith(decoration: TextDecoration.underline,decorationThickness: 3.5,),
                ),
                Space.xf(2)
              ],
            )
          ],
        ),
      ),
    );
  }
}
