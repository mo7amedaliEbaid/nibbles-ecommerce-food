import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/blocs/auth_bloc/auth_bloc.dart';
import 'package:nibbles_ecommerce/application/blocs/user_bloc/user_bloc.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/configs/space.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';
import 'package:nibbles_ecommerce/presentation/widgets/custom_elevated_button.dart';
import 'package:nibbles_ecommerce/presentation/widgets/top_rec_components.dart';

import '../widgets/common_border_radius.dart';
import '../widgets/kids_components.dart';
import '../widgets/profile_components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          curvedlRecSvg(AppColors.deepTeal),
          positionedRow(context),
          positionedTitle("My Profile".toUpperCase()),
          Positioned(
            top: AppDimensions.normalize(62),
            left: AppDimensions.normalize(8),
            right: AppDimensions.normalize(8),
            child: Material(
              elevation: 2,
              borderRadius: profileBorderRadius,
              child: Stack(
                children: [
                  Container(
                    height: AppDimensions.normalize(100),
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: profileBorderRadius),
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return Column(
                          children: [
                            Space.yf(2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                profileSvgStack(),
                                Space.xf(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.user.fullName,
                                      style: AppText.h2b,
                                    ),
                                    Space.yf(.4),
                                    Text(
                                      state.user.email,
                                      style: AppText.b1?.copyWith(
                                          color: AppColors.antiqueRuby),
                                    ),
                                    Space.yf(.6),
                                    Text(
                                      state.user.phoneNumber,
                                      style: AppText.b1?.copyWith(
                                          color: AppColors.antiqueRuby),
                                    ),
                                  ],
                                ),
                                Space.xf(2.5),
                              ],
                            ),
                            Space.yf(2),
                            const Divider(
                              color: AppColors.greyText,
                            ),
                            Space.yf(.7),
                            Row(
                              children: [
                                Space.xf(2),
                                customElevatedButton(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed(AppRouter.addresses);
                                    },
                                    text: "My Address",
                                    heightFraction: 18,
                                    width: AppDimensions.normalize(40),
                                    color: AppColors.antiqueRuby,
                                    withSmallText: true,
                                    textColor: Colors.white),
                                Space.xf(1),
                                customElevatedButton(
                                  onTap: () {},
                                  text: "Change Password",
                                  heightFraction: 18,
                                  width: AppDimensions.normalize(48),
                                  color: AppColors.commonAmber,
                                  withSmallText: true,
                                )
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  Positioned(bottom: 0, right: 0, child: editSvg())
                ],
              ),
            ),
          ),
          Positioned(
            top: AppDimensions.normalize(175),
            left: AppDimensions.normalize(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "My Kids".toUpperCase(),
                  style: AppText.h1b,
                ),
                Space.yf(.7),
                Row(
                  children: [addKidContainer(context)],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: AppDimensions.normalize(8),
            left: AppDimensions.normalize(8),
            right: AppDimensions.normalize(8),
            child: customElevatedButton(
              onTap: () {
                context.read<AuthBloc>().add(SignOutRequestedEvent());
                Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRouter.splash,
                  (route) => false,
                );
              },
              text: "Logout".toUpperCase(),
              heightFraction: 20,
              width: AppDimensions.normalize(90),
              color: AppColors.commonAmber,
            ),
          )
        ],
      ),
    );
  }
}
