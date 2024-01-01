import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../models/user_model.dart';

part 'base_auth_repo.dart';

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRepository({auth.FirebaseAuth? firebaseAuth, required this.firestore})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;

  @override
  Future<bool> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    bool islog = false;
    try {
      auth.UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      islog = true;
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
    return islog;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> signUp({required User user, required String password}) async {
    try {
      final auth.UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      );

      final auth.User signedUser = credential.user!;

      await firestore.collection('users').doc(signedUser.uid).set({
        'fullName': user.fullName,
   /*     'city': user.city,
        'country': user.country,*/
        'phoneNumber': user.phoneNumber,
        'email': user.email,
       // 'address': user.address,
      });
    } catch (_) {}
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }



  @override
  // TODO: implement user
  Stream<auth.User?> get user => _firebaseAuth.userChanges();
}
