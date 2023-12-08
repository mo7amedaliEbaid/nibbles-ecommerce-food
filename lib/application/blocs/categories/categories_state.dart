part of 'categories_bloc.dart';


@immutable
abstract class CategoriesState extends Equatable {
  const CategoriesState();

  List<Object> get props => [];
}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<MealCategory> categories;

  const CategoriesLoaded({this.categories = const <MealCategory>[]});

  @override
  List<Object> get props => [categories];
}
