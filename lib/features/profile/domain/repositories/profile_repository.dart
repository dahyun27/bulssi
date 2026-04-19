import '../entities/badge_entity.dart';
import '../entities/profile_entity.dart';

abstract interface class ProfileRepository {
  Future<ProfileEntity> getProfile(String userId);
  Future<List<BadgeEntity>> getBadges(String userId);
}
