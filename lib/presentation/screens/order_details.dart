import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/extensions/extensions.dart';
import 'package:nibbles_ecommerce/models/order.dart';
import 'package:nibbles_ecommerce/presentation/widgets/common_border_radius.dart';
import 'package:nibbles_ecommerce/presentation/widgets/top_rec_components.dart';

import '../../core/constants/assets.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/order_calendar.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    log(orderModel.date.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppDimensions.normalize(144),
              child: Stack(
                children: [
                  curvedlRecSvg(AppColors.deepTeal),
                  positionedRow(context),
                  Positioned(
                    top: AppDimensions.normalize(40),
                    left: AppDimensions.normalize(10),
                    right: AppDimensions.normalize(10),
                    child: Material(
                      elevation: 2,
                      borderRadius: maxBorderRadius,
                      child: Container(
                        width: double.infinity,
                        height: AppDimensions.normalize(90),
                        padding: Space.all(1.5, 1.5),
                        decoration: BoxDecoration(
                            color: Colors.white, borderRadius: maxBorderRadius),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppAssets.kid2,
                                  height: AppDimensions.normalize(15),
                                ),
                                Space.xf(.7),
                                Text(
                                  orderModel.kidName.capitalize(),
                                  style: AppText.b1,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      orderModel.packageName.toUpperCase(),
                                      style: AppText.h3
                                          ?.copyWith(letterSpacing: 1.7),
                                    ),
                                    Space.yf(.2),
                                    Text(
                                      "PRICE: ${orderModel.totalPrice.toUpperCase().substring(0, 3)} KWD",
                                      style: AppText.b1b
                                          ?.copyWith(color: AppColors.deepTeal),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${orderModel.totalPrice.toUpperCase().substring(9, 17)}\n${orderModel.totalPrice.toUpperCase().substring(17, 24)}",
                                  style: AppText.h3?.copyWith(height: 1.5),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Active",
                                  style: AppText.h2b
                                      ?.copyWith(color: AppColors.deepTeal),
                                ),
                                customElevatedButton(
                                    onTap: () {

                                    },
                                    text: "Pause",
                                    heightFraction: 15,
                                    width: AppDimensions.normalize(35),
                                    color: AppColors.commonAmber,
                                    radiusFraction: 4)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            OrderCalendar(
              selectedDate: orderModel.date,
            ),
          ],
        ),
      ),
    );
  }
}
