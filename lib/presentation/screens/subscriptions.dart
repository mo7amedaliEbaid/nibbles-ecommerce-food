import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';

class SubscriptionsScreen extends StatefulWidget {
  const SubscriptionsScreen({super.key});

  @override
  State<SubscriptionsScreen> createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends State<SubscriptionsScreen> {
  @override
  void initState() {
    context
        .read<GetOrdersCubit>()
        .getOrders(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          curvedlRecSvg(AppColors.deepTeal),
          positionedRow(context),
          positionedTitle("Subscriptions".toUpperCase()),
          Positioned(
              top: AppDimensions.normalize(70),
              left: AppDimensions.normalize(1),
              right: AppDimensions.normalize(1),
              child: BlocBuilder<GetOrdersCubit, GetOrdersState>(
                builder: (context, state) {
                  if (state is GetOrdersLoaded && state.orders.isNotEmpty) {
                    return SizedBox(
                      height: AppDimensions.normalize(235),
                      child: ListView.separated(
                        itemCount: state.orders.length,
                        padding:
                            EdgeInsets.only(left: AppDimensions.normalize(15)),
                        itemBuilder: (context, index) {
                          return OrderItem(orderModel: state.orders[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Space.yf();
                        },
                      ),
                    );
                  } else if (state is GetOrdersLoading) {
                    return const Center(
                      child: LoadingTicker(text: AppStrings.loading),
                    );
                  } else if (state is GetOrdersLoaded && state.orders.isEmpty) {
                    return Center(
                      child: Column(
                        children: [
                          Space.yf(6),
                          SvgPicture.asset(
                            AppAssets.subscriptions,
                            colorFilter: const ColorFilter.mode(
                                AppColors.commonAmber, BlendMode.srcIn),
                          ),
                          Space.y2!,
                          Text(
                            "No active subscription".capitalize(),
                            style: AppText.h3b,
                          ),
                          Space.y1!,
                          Text(
                            "There Is no active subscription\nfor your kids"
                                .capitalize(),
                            style: AppText.b1,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  } else if (state is GetOrdersError) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: AppText.b2b?.copyWith(color: Colors.red),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ))
        ],
      ),
    );
  }
}
