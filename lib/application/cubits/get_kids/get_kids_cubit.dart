import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/kid.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';

part 'get_kids_state.dart';

class GetKidsCubit extends Cubit<GetKidsState> {
  final BaseKidsRepository kidsRepository;

  GetKidsCubit({required this.kidsRepository}) : super(GetKidsInitial());


  void getKids(String userId) {
    emit(GetKidsLoading());
    kidsRepository.getKids(userId).listen(
          (kids) {
        emit(GetKidsLoaded(kids: kids));
      },
      onError: (error) {
        emit(GetKidsError(errorMessage: error.toString()));
      },
    );
  }
}
