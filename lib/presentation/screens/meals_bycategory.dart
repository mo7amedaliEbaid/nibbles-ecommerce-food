import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/presentation/widgets.dart';
import 'package:nibbles_ecommerce/core/core.dart';

import 'package:nibbles_ecommerce/application/application.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';

import 'package:nibbles_ecommerce/models/meal_category.dart';

import 'package:nibbles_ecommerce/repositories/repositories.dart';

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
                Text(
                    selectedFacts.isNotEmpty
                        ? selectedFacts.first
                        : widget.mealCategory.categoryname.toUpperCase(),
                    style: AppText.h2b),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AppDimensions.normalize(10)),
                        ),
                        builder: (context) => SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: Space.all(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox.shrink(),
                                        Text(
                                          "Filter".toUpperCase(),
                                          style: AppText.h3,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.clear))
                                      ],
                                    ),
                                    Text(
                                      "Meal Tags".toUpperCase(),
                                      style: AppText.h3,
                                    ),
                                    SizedBox(
                                      height: AppDimensions.normalize(30),
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: AppStrings.tags.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return _buildCheckboxRow(
                                              AppStrings.tags[index]);
                                        },
                                      ),
                                    ),
                                    Text(
                                      "Calories".toUpperCase(),
                                      style: AppText.h3,
                                    ),
                                    CalorieRangeSlider(
                                        minCalories: 0,
                                        maxCalories: 1000,
                                        onRangeChanged: (int1, int2) {}),
                                    Space.yf(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        customElevatedButton(
                                            onTap: () {
                                              setState(() {
                                                context
                                                    .read<FilterCubit>()
                                                    .resetAllFacts();
                                              });
                                              Navigator.pop(context);
                                            },
                                            text: "Reset".toUpperCase(),
                                            heightFraction: 20,
                                            width: AppDimensions.normalize(60),
                                            color: AppColors.antiqueRuby,
                                            textColor: Colors.white),
                                        Space.xf(),
                                        customElevatedButton(
                                            onTap: () {},
                                            text: "Apply".toUpperCase(),
                                            heightFraction: 20,
                                            width: AppDimensions.normalize(60),
                                            color: AppColors.commonAmber)
                                      ],
                                    ),
                                    Space.yf()
                                  ],
                                ),
                              ),
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
                        return SizedBox(
                            height: AppDimensions.normalize(195),
                            child: ListView.separated(
                              itemCount: state.filteredMeals.length,
                              padding: Space.all(1, 1),
                              itemBuilder: (context, index) {
                                return MealItem(
                                    mealModel: state.filteredMeals[index],
                                    isInVerticalList: true);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Space.yf();
                              },
                            ));
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

  Widget _buildCheckboxRow(String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: context.read<FilterCubit>().isFactSelected(label),
          onChanged: (value) {
            setState(() {
              context.read<FilterCubit>().toggleFact(label, value ?? false);
              Navigator.pop(context);
            });
          },
        ),
        Text(label),
      ],
    );
  }
}
