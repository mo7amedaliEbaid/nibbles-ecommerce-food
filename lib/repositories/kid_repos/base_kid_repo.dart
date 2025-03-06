part of 'kid_repo.dart';

abstract class BaseKidsRepository {
  Future<void> addKid(Kid kid);

  Stream<List<Kid>> getKids(String userId);
}
