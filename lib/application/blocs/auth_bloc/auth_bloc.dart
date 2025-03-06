import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';

import '../../../core/enums/enums.dart';
import '../../../core/error/custom_error.dart';





part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final StreamSubscription _authSubscription;
  final BaseAuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthState.initial()) {
    on<InitializeAuthEvent>(_onInitializeAuth);
    on<UserStateChangedEvent>(_onUserStateChanged);
    on<SignOutRequestedEvent>(_onSignOutRequestedChanged);
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }

  void _onInitializeAuth(
    InitializeAuthEvent event,
    Emitter<AuthState> emit,
  ) {
    _authSubscription = authRepository.user.listen((auth.User? user) {
      add(UserStateChangedEvent(user: user));
    });
  }

  void _onUserStateChanged(
    UserStateChangedEvent event,
    Emitter<AuthState> emit,
  ) {
    final auth.User? user = event.user;

    if (user == null) {
      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
      ));
    }

    if (user != null) {
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      ));
    }
  }

  void _onSignOutRequestedChanged(
    SignOutRequestedEvent event,
    Emitter<AuthState> emit,
  ) {
    authRepository.signOut();
  }
}
