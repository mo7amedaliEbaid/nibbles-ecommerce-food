part of 'add_address_cubit.dart';


abstract class AddAddressState extends Equatable {
  const AddAddressState();

  @override
  List<Object?> get props => [];
}

class AddAddressInitial extends AddAddressState {}

class AddressAddedSuccessfully extends AddAddressState {}
class AddAddressLoading extends AddAddressState {}


class AddressError extends AddAddressState {
  final String errorMessage;

  const AddressError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
