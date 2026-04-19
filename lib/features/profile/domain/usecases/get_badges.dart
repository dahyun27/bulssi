import '../entities/badge_entity.dart';
import '../repositories/profile_repository.dart';

class GetBadges {
  const GetBadges(this._repository);
  final ProfileRepository _repository;

  Future<List<BadgeEntity>> call(String userId) => _repository.getBadges(userId);
}
