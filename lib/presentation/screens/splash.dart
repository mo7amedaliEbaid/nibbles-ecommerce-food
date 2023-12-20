import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';

import '../../configs/app.dart';
import '../../configs/app_dimensions.dart';
import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _nextScreen() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.ads,
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nextScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.splashPng,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            bottom: AppDimensions.normalize(205),
            child: const CircularProgressIndicator(
              color: AppColors.deepTeal,
            ),
          ),
        ],
      ),
    );
  }
}
