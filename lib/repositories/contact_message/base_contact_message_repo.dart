import '../../models/contact_message.dart';

abstract class BaseContactMessageRepo{
  Future<void> sendMessage(ContactMessage message);
}