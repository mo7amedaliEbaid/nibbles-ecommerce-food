// nibbles_info_cubit.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/repositories/info_repos/info_repo.dart';

import '../../../models/info.dart';
import 'package:nibbles_ecommerce/repositories/repositories.dart';

part 'nibbles_info_state.dart';

class NibblesInfoCubit extends Cubit<NibblesInfoState> {
  final BaseInfoRepository _infoRepo = InfoRepo();

  NibblesInfoCubit() : super(NibblesInfoInitial());

  void fetchAboutInfo() async {
    try {
      final info = await _infoRepo.getAboutInfo().first;
      emit(NibblesInfoLoaded(info));
    } catch (e) {
      emit(NibblesInfoError('Failed to fetch about info: $e'));
    }
  }

/*  void fetchPrivacyInfo() async {
    try {
      final info = await _infoRepo.getPrivacyInfo().first;
      emit(NibblesInfoLoaded(info));
    } catch (e) {
      emit(NibblesInfoError('Failed to fetch privacy info: $e'));
    }
  }

  void fetchTermsInfo() async {
    try {
      final info = await _infoRepo.getTermsInfo().first;
      emit(NibblesInfoLoaded(info));
    } catch (e) {
      emit(NibblesInfoError('Failed to fetch terms info: $e'));
    }
  }*/
}
