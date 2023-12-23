import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/kid.dart';
import '../../../repositories/kid_repos/base_kid_repo.dart';

part 'kids_state.dart';

class KidsCubit extends Cubit<KidsState> {
  final BaseKidsRepository kidsRepository;

  KidsCubit({required this.kidsRepository}) : super(KidsInitial());

  Future<void> addKid(Kid kid) async {
    emit(KidsLoading());
    try {
      await kidsRepository.addKid(kid);
      emit(KidsAddedSuccessfully());
    } catch (e) {
      emit(const KidsError(errorMessage: 'Failed to add kid'));
    }
  }

  void getKids(String userId) {
    emit(KidsLoading());
    kidsRepository.getKids(userId).listen(
      (kids) {
        emit(KidsLoaded(kids: kids));
      },
      onError: (error) {
        emit(KidsError(errorMessage: error.toString()));
      },
    );
  }
}
