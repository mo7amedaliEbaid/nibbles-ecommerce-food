part of 'meals_bloc.dart';

@immutable
abstract class MealsState extends Equatable{
  const MealsState();

  @override
  List<Object> get props => [];
}

class MealsLoading extends MealsState {}

@immutable
class MealsLoaded extends MealsState {
  final List<MealModel> meals;

  const MealsLoaded({this.meals = const <MealModel>[]});

  @override
  List<Object> get props => [meals];

  @override
  bool get stringify => true;
}
