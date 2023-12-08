import 'package:flutter/material.dart';

import '../../configs/app_dimensions.dart';
import '../../configs/space.dart';
import '../../core/constants/colors.dart';

class CategoriesTabBar extends StatefulWidget {
  final List<Tab> tabBarItems;
  final List<Widget> tabViews;

  const CategoriesTabBar({
    Key? key,
    required this.tabBarItems,
    required this.tabViews,
  }) : super(key: key);

  @override
  _CategoriesTabBarState createState() => _CategoriesTabBarState();
}

class _CategoriesTabBarState extends State<CategoriesTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabBarItems.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppDimensions.normalize(15),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              height: 200,
              width: 400,
              child: TabBar(
                controller: _tabController,
                tabs: widget.tabBarItems,
                labelColor: Colors.white,
                unselectedLabelColor: AppColors.greyText, // Replace with your desired color
              ),
            ),
          ),
        ),
        Space.y1!,
        SizedBox(
          height: 400,
          width: 400,
          child: TabBarView(
            controller: _tabController,
            children: widget.tabViews,
          ),
        ),
      ],
    );
  }
}
