import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';


class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, state) {
      if (state is Disconnected) {
        return RefreshIndicator(
          key: _refreshIndicatorKey,
          color: AppColors.deepTeal,
          backgroundColor: AppColors.commonAmber,
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
            // Trigger the reconnection attempt when pulled down
            state.onTryAgain;
          },
          child: Padding(
            padding: Space.hf(1.3),
            child: Column(
              children: [
                noConnection(),
                Space.ym!,
                customElevatedButton(
                    onTap: () {
                      _refreshIndicatorKey.currentState?.show();
                    },
                    text: "Try again".toUpperCase(),
                    heightFraction: 20,
                    width: double.infinity,
                    color: AppColors.commonAmber),
                Space.yf()
              ],
            ),
          ),
        );
      } else {
        return Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image.asset(
              AppAssets.adsPng,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
                bottom: AppDimensions.normalize(5),
                right: AppDimensions.normalize(2),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRouter.intro,
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Skip".toUpperCase(),
                      style: AppText.h3?.copyWith(color: Colors.white),
                    ))),
          ],
        );
      }
    }));
  }
}
