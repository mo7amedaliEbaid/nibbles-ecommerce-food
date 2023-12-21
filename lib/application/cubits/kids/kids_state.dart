part of 'kids_cubit.dart';

abstract class KidsState extends Equatable {
  const KidsState();

  @override
  List<Object?> get props => [];
}

class KidsInitial extends KidsState {}

class KidsAddedSuccessfully extends KidsState {}
class KidsLoading extends KidsState {}

class KidsLoaded extends KidsState {
  final List<Kid> kids;

  const KidsLoaded({required this.kids});

  @override
  List<Object?> get props => [kids];
}

class KidsError extends KidsState {
  final String errorMessage;

  const KidsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
