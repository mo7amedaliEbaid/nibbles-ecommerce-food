import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';

import 'package:nibbles_ecommerce/models/order.dart';
import 'package:nibbles_ecommerce/models/package.dart';

import 'dart:math' as math;


class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen(
      {super.key, required this.packageModel, required this.addressTitle});

  final PackageModel packageModel;
  final String addressTitle;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  DateTime selectedDate = DateTime.now();
  bool dateChosen = false;
  final TextEditingController controller = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        dateChosen = true;
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final random = math.Random();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppDimensions.normalize(150),
              child: Stack(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.packageModel.name.toUpperCase(),
                                        style: AppText.h2,
                                      ),
                                      Text(widget.packageModel.price
                                          .toUpperCase()),
                                      Space.yf(.4),
                                      Row(
                                        children: [
                                          Image.asset(
                                            AppAssets
                                                .kidsImages[random.nextInt(2)],
                                            height: AppDimensions.normalize(12),
                                          ),
                                          Space.xf(.5),
                                          BlocBuilder<SelectKidCubit,
                                              SelectKidState>(
                                            builder: (context, state) {
                                              return Text(state
                                                      .selectedKid?.name
                                                      .capitalize() ??
                                                  "");
                                            },
                                          )
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
                                      Text(
                                        "Starting Date :".capitalize(),
                                        style: AppText.h3b
                                            ?.copyWith(color: Colors.white),
                                      ),
                                      Space.xf(1.5),
                                      GestureDetector(
                                        onTap: () => _selectDate(context),
                                        child: Container(
                                          height: AppDimensions.normalize(12),
                                          width: AppDimensions.normalize(50),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppDimensions.normalize(
                                                          4)),
                                              border: Border.all(
                                                  color:
                                                      AppColors.commonAmber)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                dateChosen
                                                    ? "${selectedDate.toLocal()}"
                                                        .split(' ')[0]
                                                    : "Select Date",
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Icon(
                                                Icons.calendar_month,
                                                size:
                                                    AppDimensions.normalize(7),
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
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
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.normalize(10),
                top: AppDimensions.normalize(7),
                bottom: AppDimensions.normalize(5),
              ),
              child: Text(
                "Things you may like to add".toUpperCase(),
                style: AppText.h3,
              ),
            ),
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoaded && state.products.isNotEmpty) {
                  return SizedBox(
                    height: AppDimensions.normalize(80),
                    child: ListView.separated(
                      itemCount: state.products.length,
                      scrollDirection: Axis.horizontal,
                      padding: Space.hf(1.5),
                      itemBuilder: (context, index) {
                        return productItem(state.products[index]);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Space.xf();
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: LoadingTicker(text: AppStrings.loading),
                  );
                }
              },
            ),
            Space.yf(1.3),
            couponContainer(controller),
            Space.yf(1.3),
            pricesContainer(widget.packageModel),
            Space.yf(1.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...AppAssets.paymentPng.map((e) => Padding(
                      padding:
                          EdgeInsets.only(right: AppDimensions.normalize(4)),
                      child: Image.asset(
                        e,
                        height: AppDimensions.normalize(13),
                      ),
                    ))
              ],
            ),
            Space.yf(),
            BlocBuilder<SelectKidCubit, SelectKidState>(
              builder: (context, kidState) {
                return Padding(
                  padding: Space.all(1.3, 1),
                  child: BlocBuilder<PlaceOrderCubit, PlaceOrderState>(
                    builder: (context, orderState) {
                      return customElevatedButton(
                          onTap: () {
                            OrderModel order = OrderModel(
                                addressTitle: widget.addressTitle,
                                date: selectedDate,
                                kidName: kidState.selectedKid?.name ?? "",
                                packageName: widget.packageModel.name,
                                totalPrice: widget.packageModel.price);
                            context.read<PlaceOrderCubit>().placeOrder(order);
                            //  if (orderState is OrderPlacedSuccessfully) {
                            Navigator.of(context).pushNamed(
                                AppRouter.successfulOrder,
                                arguments: widget.packageModel.name);
                            //  }
                          },
                          text: (orderState is PlaceOrderLoading)
                              ? AppStrings.wait
                              : "Place An Order".toUpperCase(),
                          heightFraction: 20,
                          width: double.infinity,
                          color: AppColors.commonAmber);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
