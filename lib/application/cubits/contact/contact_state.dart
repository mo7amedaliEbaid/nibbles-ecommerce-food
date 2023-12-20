// contact_us_state.dart
part of 'contact_cubit.dart';

abstract class ContactUsState extends Equatable {
  const ContactUsState();

  @override
  List<Object?> get props => [];
}

class ContactUsInitial extends ContactUsState {}

class ContactUsLoading extends ContactUsState {}

class ContactUsSuccess extends ContactUsState {}

class ContactUsError extends ContactUsState {
  final String error;

  const ContactUsError(this.error);

  @override
  List<Object?> get props => [error];
}
