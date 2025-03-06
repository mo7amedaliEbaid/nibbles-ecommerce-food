import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:nibbles_ecommerce/configs/configs.dart';

import 'package:nibbles_ecommerce/core/functions/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppDimensions.normalize(150),
              child: Stack(
                children: [
                  curvedlRecSvg(AppColors.deepTeal),
                  positionedRow(context),
                  positionedTitle("Contact".toUpperCase()),
                  Positioned(
                    top: AppDimensions.normalize(62),
                    right: AppDimensions.normalize(10),
                    left: AppDimensions.normalize(10),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Material(
                          borderRadius: maxBorderRadius,
                          elevation: 1,
                          child: Container(
                            height: AppDimensions.normalize(67),
                            width: double.infinity,
                            padding: Space.all(1.3, 1.9),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: maxBorderRadius),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppAssets.customerService,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.deepTeal, BlendMode.srcIn),
                                ),
                                SizedBox(
                                  // height: AppDimensions.normalize(23),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      for (var i = 0;
                                          i < AppStrings.contactInfo.length;
                                          i++)
                                        Padding(
                                          padding: Space.vf(.6),
                                          child: Row(
                                            children: [
                                              Space.xf(.8),
                                              SvgPicture.asset(
                                                AppAssets.contactSvg[i],
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        AppColors.antiqueRuby,
                                                        BlendMode.srcIn),
                                              ),
                                              Space.xf(.8),
                                              customUnderLinedText(
                                                AppText.b1,
                                                AppStrings.contactInfo[i],
                                                false,
                                              )
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -AppDimensions.normalize(7),
                          // left: AppDimensions.normalize(20),
                          //right: AppDimensions.normalize(20),

                          child: SizedBox(
                            width: AppDimensions.normalize(67),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (var i = 0;
                                    i < AppStrings.socialUrls.length;
                                    i++)
                                  GestureDetector(
                                    onTap: () async {
                                      await UrlFunctions.openUrl(
                                          AppStrings.socialUrls[i]);
                                    },
                                    child:
                                        Image.asset(AppAssets.socialImages[i]),
                                  ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const ContactMessageForm()
          ],
        ),
      ),
    );
  }
}
