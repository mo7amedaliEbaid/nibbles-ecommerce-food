part of 'get_address_cubit.dart';


abstract class GetAddressState extends Equatable {
  const GetAddressState();

  @override
  List<Object?> get props => [];
}

class GetAddressInitial extends GetAddressState {}

class GetAddressLoading extends GetAddressState {}

class AddressLoaded extends GetAddressState {
  final List<Address> addresses;

  const AddressLoaded({required this.addresses});

  @override
  List<Object?> get props => [addresses];
}

class GetAddressError extends GetAddressState {
  final String errorMessage;

  const GetAddressError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
