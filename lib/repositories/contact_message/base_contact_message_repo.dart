part of 'contact_message_repo.dart';

abstract class BaseContactMessageRepo{
  Future<void> sendMessage(ContactMessage message);
}