part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final SignUpStatus status;
  final CredentialFailure error;

  const SignUpState({
    required this.status,
    required this.error,
  });

  factory SignUpState.initial() {
    return  SignUpState(
      status: SignUpStatus.initial,
      error: CredentialFailure(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'SignUpState(status: $status, error: $error)';

  SignUpState copyWith({
    SignUpStatus? status,
    CredentialFailure? error,
  }) {
    return SignUpState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}

enum SignUpStatus {
  initial,
  submitting,
  success,
  error,
}
