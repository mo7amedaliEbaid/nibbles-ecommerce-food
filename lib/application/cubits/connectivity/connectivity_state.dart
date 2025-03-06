part of 'connectivity_cubit.dart';

abstract class ConnectivityState {}

class Connected extends ConnectivityState {}

class Disconnected extends ConnectivityState {
  final VoidCallback onTryAgain;

  Disconnected({required this.onTryAgain});
}
