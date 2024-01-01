import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nibbles_ecommerce/models/address.dart';

part 'base_address_repo.dart';

class AddressRepository extends BaseAddressRepository {
  final CollectionReference addressCollection =
      FirebaseFirestore.instance.collection('addresses');

  @override
  Future<void> addAddress(Address address) async {
    await addressCollection.doc().set(address.toDocument());
  }

/*
  @override
  Future<void> editAddress(Address address) async {
    // Ensure the address has an ID before attempting to edit
    if (address.id == null) {
      throw Exception("Address ID is null. Cannot edit.");
    }

    await addressCollection.doc(address.id!).update(address.toDocument());
  }*/

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
