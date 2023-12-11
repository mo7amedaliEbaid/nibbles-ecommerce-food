import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/blocs/packages/packages_bloc.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/presentation/widgets/package_item.dart';
import 'package:nibbles_ecommerce/presentation/widgets/packages_vertical_list.dart';
import 'package:nibbles_ecommerce/presentation/widgets/top_rec_components.dart';

import '../../configs/app_dimensions.dart';
import '../widgets/tickers.dart';

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
