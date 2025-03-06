import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/kid.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';

part 'add_kids_state.dart';

class AddKidsCubit extends Cubit<AddKidsState> {
  final BaseKidsRepository kidsRepository;

  AddKidsCubit({required this.kidsRepository}) : super(AddKidsInitial());

  Future<void> addKid(Kid kid) async {
    emit(AddKidsLoading());
    try {
      await kidsRepository.addKid(kid);
      emit(KidsAddedSuccessfully());
    } catch (e) {
      emit(const AddKidsError(errorMessage: 'Failed to add kid'));
    }
  }


}
