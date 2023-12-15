import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/blocs/user_bloc/user_bloc.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/configs/space.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/presentation/widgets/top_rec_components.dart';

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
              child: Container(
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
                                Text(state.user.fullName,style: AppText.h2b,),
                                Space.yf(.4),
                                Text(state.user.email,style: AppText.b1b?.copyWith(color: AppColors.antiqueRuby),),
                                Space.yf(.6),
                                Text(state.user.phoneNumber,style: AppText.b1b?.copyWith(color: AppColors.antiqueRuby),),
                              ],
                            ),
                            Space.xf(2.5),
                          ],
                        ),
                        Space.yf(2),
                        Divider(color: AppColors.greyText,)
                      ],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
