import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/configs/app.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/presentation/screens/home.dart';

import '../widgets/notched_navbar.dart';

class RootScreen extends StatelessWidget {
  final _pageController = PageController(initialPage: 0);
  int maxCount = 5;
  final List<Widget> bottomBarPages = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  List<MyBottomBarItem> bottomBarItems = List.generate(
    AppAssets.navbarIcons.length,
    (index) => MyBottomBarItem(
      inActiveItem: SvgPicture.asset(
        AppAssets.navbarIcons[index],
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
      activeItem: SvgPicture.asset(
        AppAssets.navbarIcons[index],
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? MyAnimatedNotchBottomBar(
              pageController: _pageController,
              showBlurBottomBar: false,
              color: AppColors.antiqueRuby,
              showShadow: true,
              showLabel: false,
              bottomBarItems: /* [
                const MyBottomBarItem(
                    inActiveItem: Icon(
                      Icons.category,
                      color: Colors.white,
                    ),
                    activeItem: Icon(
                      Icons.category,
                      color: Colors.white,
                    )),
                const MyBottomBarItem(
                  inActiveItem: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
                const MyBottomBarItem(
                    inActiveItem: Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                    activeItem: Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    )),
                const MyBottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                const MyBottomBarItem(
                  inActiveItem: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  activeItem: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ],*/
                  bottomBarItems,
              onTap: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 10),
                  curve: Curves.easeIn,
                );
              })
          : null,
    );
  }
}
