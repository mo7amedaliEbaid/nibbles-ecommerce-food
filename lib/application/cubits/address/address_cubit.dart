import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/repositories/address_repo/base_address_repo.dart';

import '../../../models/address.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final BaseAddressRepository addressRepository;

  AddressCubit({required this.addressRepository}) : super(AddressInitial());

  Future<void> addAddress(Address address) async {
    emit(AddressLoading());
    try {
      await addressRepository.addAddress(address);
      emit(AddressAddedSuccessfully());
    } catch (e) {
      emit(const AddressError(errorMessage: 'Failed to add address'));
    }
  }

  void getAddresses(String userId) {
    emit(AddressLoading());
    addressRepository.getAddresses(userId).listen(
          (addresses) {
        emit(AddressLoaded(addresses: addresses));
      },
      onError: (error) {
        emit(AddressError(errorMessage: error.toString()));
      },
    );
  }
}
