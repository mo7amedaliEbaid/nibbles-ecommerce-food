import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';

import '../widgets/top_rec_components.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          curvedlRecSvg(AppColors.deepTeal),
          positionedRow(context),
          positionedTitle("Offers".toUpperCase()),
          Positioned(
            top: AppDimensions.normalize(60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...AppAssets.offersPng.map(
                  (offer) => Padding(
                    padding: Space.all(1.2, .5),
                    child: Image.asset(offer),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
