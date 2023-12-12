part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final SignInStatus status;
  final CredentialFailure error;

  const SignInState({
    required this.status,
    required this.error,
  });

  factory SignInState.initial() {
    return  SignInState(
      status: SignInStatus.initial,
      error: CredentialFailure(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'SignInState(status: $status, error: $error)';

  SignInState copyWith({
    SignInStatus? status,
    CredentialFailure? error,
  }) {
    return SignInState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}

enum SignInStatus {
  initial,
  submitting,
  success,
  error,
}
