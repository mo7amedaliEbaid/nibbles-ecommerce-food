
import '../../models/kid.dart';

abstract class BaseKidsRepository {
  Future<void> addKid(Kid kid);

  Stream<List<Kid>> getKids(String userId);
}
