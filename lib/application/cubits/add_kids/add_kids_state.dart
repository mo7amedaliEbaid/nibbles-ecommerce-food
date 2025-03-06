part of 'add_kids_cubit.dart';

abstract class AddKidsState extends Equatable {
  const AddKidsState();

  @override
  List<Object?> get props => [];
}

class AddKidsInitial extends AddKidsState {}

class KidsAddedSuccessfully extends AddKidsState {}
class AddKidsLoading extends AddKidsState {}



class AddKidsError extends AddKidsState {
  final String errorMessage;

  const AddKidsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
