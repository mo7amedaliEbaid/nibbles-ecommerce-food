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
    Future.delayed(const Duration(seconds: 0), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.root,
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
      backgroundColor: AppColors.commonAmber,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.splashPng,
            fit: BoxFit.fitWidth,

          ),

          Positioned(
            bottom: AppDimensions.normalize(200),
            left: AppDimensions.normalize(70),
            child: const CircularProgressIndicator(
              color: AppColors.deepTeal,
            ),
          ),
        ],
      ),
    );
  }
}
