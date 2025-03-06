part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final SignUpStatus status;
  final CustomError error;

  const SignUpState({
    required this.status,
    required this.error,
  });

  factory SignUpState.initial() {
    return const SignUpState(
      status: SignUpStatus.initial,
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [status, error];

  @override
  String toString() => 'SignUpState(status: $status, error: $error)';

  SignUpState copyWith({
    SignUpStatus? status,
    CustomError? error,
  }) {
    return SignUpState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}


