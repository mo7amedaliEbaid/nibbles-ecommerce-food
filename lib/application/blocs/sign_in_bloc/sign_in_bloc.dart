import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nibbles_ecommerce/core/error/failures.dart';

import '../../../core/enums/enums.dart';
import '../../../core/error/custom_error.dart';
import '../../../repositories/auth_repos/auth_repos.dart';


part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthRepository authRepository;

  SignInBloc({required this.authRepository}) : super(SignInState.initial()) {
    on<SignInWithCredential>(_mapSignInWithCredentialToState);
  }

  FutureOr<void> _mapSignInWithCredentialToState(
      SignInWithCredential event, Emitter<SignInState> emit) async {
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
          error: CustomError(message: e.toString())));
    }
  }


}

