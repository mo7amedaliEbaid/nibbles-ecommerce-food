import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import '../../configs/configs.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // height: MediaQuery.sizeOf(context).height,
        // width: 400,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height / .49,
            //width: 400,
            child: Stack(
              children: [
                curvedlRecSvg(AppColors.antiqueRuby),
                positionedWhiteLogo(),
                positionedTitle("Packages".toUpperCase()),
                Positioned(
                    top: AppDimensions.normalize(62),
                    left: AppDimensions.normalize(16),
                    child: packagesList())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
