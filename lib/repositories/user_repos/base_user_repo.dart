part of 'user_repo.dart';

abstract class BaseUserRepository {
  Stream<User> getUser(String userId);
}
