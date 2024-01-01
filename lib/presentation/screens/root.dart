import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';

import 'package:nibbles_ecommerce/presentation/screens.dart';

import '../../application/application.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen>
    with AutomaticKeepAliveClientMixin {
//  Ensure that your NavigationCubit state is persisted across hot reloads.
//  To do this, you can make use of the AutomaticKeepAliveClientMixin

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  final PageController _pageController = PageController(initialPage: 0);

  final int maxCount = 5;

  final List<Widget> bottomBarPages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const QrCodeScreen(),
    const PackagesScreen(),
    const MoreScreen(),
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
    super.build(context);
    App.init(context);
    return BlocListener<NavigationCubit, NavigationState>(
      listener: (context, state) {
        if (state is NavigationPageChangedState) {
          // Handle page change logic here
          _pageController.animateToPage(
            state.pageIndex,
            duration: const Duration(milliseconds: 1),
            curve: Curves.easeIn,
          );
        }
      },
      child: Scaffold(
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
                  context.read<NavigationCubit>().navigateToPage(index);
                })
            : null,
      ),
    );
  }
}
