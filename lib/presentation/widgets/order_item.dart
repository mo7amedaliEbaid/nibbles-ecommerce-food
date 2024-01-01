import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';
import 'package:nibbles_ecommerce/models/order.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';

import '../../core/constants/assets.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.orderModel});

  final OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.normalize(120),
      child: Stack(
        children: [
          Column(
            children: [
              Space.yf(3.5),
              Stack(
                children: [
                  Container(
                    height: AppDimensions.normalize(97),
                    width: AppDimensions.normalize(120),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: packageBorderRadius,
                    ),
                  ),
                  Positioned(
                    top: AppDimensions.normalize(48),
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Padding(
                          padding: Space.hf(1.3),
                          child: Row(
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
                        ),
                        Space.yf(.8),
                        Padding(
                          padding: Space.hf(1.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Active",
                                style: AppText.h2b
                                    ?.copyWith(color: AppColors.deepTeal),
                              ),
                              customElevatedButton(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        AppRouter.orderDetails,
                                        arguments: orderModel);
                                  },
                                  text: "View",
                                  heightFraction: 15,
                                  width: AppDimensions.normalize(35),
                                  color: AppColors.commonAmber,
                                  radiusFraction: 4)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: AppDimensions.normalize(9),
            child: Image.asset(
              AppAssets.packagesPng,
              width: AppDimensions.normalize(90),
            ),
          ),
        ],
      ),
    );
  }
}
