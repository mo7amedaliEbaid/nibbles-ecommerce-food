import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';

import '../../application/blocs/categories/categories_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Stack(
              children: [
                SvgPicture.asset(
                  AppAssets.curvedRec,
                  colorFilter: const ColorFilter.mode(
                      AppColors.antiqueRuby, BlendMode.srcIn),
                  height: AppDimensions.normalize(145),
                  width: AppDimensions.normalize(170),
                ),
                Positioned(
                  top: AppDimensions.normalize(18),
                  right: AppDimensions.normalize(15),
                  child: SvgPicture.asset(
                    AppAssets.nibblesLogo,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
                Positioned(
                  top: AppDimensions.normalize(47),
                  left: AppDimensions.normalize(8),
                  child:Text("Meals".toUpperCase(),style: AppText.h2b?.copyWith(color: Colors.white),)
                ),
              ],
            ),
          ),
          Positioned(
            top: AppDimensions.normalize(65),
            bottom: -AppDimensions.normalize(8),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
           //   height: AppDimensions.normalize(80),
              padding: Space.h1,
              child: BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CategoriesLoaded) {
                    return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                //      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.only(bottom: AppDimensions.normalize(9)),
                          child: Stack(
                            children: [
                              Image.asset(AppAssets.categoriesImages[index]),
                              Positioned(
                                  bottom: 0,
                                  right: AppDimensions.normalize(5),
                                  child: Container(
                                    //  padding: Space.all(),
                                    width: AppDimensions.normalize(48),
                                    height: AppDimensions.normalize(19),
                                    decoration: BoxDecoration(
                                      color: AppColors.deepTeal,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                          AppDimensions.normalize(6),
                                        ),
                                        bottomRight: Radius.circular(
                                          AppDimensions.normalize(8),
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        state.categories[index].categoryname,
                                        style: AppText.h3b
                                            ?.copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text("Error"),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
