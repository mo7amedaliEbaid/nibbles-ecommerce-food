import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';
import '../../../models/address.dart';

part 'add_address_state.dart';

class AddAddressCubit extends Cubit<AddAddressState> {
  final BaseAddressRepository addressRepository;

  AddAddressCubit({required this.addressRepository})
      : super(AddAddressInitial());

  Future<void> addAddress(Address address) async {
    emit(AddAddressLoading());
    try {
      await addressRepository.addAddress(address);
      emit(AddressAddedSuccessfully());
    } catch (e) {
      emit(const AddressError(errorMessage: 'Failed to add address'));
    }
  }
}
