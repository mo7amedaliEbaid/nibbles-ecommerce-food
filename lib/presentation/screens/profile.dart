import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/application.dart';

import 'package:nibbles_ecommerce/configs/configs.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    context
        .read<GetKidsCubit>()
        .getKids(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

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
                  children: [
                    addKidContainer(context),
                    BlocBuilder<GetKidsCubit, GetKidsState>(
                        builder: (context, state) {
                      if (state is GetKidsLoaded && state.kids.isNotEmpty) {
                        return SizedBox(
                          width: AppDimensions.normalize(80),
                          height: AppDimensions.normalize(55),
                          child: ListView.separated(
                            itemCount: state.kids.length,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(
                                left: AppDimensions.normalize(6)),
                            itemBuilder: (context, index) {
                              return profileKidItem(
                                  kid: state.kids[index], context: context);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Space.xf();
                            },
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    })
                  ],
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
