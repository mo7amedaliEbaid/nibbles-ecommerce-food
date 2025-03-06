part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class StartUserEvent extends UserEvent {}

class GetUserEvent extends UserEvent {
  final String id;

  const GetUserEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class UserChangedEvent extends UserEvent {
  final User user;

  const UserChangedEvent({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}
