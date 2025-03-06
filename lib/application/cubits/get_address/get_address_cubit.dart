import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';

import '../../../models/address.dart';
part 'get_address_state.dart';

class GetAddressCubit extends Cubit<GetAddressState> {
  final BaseAddressRepository addressRepository;

  GetAddressCubit({required this.addressRepository}) : super(GetAddressInitial());



  void getAddresses(String userId) {
    emit(GetAddressLoading());
    addressRepository.getAddresses(userId).listen(
          (addresses) {
        emit(AddressLoaded(addresses: addresses));
      },
      onError: (error) {
        emit(GetAddressError(errorMessage: error.toString()));
      },
    );
  }
}
