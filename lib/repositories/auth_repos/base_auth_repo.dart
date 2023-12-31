import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../models/user_model.dart';


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
