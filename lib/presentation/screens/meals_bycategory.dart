import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/application/blocs/meals/meals_bloc.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/models/meal_category.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meal_top_stack.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meals_vertical_listview.dart';
import 'package:nibbles_ecommerce/repositories/meals_repos/meal_repo.dart';

import '../../application/cubits/filter/filter_cubit.dart';

class MealsByCategoryScreen extends StatefulWidget {
  const MealsByCategoryScreen({super.key, required this.mealCategory});

  final MealCategory mealCategory;

  @override
  State<MealsByCategoryScreen> createState() => _MealsByCategoryScreenState();
}

class _MealsByCategoryScreenState extends State<MealsByCategoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedFacts = context
        .read<FilterCubit>()
        .selectedFacts
        .keys
        .where((fact) => context.read<FilterCubit>().isFactSelected(fact))
        .toList();
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
                GestureDetector(
                  onTap: () {
                    log("Tapped");
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.normalize(10)),
                        ),
                        builder: (context) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Wrap(
                                  children: [
                                    ListTile(
                                      title: const Text('Sugar Free'),
                                      leading: Checkbox(
                                        value: context
                                            .read<FilterCubit>()
                                            .isFactSelected('Sugar Free'),
                                        onChanged: (value) {
                                          context
                                              .read<FilterCubit>()
                                              .toggleFact(
                                                  'Sugar Free', value ?? false);
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text('Healthy'),
                                      leading: Checkbox(
                                        value: context
                                            .read<FilterCubit>()
                                            .isFactSelected('Healthy'),
                                        onChanged: (value) {
                                          context
                                              .read<FilterCubit>()
                                              .toggleFact(
                                                  'Healthy', value ?? false);
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: const Text('Fast Cook'),
                                      leading: Checkbox(
                                        value: context
                                            .read<FilterCubit>()
                                            .isFactSelected('Fast Cook'),
                                        onChanged: (value) {
                                          context
                                              .read<FilterCubit>()
                                              .toggleFact(
                                                  'Fast Cook', value ?? false);
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                    // Add more facts as needed
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Apply Filters'),
                                    ),
                                  ],
                                ),
                              ],
                            ));
                  },
                  child: SvgPicture.asset(
                    AppAssets.filter,
                    colorFilter: const ColorFilter.mode(
                        AppColors.deepTeal, BlendMode.srcIn),
                  ),
                )
              ],
            ),
          ),
          selectedFacts.isNotEmpty
              ? BlocProvider(
                  create: (context) => FilterCubit(mealsRepo: MealsRepo())
                    ..filterMealsByFacts(selectedFacts),
                  child: BlocBuilder<FilterCubit, FilterState>(
                    builder: (context, state) {
                      if (state is FilterSuccess) {
                        return Center(
                          child:
                              Text(state.filteredMeals.first.facts.toString()),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                )
              : Expanded(
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
