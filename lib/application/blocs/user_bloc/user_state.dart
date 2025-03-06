part of 'user_bloc.dart';

class UserState extends Equatable {
  final User user;

  const UserState({
    required this.user,
  });

  factory UserState.initial() {
    return UserState(user: User());
  }

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'UserState(user: $user)';

  UserState copyWith({
    User? user,
  }) {
    return UserState(
      user: user ?? this.user,
    );
  }
}
