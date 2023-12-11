part of 'meals_bloc.dart';

@immutable
abstract class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object> get props => [];
}

class MealsLoading extends MealsState {}

class MealsLoaded extends MealsState {
  final List<MealModel> meals;

  const MealsLoaded({required this.meals});

  @override
  List<Object> get props => [meals];
}
