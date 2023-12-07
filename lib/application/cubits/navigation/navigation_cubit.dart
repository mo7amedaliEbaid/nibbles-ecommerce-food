import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';

// Cubit
class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitialState());

  void navigateToPage(int pageIndex) {
    emit(NavigationPageChangedState(pageIndex));
  }
}