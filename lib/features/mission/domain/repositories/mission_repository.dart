import '../entities/mission_entity.dart';
import '../entities/verification_entity.dart';

abstract interface class MissionRepository {
  Future<MissionEntity> createMission({required String title, required String category});
  Future<VerificationEntity> verifyMission({required String missionId, String? imageUrl, String? comment});
  Future<int> getStreak(String missionId);
  Stream<List<VerificationEntity>> getVerificationFeed(String roomId);
}
