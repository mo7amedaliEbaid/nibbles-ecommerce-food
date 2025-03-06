part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final SignInStatus status;
  final CustomError error;

  const SignInState({
    required this.status,
    required this.error,
  });

  factory SignInState.initial() {
    return const SignInState(
      status: SignInStatus.initial,
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'SignInState(status: $status, error: $error)';

  SignInState copyWith({
    SignInStatus? status,
    CustomError? error,
  }) {
    return SignInState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}

