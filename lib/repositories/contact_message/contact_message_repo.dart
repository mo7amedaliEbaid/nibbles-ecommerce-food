// contact_us_repo.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/contact_message.dart';

part 'base_contact_message_repo.dart';

class ContactUsRepo extends BaseContactMessageRepo {
  final FirebaseFirestore _firebaseFirestore;

  ContactUsRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> sendMessage(ContactMessage message) async {
    // Save the message to Firestore or perform any other necessary actions
    await _firebaseFirestore.collection('contact_messages').add({
      'message': message.message,
      'phone': message.phone,
      'email': message.email,
      'name': message.name,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
