import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/core/constants/strings.dart';
import 'package:nibbles_ecommerce/presentation/widgets/package_item.dart';

import '../../application/blocs/packages/packages_bloc.dart';
import 'tickers.dart';

Widget packagesHorizontaList() {
  return BlocBuilder<PackagesBloc, PackagesState>(builder: (context, state) {
    if (state is PackagesLoaded) {
      return ListView.builder(
          itemCount: state.packages.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(
            left: AppDimensions.normalize(15),
            right: AppDimensions.normalize(15),
          ),
          itemBuilder: (context, index) {
            return PackageItem(
              isFromVerticalList: false,
              packageModel: state.packages[index],
            );
          });
    } else {
      return const LoadingTicker(text: AppStrings.loading,);
    }
  });
}
