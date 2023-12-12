import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nibbles_ecommerce/core/error/failures.dart';

import '../../../repositories/auth_repos/auth_repos.dart';


part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepository;

  SignInBloc({required this.authRepository}) : super(SignInState.initial()) {
    on<SignInWithCredentia>(_mapSignInWithCredentialToState);
   // on<GoogleSignIn>(_mapGoogleSignInToState);
  }

  FutureOr<void> _mapSignInWithCredentialToState(
      SignInWithCredentia event, Emitter<SignInState> emit) async {
    emit(state.copyWith(status: SignInStatus.submitting));

    try {
      await authRepository
          .logInWithEmailAndPassword(
              email: event.email, password: event.password)
          .then((value) {
        if (value) {
          emit(state.copyWith(status: SignInStatus.success));
        }
      });
    } catch (e) {
      emit(state.copyWith(
          status: SignInStatus.error,
          error: CredentialFailure()));
    }
  }


}


/*
on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blue,
          content: const Text('invalid-email'),
          duration: const Duration(seconds: 2),
        ));
      } else if (e.code == 'user-disabled') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blue,
          content: const Text('user-disabled'),
          duration: const Duration(seconds: 2),
        ));
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blue,
          content: const Text('user-not-found'),
          duration: const Duration(seconds: 2),
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.blue,
          content: const Text('wrong-password'),
          duration: const Duration(seconds: 2),
        ));
      }
    }
*/