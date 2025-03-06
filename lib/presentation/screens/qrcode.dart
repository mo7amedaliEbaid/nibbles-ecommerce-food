import 'dart:developer';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/application.dart';

import '../../configs/configs.dart';

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
    // I was using Material app here to make the bottom sheet
    // behind the bottom navigation bar
    // but i changed my mind
    return /*MaterialApp(
      debugShowCheckedModeBanner: false,
      home: */
        Scaffold(
      body: Stack(
        children: [
          curvedlRecSvg(AppColors.antiqueRuby),
          positionedWhiteLogo(),
          positionedTitle("Scan your code".toUpperCase()),
          Positioned(
            top: AppDimensions.normalize(70),
            left: 0,
            right: 0,
            child: BlocListener<SearchCubit, SearchState>(
              listener: (context, state) {
                if (state is MealsSearchSuccess) {
                  showQrScanResultBottomSheet(context, state.meals);
                } else if (state is SearchFailure) {
                  showQrScanResultBottomSheet(context, []);
                }
              },
              child: Stack(alignment: Alignment.center, children: <Widget>[
                InkWell(
                    onTap: () => scanQR(), child: Image.asset(AppAssets.qrPng)),
                Positioned(
                    top: AppDimensions.normalize(20), child: TapToScanTicker()),
              ]),
            ),
          ),
        ],
      ),
      //  ),
    );
  }
}
