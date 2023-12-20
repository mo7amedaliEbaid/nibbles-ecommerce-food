// contact_message.dart
import 'package:equatable/equatable.dart';

class ContactMessage extends Equatable {
  final String message;
  final String phone;
  final String email;
  final String name;

  const ContactMessage({
    required this.message,
    required this.phone,
    required this.email,
    required this.name,
  });

  @override
  List<Object?> get props => [message, phone, email, name];
}
