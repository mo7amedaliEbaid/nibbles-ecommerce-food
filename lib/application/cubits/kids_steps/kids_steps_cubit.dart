import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/core/enums/enums.dart';

class KidsStepsCubit extends Cubit<KidsStepType> {
  KidsStepsCubit() : super(KidsStepType.index0);

  void updateIndex(int newIndex) {
    switch (newIndex) {
      case 0:
        emit(KidsStepType.index0);
        break;
      case 1:
        emit(KidsStepType.index1);
        break;
      case 2:
        emit(KidsStepType.index2);
        break;
      default:
        emit(KidsStepType.index0);
        break;
    }
  }
}
