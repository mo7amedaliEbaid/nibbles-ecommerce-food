import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/models/package.dart';

import '../../models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  final String userId;

  const FavoritesScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    context.read<FavoriteMealsCubit>().loadFavorites(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteMealsCubit>().loadFavorites(widget.userId);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          curvedlRecSvg(AppColors.deepTeal),
          positionedRow(context),
          positionedTitle("Favorites"),
          Positioned(
            top: AppDimensions.normalize(65),
            left: AppDimensions.normalize(10),
            child: Row(
              children: [
                _buildTabButton("Meals", 0),
                Space.x1!,
                _buildTabButton("Packages", 1),
              ],
            ),
          ),
          Positioned(
            top: AppDimensions.normalize(98),
            left: AppDimensions.normalize(7),
            right: AppDimensions.normalize(7),
            child: selectedIndex == 0
                ? BlocConsumer<FavoriteMealsCubit, FavoriteMealsState>(
                    listener: (context, state) {
                      context
                          .read<FavoriteMealsCubit>()
                          .loadFavorites(widget.userId);
                    },
                    builder: (context, state) {
                      if (state is FavoriteMealsLoaded) {
                        return _buildFavoriteMealsList(state.favoriteMeals);
                      } else if (state is FavoriteMealsError) {
                        return Center(
                          child: Text('Error: ${state.message}'),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )
                : BlocConsumer<FavouritePackagesCubit, FavoritesPackagesState>(
                    listener: (context, state) {
                      context
                          .read<FavouritePackagesCubit>()
                          .loadFavorites(widget.userId);
                    },
                    builder: (context, state) {
                      if (state is FavoritePackagesLoaded) {
                        return _buildFavoritePackagesList(
                            state.favouritePackages);
                      } else if (state is FavoritePackagesError) {
                        return Center(
                          child: Text('Error: ${state.message}'),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteMealsList(List<MealModel> favoriteMeals) {
    return SizedBox(
      height: AppDimensions.normalize(215),
      child: ListView.separated(
        padding: EdgeInsets.only(bottom: AppDimensions.normalize(12)),
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          final meal = favoriteMeals[index];

          return MealItem(mealModel: meal, isInVerticalList: true);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Space.yf(1.5);
        },
      ),
    );
  }

  Widget _buildFavoritePackagesList(List<PackageModel> favPackages) {
    return SizedBox(
      height: AppDimensions.normalize(215),
      child: ListView.separated(
        padding: EdgeInsets.only(
            left: AppDimensions.normalize(8),
            bottom: AppDimensions.normalize(8)),
        itemCount: favPackages.length,
        itemBuilder: (context, index) {
          final package = favPackages[index];

          return PackageItem(packageModel: package, isFromVerticalList: true);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Space.yf(1.5);
        },
      ),
    );
  }

  Widget _buildTabButton(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Material(
        elevation: 2,
        borderRadius:
            BorderRadius.all(Radius.circular(AppDimensions.normalize(5))),
        child: Container(
          height: AppDimensions.normalize(20),
          width: AppDimensions.normalize(46),
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? AppColors.commonAmber
                : AppColors.unselectedButtonColor,
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimensions.normalize(5))),
          ),
          child: Center(
            child: Text(
              text,
              style: AppText.h3b?.copyWith(color: AppColors.transparentColor),
            ),
          ),
        ),
      ),
    );
  }
}
