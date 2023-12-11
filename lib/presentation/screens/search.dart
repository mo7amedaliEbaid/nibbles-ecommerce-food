import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/application/cubits/search/search_cubit.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meal_item.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meals_vertical_listview.dart';
import 'package:nibbles_ecommerce/presentation/widgets/package_item.dart';
import 'package:nibbles_ecommerce/presentation/widgets/top_rec_components.dart';

import '../widgets/packages_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _mealsSearchController = TextEditingController();
  final TextEditingController _packagesSearchController =
      TextEditingController();
  int selectedIndex = 0;

  @override
  void dispose() {
    _mealsSearchController.dispose();
    _packagesSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height / .7,
        child: Stack(
          children: [
            curvedlRecSvg(AppColors.deepTeal),
            positionedRow(context),
            positionedTitle("SEARCH"),
            Positioned(
              top: AppDimensions.normalize(67),
              left: AppDimensions.normalize(2),
              child: Padding(
                padding: Space.hf(),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(
                    AppDimensions.normalize(7),
                  ),
                  child: Container(
                    height: AppDimensions.normalize(22),
                    width: AppDimensions.normalize(130),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        AppDimensions.normalize(7),
                      ),
                    ),
                    child: Center(
                      child: TextField(
                        controller: selectedIndex == 0
                            ? _mealsSearchController
                            : _packagesSearchController,
                        onSubmitted: (value) {
                          if (selectedIndex == 0) {
                            final searchQuery = _mealsSearchController.text
                                .trim()
                                .toLowerCase();
                            context
                                .read<SearchCubit>()
                                .searchMeals(searchQuery);
                          } else {
                            final searchQuery = _packagesSearchController.text
                                .trim()
                                .toLowerCase();
                            context
                                .read<SearchCubit>()
                                .searchPackages(searchQuery);
                          }
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Search Here",
                          labelStyle:
                              AppText.b2?.copyWith(color: AppColors.greyText),
                          prefixIcon: Padding(
                            padding: Space.all(.5, .8),
                            child: SvgPicture.asset(AppAssets.search),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: AppDimensions.normalize(100),
              left: AppDimensions.normalize(10),
              child: Row(
                children: [
                  buildTabButton("Meals", 0),
                  Space.x1!,
                  buildTabButton("Packages", 1),
                ],
              ),
            ),
            Positioned(
                top: AppDimensions.normalize(120),
                // left: AppDimensions.normalize(10),
                child: selectedIndex == 0
                    ? BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is MealsSearchSuccess) {
                            return state.meals.isEmpty
                                ? Padding(
                                    padding: Space.all(6, 8),
                                    child: Text(
                                      "No Items Found".toUpperCase(),
                                      style: AppText.h2b?.copyWith(
                                          color: AppColors.antiqueRuby),
                                    ),
                                  )
                                : Container(
                                    width:
                                        MediaQuery.sizeOf(context).width / 1.07,
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.normalize(9)),
                                    child: MealItem(
                                      mealModel: state.meals[0],
                                      isInVerticalList: true,
                                    ),
                                  );
                          } else if (state is SearchLoading) {
                            return const SizedBox();
                          } else {
                            return SizedBox(
                                height: MediaQuery.sizeOf(context).height / 1.6,
                                width: MediaQuery.sizeOf(context).width,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: AppDimensions.normalize(4)),
                                  child: const MealsVerticalListview(),
                                ));
                          }
                        },
                      )
                    : BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          if (state is PackagesSearchSuccess) {
                            return state.packages.isEmpty
                                ? Padding(
                                    padding: Space.all(6, 8),
                                    child: Text(
                                      "No Items Found".toUpperCase(),
                                      style: AppText.h2b?.copyWith(
                                          color: AppColors.antiqueRuby),
                                    ),
                                  )
                                : Container(
                                    /*width:
                                        MediaQuery.sizeOf(context).width,*/
                                    margin: EdgeInsets.only(
                                        left: AppDimensions.normalize(15),
                                        top: AppDimensions.normalize(15)),
                                    child: PackageItem(
                                      isFromVerticalList: true,
                                      packageModel: state.packages[0],
                                    ),
                                  );
                          } else if (state is SearchLoading) {
                            return const SizedBox();
                          } else {
                            return SizedBox(
                                height: MediaQuery.sizeOf(context).height / 1.6,
                                width: MediaQuery.sizeOf(context).width,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: AppDimensions.normalize(5)),
                                  child: SingleChildScrollView(
                                      child: Column(
                                    children: [
                                      Space.yf(1.1),
                                      packagesList(),
                                      Space.yf(2.1),
                                    ],
                                  )),
                                ));
                          }
                        },
                      ))
          ],
        ),
      ),
    );
  }

  Widget buildTabButton(String text, int index) {
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
          width: AppDimensions.normalize(48),
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
