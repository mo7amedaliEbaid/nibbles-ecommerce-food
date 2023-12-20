
import 'package:nibbles_ecommerce/models/info.dart';
import 'package:nibbles_ecommerce/models/meal_category.dart';


abstract class BaseInfoRepository {
  Stream<NibblesInfo> getAboutInfo();
  Stream<NibblesInfo> getPrivacyInfo();
  Stream<NibblesInfo> getTermsInfo();
}
