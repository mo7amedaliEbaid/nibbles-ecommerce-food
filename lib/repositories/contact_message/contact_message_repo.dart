// contact_us_repo.dart
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/contact_message.dart';

class ContactUsRepo {
  final FirebaseFirestore _firebaseFirestore;

  ContactUsRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

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
