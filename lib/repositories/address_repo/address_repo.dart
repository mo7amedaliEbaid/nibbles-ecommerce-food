import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nibbles_ecommerce/models/address.dart';

import 'base_address_repo.dart';

class AddressRepository extends BaseAddressRepository {
  final CollectionReference addressCollection =
      FirebaseFirestore.instance.collection('addresses');

  @override
  Future<void> addAddress(Address address) async {
    await addressCollection.doc().set(address.toDocument());
  }

  @override
  Stream<List<Address>> getAddresses(String userId) {
    return addressCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Address.fromSnapshot(doc)).toList();
    });
  }
}
