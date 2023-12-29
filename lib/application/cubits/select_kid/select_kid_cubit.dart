import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/kid.dart';
part 'select_kid_state.dart';

class SelectKidCubit extends Cubit<SelectKidState> {
  SelectKidCubit() : super(SelectKidState());

  void toggleKid(Kid kid) {
    final currentSelectedKid = state.selectedKid;

    // Toggle selection: If the current selected kid is the same as the new kid,
    // unselect it. Otherwise, select the new kid.
    final updatedKid = (currentSelectedKid == kid) ? null : kid;

    emit(SelectKidState(selectedKid: updatedKid));
  }

  void clearSelection() {
    emit(SelectKidState());
  }

  Kid? getSelectedKid() {
    return state.selectedKid;
  }
}
