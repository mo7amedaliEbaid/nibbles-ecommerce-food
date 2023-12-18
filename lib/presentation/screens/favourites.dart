import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/presentation/widgets/meal_item.dart';
import 'package:nibbles_ecommerce/presentation/widgets/top_rec_components.dart';

import '../../application/cubits/favourite_meals/fav_meals_cubit.dart';
import '../../models/meal.dart';

class FavoritesScreen extends StatefulWidget {
  final String userId;

  const FavoritesScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    context.read<FavoritesCubit>().loadFavorites(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<FavoritesCubit>().loadFavorites(widget.userId);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          curvedlRecSvg(AppColors.deepTeal),
          positionedRow(context),
          positionedTitle("Favorites"),
          Positioned(
            top: AppDimensions.normalize(70),
            left: AppDimensions.normalize(7),
            right: AppDimensions.normalize(7),
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                if (state is FavoritesLoaded) {
                  return _buildFavoritesList(state.favoriteMeals);
                } else if (state is FavoritesError) {
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

  Widget _buildFavoritesList(List<MealModel> favoriteMeals) {
    return SizedBox(
      height: AppDimensions.normalize(400),
      child: ListView.separated(
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
}
