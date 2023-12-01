import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/configs/app.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/presentation/screens/home.dart';

import '../widgets/notched_navbar.dart';

class RootScreen extends StatelessWidget {
  RootScreen({super.key});

  final PageController _pageController = PageController(initialPage: 0);
  final int maxCount = 5;
  final List<Widget> bottomBarPages = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  final List<MyBottomBarItem> bottomBarItems = List.generate(
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
              bottomBarItems: bottomBarItems,
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
