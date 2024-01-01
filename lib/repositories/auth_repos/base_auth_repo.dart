part of 'auth_repo.dart';

abstract class BaseAuthRepository {
  Stream<auth.User?> get user;

  Future<void> signUp({
    required User user,
    required String password,
  });

  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
//  Future<void> signInWithGoogle();
}
