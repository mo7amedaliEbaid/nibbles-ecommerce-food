part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class InitializeAuthEvent extends AuthEvent {}

class UserStateChangedEvent extends AuthEvent {
  final auth.User? user;

  const UserStateChangedEvent({
    this.user,
  });

  @override
  List<Object?> get props => [user];
}

class SignOutRequestedEvent extends AuthEvent {}
