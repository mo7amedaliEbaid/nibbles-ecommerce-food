import 'package:nibbles_ecommerce/models/address.dart';

abstract class BaseAddressRepository {
  Future<void> addAddress(Address address);

 // Future<void> editAddress(Address address);

  Stream<List<Address>> getAddresses(String userId);
}
