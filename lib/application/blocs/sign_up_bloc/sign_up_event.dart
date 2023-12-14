part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpWithCredential extends SignUpEvent {
  final User user;
  final String password;

  const SignUpWithCredential({required this.user, required this.password});

  @override
  List<Object> get props => [user, password];
}
