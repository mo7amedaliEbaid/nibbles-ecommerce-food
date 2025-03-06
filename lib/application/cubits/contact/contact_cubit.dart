// contact_us_cubit.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/contact_message.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';
import '../../../repositories/contact_message/contact_message_repo.dart';


part 'contact_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final BaseContactMessageRepo _contactUsRepo = ContactUsRepo();

  ContactUsCubit() : super(ContactUsInitial());

  void sendMessage(ContactMessage message) async {
    emit(ContactUsLoading());

    try {
      await _contactUsRepo.sendMessage(message);
      emit(ContactUsSuccess());
    } catch (e) {
      emit(ContactUsError('Failed to send message: $e'));
    }
  }
}
