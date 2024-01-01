import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:nibbles_ecommerce/configs/configs.dart';


class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / .62,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: SvgPicture.asset(
                      AppAssets.curvedRec,
                      colorFilter: const ColorFilter.mode(
                          AppColors.antiqueRuby, BlendMode.srcIn),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: AppDimensions.normalize(25),
                    child: SvgPicture.asset(
                      AppAssets.nibblesLogo,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  Positioned(
                    top: AppDimensions.normalize(47),
                    child: SizedBox(
                      height: AppDimensions.normalize(1000),
                      width: MediaQuery.sizeOf(context).width,
                      child: GridView.builder(
                        itemCount: 10,
                        padding: Space.hf(),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: AppDimensions.normalize(9),
                          mainAxisSpacing: AppDimensions.normalize(11),
                          childAspectRatio: .87,
                        ),
                        itemBuilder: (context, index) {
                          return Material(
                            elevation: 2,
                            borderRadius: BorderRadius.only(
                              topLeft:
                                  Radius.circular(AppDimensions.normalize(10)),
                              topRight:
                                  Radius.circular(AppDimensions.normalize(18)),
                              bottomRight:
                                  Radius.circular(AppDimensions.normalize(10)),
                              bottomLeft:
                                  Radius.circular(AppDimensions.normalize(30)),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(AppRouter.moreScreenTaps[index],arguments: FirebaseAuth.instance.currentUser!.uid,);
                              },
                              child: Container(
                                padding: Space.hf(1.2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        AppDimensions.normalize(10)),
                                    topRight: Radius.circular(
                                        AppDimensions.normalize(18)),
                                    bottomRight: Radius.circular(
                                        AppDimensions.normalize(10)),
                                    bottomLeft: Radius.circular(
                                        AppDimensions.normalize(30)),
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Space.yf(3.4),
                                      SvgPicture.asset(
                                        AppAssets.moreScreenItems[index],
                                        colorFilter: const ColorFilter.mode(
                                            AppColors.deepTeal,
                                            BlendMode.srcIn),
                                      ),
                                      Space.yf(),
                                      Text(
                                        AppStrings.moreScreenStrings[index],
                                        style: AppText.h3,
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension CutOverflowText on Text {
  Widget cutOverflowText() {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Flexible(
            child: this,
          ),
        ],
      ),
    );
  }
}
