import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';
import 'package:nibbles_ecommerce/models/package.dart';



class PackageItem extends StatelessWidget {
  const PackageItem(
      {super.key,
      required this.isFromVerticalList,
      required this.packageModel});

  final PackageModel packageModel;
  final bool isFromVerticalList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.normalize(120),
      child: Padding(
        padding: isFromVerticalList
            ? EdgeInsets.only(bottom: AppDimensions.normalize(9))
            : EdgeInsets.only(right: AppDimensions.normalize(7)),
        child: Stack(
          children: [
            Column(
              children: [
                Space.yf(3.5),
                Stack(
                  children: [
                    Container(
                      height: AppDimensions.normalize(100),
                      width: AppDimensions.normalize(120),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: packageBorderRadius),
                    ),
                    Positioned(
                      top: AppDimensions.normalize(48),
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            packageModel.name.toUpperCase(),
                            style: AppText.h3?.copyWith(letterSpacing: 1.7),
                          ),
                          Space.yf(.4),
                          Text(
                            packageModel.items,
                            style: AppText.b1?.copyWith(
                              color: AppColors.deepTeal,
                            ),
                          ),
                          Space.yf(.6),
                          Text(
                            packageModel.price.toUpperCase(),
                            style: AppText.h3,
                          ),
                          Space.yf(.6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                AppAssets.percent,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.antiqueRuby, BlendMode.srcIn),
                                height: AppDimensions.normalize(10),
                              ),
                              Space.xf(.3),
                              Text(
                                packageModel.oldPrice.toUpperCase(),
                                style: AppText.h3?.copyWith(
                                    color: AppColors.antiqueRuby,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness:
                                        AppDimensions.normalize(1.5)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: BlocBuilder<UserBloc, UserState>(
                        builder: (context, userState) {
                          return userState.user.id != null
                              ? GestureDetector(
                                  onTap: () {
                                    context
                                        .read<FavouritePackagesCubit>()
                                        .toggleFavorite(
                                            userState.user.id!, packageModel);
                                  },
                                  child: BlocBuilder<FavouritePackagesCubit,
                                      FavoritesPackagesState>(
                                    builder: (context, favState) {
                                      if (favState is FavoritePackagesLoaded) {
                                        final isFavorite = favState
                                            .favouritePackages
                                            .any((favouritePackage) =>
                                                favouritePackage.id ==
                                                packageModel.id);
                                        return LeftFavIconStack(
                                          isFilled: isFavorite,
                                        );
                                      } else {
                                        return LeftFavIconStack(
                                          isFilled: false,
                                        );
                                      }
                                    },
                                  ),
                                )
                              : LeftFavIconStack(
                                  isFilled: false,
                                );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRouter.selectKid,
                              arguments: packageModel);
                        },
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              AppAssets.rightIconRec,
                              colorFilter: const ColorFilter.mode(
                                  AppColors.deepTeal, BlendMode.srcIn),
                            ),
                            Positioned(
                              right: AppDimensions.normalize(4),
                              top: AppDimensions.normalize(1),
                              bottom: 0,
                              child: SvgPicture.asset(
                                AppAssets.cartWhite,
                                colorFilter: const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: AppDimensions.normalize(9),
              child: Image.asset(
                AppAssets.packagesPng,
                width: AppDimensions.normalize(90),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
