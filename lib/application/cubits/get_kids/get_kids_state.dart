part of 'get_kids_cubit.dart';


abstract class GetKidsState extends Equatable {
  const GetKidsState();

  @override
  List<Object?> get props => [];
}

class GetKidsInitial extends GetKidsState {}

class GetKidsLoading extends GetKidsState {}

class GetKidsLoaded extends GetKidsState {
  final List<Kid> kids;

  const GetKidsLoaded({required this.kids});

  @override
  List<Object?> get props => [kids];
}

class GetKidsError extends GetKidsState {
  final String errorMessage;

  const GetKidsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
