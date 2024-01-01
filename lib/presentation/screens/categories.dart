import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/core.dart';



import '../../application/application.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppDimensions.normalize(560),
          child: Stack(
            children: [
              curvedlRecSvg(AppColors.antiqueRuby),
              positionedWhiteLogo(),
              positionedTitle("Meals".toUpperCase()),
              Positioned(
                top: AppDimensions.normalize(60),
                bottom: -AppDimensions.normalize(8),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: Space.h1,
                  child: BlocBuilder<CategoriesBloc, CategoriesState>(
                    builder: (context, state) {
                      if (state is CategoriesLoading) {
                        return const Center(
                          child: LoadingTicker(
                            text: AppStrings.loading,
                          ),
                        );
                      }
                      if (state is CategoriesLoaded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int index = 0;
                                index < state.categories.length;
                                index++)
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      AppRouter.meals,
                                      arguments: state.categories[index]);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: AppDimensions.normalize(9),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        AppAssets.categoriesImages[index],
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
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
                                              state.categories[index]
                                                  .categoryname,
                                              style: AppText.h3b?.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
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
        ),
      ),
    );
  }
}
