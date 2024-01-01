import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';

import '../../../core/enums/enums.dart';
import '../../../models/user_model.dart';
import '../auth_bloc/auth_bloc.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late final StreamSubscription _authSubscription;
  StreamSubscription? _userSubscription;
  final AuthBloc authBloc;
  final BaseUserRepository userRepository;

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
