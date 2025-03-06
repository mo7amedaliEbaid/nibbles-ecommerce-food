part of 'info_repo.dart';

abstract class BaseInfoRepository {
  Stream<NibblesInfo> getAboutInfo();

  Stream<NibblesInfo> getPrivacyInfo();

  Stream<NibblesInfo> getTermsInfo();
}
