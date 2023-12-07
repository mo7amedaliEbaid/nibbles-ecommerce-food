part of 'navigation_cubit.dart';
abstract class NavigationState {}

class NavigationInitialState extends NavigationState {}

class NavigationPageChangedState extends NavigationState {
  final int pageIndex;

  NavigationPageChangedState(this.pageIndex);
}