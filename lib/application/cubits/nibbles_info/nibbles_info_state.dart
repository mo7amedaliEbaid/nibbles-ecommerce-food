// nibbles_info_states.dart
part of 'nibbles_info_cubit.dart';

abstract class NibblesInfoState extends Equatable {
  const NibblesInfoState();

  @override
  List<Object?> get props => [];
}

class NibblesInfoInitial extends NibblesInfoState {}

class NibblesInfoLoaded extends NibblesInfoState {
  final NibblesInfo info;

  NibblesInfoLoaded(this.info);

  @override
  List<Object?> get props => [info];
}

class NibblesInfoError extends NibblesInfoState {
  final String error;

  NibblesInfoError(this.error);

  @override
  List<Object?> get props => [error];
}
