import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/application/blocs/meals/meals_bloc.dart';
import 'package:nibbles_ecommerce/configs/app_dimensions.dart';
import 'package:nibbles_ecommerce/configs/app_typography.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/models/meal_category.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meal_top_stack.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meals_vertical_listview.dart';
import 'package:nibbles_ecommerce/repositories/meals_repos/meal_repo.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key, required this.mealCategory});

  final MealCategory mealCategory;

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  void initState() {
    context.read<MealsBloc>().add(LoadMealsByCategory(
        categoryId: widget.mealCategory
            .categoryid)) /*updateCategoryId(widget.mealCategory.categoryid)*/;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          mealTopStack(context),
          Padding(
            padding: EdgeInsets.only(
              top: AppDimensions.normalize(8),
              left: AppDimensions.normalize(8),
              right: AppDimensions.normalize(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.mealCategory.categoryname.toUpperCase(),
                    style: AppText.h2b),
                SvgPicture.asset(
                  AppAssets.filter,
                  colorFilter: const ColorFilter.mode(
                      AppColors.deepTeal, BlendMode.srcIn),
                )
              ],
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (context) => MealsBloc(mealsRepo: MealsRepo())
                ..add(LoadMealsByCategory(
                    categoryId: widget.mealCategory.categoryid)),
              child: const MealsVerticalListview(),
            ),
          ),
        ],
      ),
    );
  }
}
