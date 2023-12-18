import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Meals'),
      ),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoaded) {
            return _buildFavoritesList(state.favoriteMeals);
          } else if (state is FavoritesError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _buildFavoritesList(List<MealModel> favoriteMeals) {
    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (context, index) {
        final meal = favoriteMeals[index];

        return ListTile(
          title: Text(meal.name),
          subtitle: Text(meal.description),
          // Add more details as needed
        );
      },
    );
  }
}
