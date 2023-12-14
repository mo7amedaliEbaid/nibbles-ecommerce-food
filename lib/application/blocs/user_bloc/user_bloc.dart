import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/enums/enums.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repos/user_repos.dart';
import '../auth_bloc/auth_bloc.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late final StreamSubscription _authSubscription;
  StreamSubscription? _userSubscription;
  final AuthBloc authBloc;
  final UserRepository userRepository;
  UserBloc({required this.authBloc, required this.userRepository})
      : super(UserState.initial()) {
    on<StartUserEvent>(_onStartUser);
    on<GetUserEvent>(_onGetUser);
    on<UserChangedEvent>(_oUserChanged);
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    _userSubscription?.cancel();
    _userSubscription = null;
    return super.close();
  }

  void _onStartUser(StartUserEvent event, Emitter<UserState> emit) {
    _authSubscription = authBloc.stream.listen((AuthState authState) {
      if (authState.status == AuthStatus.authenticated) {
        add(GetUserEvent(id: authState.user!.uid));
      }
    });
  }

  void _onGetUser(GetUserEvent event, Emitter<UserState> emit) {
    _userSubscription = userRepository.getUser(event.id).listen((User user) {
      print(user.fullName);
      add(UserChangedEvent(user: user));
    });
  }

  void _oUserChanged(UserChangedEvent event, Emitter<UserState> emit) {
    emit(state.copyWith(user: event.user));
  }
}
