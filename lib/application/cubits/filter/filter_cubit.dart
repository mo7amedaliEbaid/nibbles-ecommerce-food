import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class FilterState extends Equatable {
  final String filterName;

  const FilterState({required this.filterName});

  @override
  List<Object> get props => [filterName];
}

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterState(filterName: ''));

  void updateFilter(String newFilterName) {
    emit(FilterState(filterName: newFilterName));
  }
}
