part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  List<Object> get props => [];
}

class LoadCategories extends CategoriesEvent {}

class UpdateCategories extends CategoriesEvent {
  final List<MealCategory> categories;

  UpdateCategories(this.categories);

  @override
  List<Object> get props => [categories];
}
