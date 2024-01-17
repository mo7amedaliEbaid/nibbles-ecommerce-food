import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/models/models.dart';
import '../../configs/configs.dart';
import '../../core/core.dart';
import 'dart:math' as math;

Widget kidItem(Kid kid, BuildContext context) {
  final random = math.Random();
  return Material(
    elevation: 1,
    borderRadius: BorderRadius.circular(AppDimensions.normalize(4)),
    child: GestureDetector(
      onTap: () {
        context.read<SelectKidCubit>().toggleKid(kid);
      },
      child: Container(
        width: AppDimensions.normalize(52),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppDimensions.normalize(4))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.kidsImages[random.nextInt(2)],
              height: AppDimensions.normalize(18),
            ),
            Space.yf(.3),
            Text(kid.name),
            Space.yf(.3),
            BlocBuilder<SelectKidCubit, SelectKidState>(
              builder: (context, state) {
                if (kid == state.selectedKid) {
                  return SvgPicture.asset(
                    AppAssets.checkedCircle,
                    colorFilter: const ColorFilter.mode(
                        AppColors.deepTeal, BlendMode.srcIn),
                  );
                } else {
                  return SvgPicture.asset(
                    AppAssets.checkCircle,
                    colorFilter: const ColorFilter.mode(
                        AppColors.greyText, BlendMode.srcIn),
                  );
                }
              },
            )
          ],
        ),
      ),
    ),
  );
}
