import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'connectivity_state.dart';


class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity = Connectivity();

  ConnectivityCubit() : super(Disconnected(onTryAgain: () {})) {
    _init();
  }

  Future<void> _init() async {
    // Initial connectivity check
    final result = await _connectivity.checkConnectivity();
    _updateState(result);

    // Subscribe to connectivity changes
    _connectivity.onConnectivityChanged.listen((result) {
      _updateState(result);
    });
  }

  void _updateState(ConnectivityResult result) {
    // Update state based on connectivity result
    if (result == ConnectivityResult.none) {
      emit(Disconnected(onTryAgain: _tryAgain));
    } else {
      emit(Connected());
    }
  }

  void _tryAgain() {
    // Add your logic to attempt reconnection here
    // For example, you can retry the connectivity check
    _connectivity.checkConnectivity().then(_updateState);
  }
}