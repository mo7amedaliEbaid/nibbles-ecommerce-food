import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/kid.dart';

class KidsDataCubit extends Cubit<Kid> {
  KidsDataCubit()
      : super(const Kid(
          name: '',
          age: '',
          weight: '',
          height: '',
          gender: '',
          userId: null,
        ));

  void updateNameAndAge(String name, String age) {
    emit(state.copyWith(name: name, age: age));
  }

  void updateWeightAndHeight(String? weight, String? height) {
    emit(state.copyWith(weight: weight, height: height));
  }

  void updateGender(String gender) {
    emit(state.copyWith(gender: gender));
  }
}


