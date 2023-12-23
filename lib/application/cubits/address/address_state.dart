part of 'address_cubit.dart';


abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object?> get props => [];
}

class AddressInitial extends AddressState {}

class AddressAddedSuccessfully extends AddressState {}
class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final List<Address> addresses;

  const AddressLoaded({required this.addresses});

  @override
  List<Object?> get props => [addresses];
}

class AddressError extends AddressState {
  final String errorMessage;

  const AddressError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
