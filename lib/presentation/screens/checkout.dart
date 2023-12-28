import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/extensions/extensions.dart';
import 'package:nibbles_ecommerce/models/kid.dart';
import 'package:nibbles_ecommerce/models/package.dart';
import 'dart:math' as math;
import 'package:nibbles_ecommerce/presentation/widgets/top_rec_components.dart';

import '../../core/constants/assets.dart';
import '../widgets/common_border_radius.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen(
      {super.key, required this.packageModel, required this.kid});

  final PackageModel packageModel;
  final Kid kid;

  @override
  Widget build(BuildContext context) {
    final random = math.Random();

    return Scaffold(
      body: Stack(
        children: [
          curvedlRecSvg(AppColors.deepTeal),
          positionedRow(context),
          positionedTitle("Checkout".toUpperCase()),
          Positioned(
              top: AppDimensions.normalize(63),
              left: AppDimensions.normalize(10),
              child: Text(
                "Your Order",
                style: AppText.h3b?.copyWith(color: Colors.white),
              )),
          Positioned(
              top: AppDimensions.normalize(77),
              left: AppDimensions.normalize(10),
              right: AppDimensions.normalize(10),
              child: Material(
                borderRadius: profileBorderRadius,
                elevation: 2,
                child: Container(
                  height: AppDimensions.normalize(67),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: profileBorderRadius,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Space.yf(.8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Space.xf(),
                          Image.asset(
                            AppAssets.mealsPng[random.nextInt(4)],
                            height: AppDimensions.normalize(24),
                          ),
                          Space.xf(.8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                packageModel.name.toUpperCase(),
                                style: AppText.h2,
                              ),
                              Text(packageModel.price.toUpperCase()),
                              Space.yf(.4),
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.kidsImages[random.nextInt(2)],
                                    height: AppDimensions.normalize(12),
                                  ),
                                  Space.xf(.5),
                                  Text(kid.name.capitalize())
                                ],
                              ),
                              Space.yf(.8),
                            ],
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                          color: AppColors.antiqueRuby,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Starting Date :".capitalize(),style: AppText.h3b?.copyWith(color: Colors.white),),
                              Space.xf(1.5),
                              Container(
                                height: AppDimensions.normalize(12),
                                width: AppDimensions.normalize(50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppDimensions.normalize(4)),
                                  border: Border.all(color: AppColors.commonAmber)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text("Select Date",style: TextStyle(color: Colors.white),),
                                    Icon(Icons.calendar_month,size: AppDimensions.normalize(7),color: Colors.white,)
                                  ],
                                ),
                              )
                            ],
                          ),

                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
