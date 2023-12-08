part of 'meals_bloc.dart';

@immutable
abstract class MealsEvent extends Equatable{
  const MealsEvent();

  @override
  List<Object> get props => [];
}

class LoadMeals extends MealsEvent {}

class UpdateMeals extends MealsEvent {
  final List<MealModel> meals;

  UpdateMeals(this.meals);

  @override
  List<Object> get props => [meals];
}
