part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final AuthStatus status;
  final auth.User? user;
  final AuthenticationFailure error;

  const AuthState({
    required this.status,
    this.user,
    required this.error,
  });

  factory AuthState.initial() {
    return  AuthState(
      status: AuthStatus.unknown,
      error: AuthenticationFailure(),
    );
  }

  @override
  List<Object?> get props => [status, user];

  @override
  String toString() => 'AuthState(status: $status, user: $user)';

  AuthState copyWith({
    AuthStatus? status,
    auth.User? user,
    AuthenticationFailure? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}
