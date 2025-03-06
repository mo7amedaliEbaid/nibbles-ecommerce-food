import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/application/cubits/select_kid/select_kid_cubit.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';

class SuccessfulOrderScreen extends StatelessWidget {
  const SuccessfulOrderScreen({super.key, required this.packageName});

  final String packageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Space.yf(6),
          Center(
            child: SvgPicture.asset(
              AppAssets.logoRuby,
              colorFilter: const ColorFilter.mode(
                  AppColors.antiqueRuby, BlendMode.srcIn),
            ),
          ),
          Space.yf(3),
          SvgPicture.asset(
            AppAssets.correct,
            colorFilter:
                const ColorFilter.mode(AppColors.deepTeal, BlendMode.srcIn),
          ),
          Space.yf(1.5),
          Text(
            "Order Successfully",
            style: AppText.h3b,
          ),
          Space.yf(1.6),
          Container(
            height: AppDimensions.normalize(80),
            width: double.infinity,
            margin: Space.hf(1.3),
            padding: Space.all(2, 1.5),
            decoration: BoxDecoration(
                color: AppColors.deepTeal,
                borderRadius:
                    BorderRadius.circular(AppDimensions.normalize(8))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.kid1,
                      height: AppDimensions.normalize(15),
                    ),
                    Space.xf(.7),
                    BlocBuilder<SelectKidCubit, SelectKidState>(
                      builder: (context, state) {
                        return Text(
                          state.selectedKid?.name.capitalize() ?? "",
                          style: AppText.b1?.copyWith(color: Colors.white),
                        );
                      },
                    )
                  ],
                ),
                _buildOrderRow("Subscription Id", "# 221"),
                _buildOrderRow("Package", packageName),
                _buildOrderRow("Payment ID", "212151554"),
                _buildOrderRow("Transaction ID", "11112222233333"),
              ],
            ),
          ),
          Space.yf(1.2),
          Text(
            "You can start customizing\nyour packages",
            style: AppText.b1b?.copyWith(color: AppColors.greyText),
            textAlign: TextAlign.center,
          ),
          Space.ym!,
          Padding(
            padding: Space.all(1.5, 1.5),
            child: customElevatedButton(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRouter.subscriptions,
                    (route) => route.isFirst,
                  );
                },
                text: "My Subscriptions",
                heightFraction: 20,
                width: double.infinity,
                color: AppColors.commonAmber),
          )
        ],
      ),
    );
  }

  _buildOrderRow(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: AppText.b1?.copyWith(color: Colors.white),
        ),
        Text(
          rightText,
          style: AppText.b1b?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
