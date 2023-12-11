import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/cubits/search/search_cubit.dart';
import 'package:nibbles_ecommerce/configs/space.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';
import 'package:nibbles_ecommerce/presentation/screens/meal_details.dart';
import 'package:nibbles_ecommerce/presentation/widgets/custom_elevated_button.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meal_item.dart';

import '../../configs/app_dimensions.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  QrCodeScreenState createState() => QrCodeScreenState();
}

class QrCodeScreenState extends State<QrCodeScreen> {
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;
    final _scanQrcode = barcodeScanRes.hashCode.toString();
    context.read<SearchCubit>().searchMealsByQrCode(_scanQrcode);
    log(_scanQrcode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BlocListener<SearchCubit, SearchState>(
          listener: (context, state) {
            if (state is MealsSearchSuccess) {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppDimensions.normalize(10)),
                ),
                backgroundColor: AppColors.lightGrey,
                constraints: BoxConstraints(
                    minHeight: AppDimensions.normalize(150),
                    maxWidth: double.infinity),
                builder: (BuildContext context) {
                  return state.meals.isNotEmpty
                      ? SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: AppDimensions.normalize(7),
                              right: AppDimensions.normalize(3),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Space.yf(1.2),
                                    IconButton(onPressed: (){
                                      Navigator.of(context).pop();
                                    }, icon: const Icon(Icons.clear))
                                  ],
                                ),
                                SizedBox(
                                  width: AppDimensions.normalize(147),
                                  child: MealItem(
                                    mealModel: state.meals.first,
                                    isInVerticalList: true,
                                  ),
                                ),
                                Space.yf(2),
                                Padding(
                                  padding:  EdgeInsets.only(right: AppDimensions.normalize(4)),
                                  child: customElevatedButton(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MealDetailsScreen(
                                                        mealModel:
                                                            state.meals.first)));
                                      },
                                      text: "View Details".toUpperCase(),
                                      heightFraction: 22,
                                      width: double.infinity,
                                      color: AppColors.commonAmber),
                                ),
                                Space.yf(6),
                              ],
                            ),
                          ))
                      : Text("Error");
                },
              );
            }
          },
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                      onTap: () => scanQR(),
                      child: Image.asset(AppAssets.qrPng)),
                  /* OutlinedButton(
                    onPressed: () => scanQR(),
                    child: const Text('Start QR scan')),*/
                ]),
          ),
        ),
      ),
    );
  }
}
