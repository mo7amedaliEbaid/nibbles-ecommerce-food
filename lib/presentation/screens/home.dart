import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nibbles_ecommerce/application/application.dart';

import 'package:nibbles_ecommerce/configs/configs.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 1;
  int packagesCurrentPage = 0;

  PageController _nibblesPageController = PageController();
  PageController _packagesPageController = PageController();

  @override
  void initState() {
    _nibblesPageController = PageController(initialPage: currentPage);
    _packagesPageController =
        PageController(initialPage: packagesCurrentPage, viewportFraction: .87);
    super.initState();
  }

/*
  List<Widget> tabViews = List.generate(
      AppStrings.tabStrings.length, (index) => const MealsHorizontalListview());*/

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppDimensions.normalize(255),
              child: Stack(
                children: [
                  curvedlRecSvg(AppColors.antiqueRuby),
                  positionedWhiteLogo(),
                  Positioned(
                    top: AppDimensions.normalize(45),
                    left: AppDimensions.normalize(14),
                    child: Text(
                      "Good food for\nYour Loved ones".toUpperCase(),
                      style: AppText.h2?.copyWith(
                          color: Colors.white, height: 1.5, letterSpacing: 1.8),
                    ),
                  ),
                  Positioned(
                    top: AppDimensions.normalize(20),
                    right: AppDimensions.normalize(10),
                    child: SvgPicture.asset(
                      AppAssets.bell,
                      colorFilter: const ColorFilter.mode(
                          AppColors.deepTeal, BlendMode.srcIn),
                    ),
                  ),
                  Positioned(
                    top: AppDimensions.normalize(80),
                    child: Padding(
                      padding: Space.hf(),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(
                          AppDimensions.normalize(7),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context.read<MealsBloc>().add(LoadAllMeals());
                            Navigator.of(context).pushNamed(AppRouter.search);
                          },
                          child: Container(
                              height: AppDimensions.normalize(22),
                              width: AppDimensions.normalize(130),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  AppDimensions.normalize(7),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: Space.all(.8, .8),
                                    child: SvgPicture.asset(AppAssets.search),
                                  ),
                                  Text(
                                    "Search Here",
                                    style: AppText.b2
                                        ?.copyWith(color: AppColors.greyText),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppDimensions.normalize(107),
                    right: 0,
                    left: 0,
                    child: SizedBox(
                      height: AppDimensions.normalize(140),
                      // width: AppDimensions.normalize(150),
                      child: PageView.builder(
                          controller: _nibblesPageController,
                          onPageChanged: (pos) {
                            setState(() {
                              currentPage = pos;
                            });
                          },
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: AppDimensions.normalize(5)),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    AppAssets.nibblesPng,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Positioned(
                    top: AppDimensions.normalize(239),
                    left: AppDimensions.normalize(60),
                    child: SmoothPageIndicator(
                      controller: _nibblesPageController,
                      count: 4,
                      effect: ExpandingDotsEffect(
                          activeDotColor: AppColors.deepTeal,
                          dotColor: AppColors.lightGrey,
                          dotHeight: AppDimensions.normalize(3),
                          dotWidth: AppDimensions.normalize(3)),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: Space.hf(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Packages".toUpperCase(),
                        style: AppText.h2b?.copyWith(letterSpacing: 2),
                      ),
                      TextButton(
                          onPressed: () {
                            context.read<NavigationCubit>().navigateToPage(3);
                          },
                          child: Text(
                            "View All",
                            style: AppText.b2b
                                ?.copyWith(color: AppColors.greyText),
                          ))
                    ],
                  ),
                ),
                Space.yf(),
                BlocBuilder<PackagesBloc, PackagesState>(
                  builder: (context, state) {
                    if (state is PackagesLoaded) {
                      return Container(
                        height: AppDimensions.normalize(135),
                        margin:
                            EdgeInsets.only(left: AppDimensions.normalize(8)),
                        // width: AppDimensions.normalize(150),

                        child: PageView.builder(
                            padEnds: false,
                            controller: _packagesPageController,
                            onPageChanged: (pos) {
                              setState(() {
                                packagesCurrentPage = pos;
                              });
                            },
                            itemCount: state.packages.length,
                            itemBuilder: (context, index) {
                              return PackageItem(
                                isFromVerticalList: false,
                                packageModel: state.packages[index],
                              );
                            }),
                      );
                    } else {
                      return const LoadingTicker(
                        text: AppStrings.loading,
                      );
                    }
                  },
                ),
                // Space.yf(2),
                SmoothPageIndicator(
                  controller: _packagesPageController,
                  count: 4,
                  effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.deepTeal,
                      dotColor: AppColors.lightGrey,
                      dotHeight: AppDimensions.normalize(3),
                      dotWidth: AppDimensions.normalize(3)),
                ),
                Space.yf(1.4),
                Padding(
                  padding: Space.hf(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Meals".toUpperCase(),
                        style: AppText.h2b?.copyWith(letterSpacing: 2),
                      ),
                      TextButton(
                          onPressed: () {
                            context.read<NavigationCubit>().navigateToPage(1);
                          },
                          child: Text(
                            "View All",
                            style: AppText.b2b
                                ?.copyWith(color: AppColors.greyText),
                          ))
                    ],
                  ),
                ),
                Space.yf(.15),
                BlocBuilder<CategoriesBloc, CategoriesState>(
                  builder: (context, state) {
                    if (state is CategoriesLoaded &&
                        state.categories.isNotEmpty) {
                      List<Tab> tabBarItems = List.generate(
                        state.categories.length,
                        (index) => Tab(
                          text: state.categories[index].categoryname
                              .toUpperCase(),
                        ),
                      );

                      List<Widget> tabViews = List.generate(
                        state.categories.length,
                        (index) => Builder(
                          builder: (context) {
                            final mealsBloc = context.read<MealsBloc>();
                            // Use mealsBloc to update category ID dynamically
                            mealsBloc.add(LoadMealsByCategory(
                                categoryId:
                                    state.categories[index].categoryid));

                            return const MealsHorizontalListview();
                          },
                        ),
                      );

                      // Check if the number of tabs and tabViews match
                      if (tabBarItems.length == tabViews.length) {
                        return DefaultTabController(
                          length: tabBarItems.length,
                          child: Column(
                            children: [
                              SizedBox(
                                height: AppDimensions.normalize(15),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: ButtonsTabBar(
                                    buttonMargin: EdgeInsets.only(
                                      right: AppDimensions.normalize(6),
                                      left: AppDimensions.normalize(4),
                                    ),
                                    contentPadding: Space.hf(.5),
                                    backgroundColor: AppColors.tabColor,
                                    labelStyle: AppText.b1
                                        ?.copyWith(color: Colors.white),
                                    unselectedBackgroundColor:
                                        Colors.transparent,
                                    unselectedLabelStyle: AppText.b2
                                        ?.copyWith(color: AppColors.greyText),
                                    tabs: tabBarItems,
                                  ),
                                ),
                              ),
                              Space.y1!,
                              //  Space.yf(6),
                              SizedBox(
                                height: AppDimensions.normalize(70),
                                child: TabBarView(children: tabViews),
                              ),
                            ],
                          ),
                        );
                      } else {
                        // Handle the case where the lengths don't match
                        return const Center(
                          child:
                              Text("Error: Tabs and TabViews count mismatch"),
                        );
                      }
                    } else {
                      return const Center(
                        child: LoadingTicker(
                          text: AppStrings.loading,
                        ),
                      );
                    }
                  },
                )
              ],
            ),
            Space.yf(6),
          ],
        ),
      ),
    );
  }
}
