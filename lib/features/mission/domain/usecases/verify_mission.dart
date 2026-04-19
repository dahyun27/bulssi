import '../entities/verification_entity.dart';
import '../repositories/mission_repository.dart';

class VerifyMission {
  const VerifyMission(this._repository);
  final MissionRepository _repository;

  Future<VerificationEntity> call({required String missionId, String? imageUrl, String? comment}) =>
      _repository.verifyMission(missionId: missionId, imageUrl: imageUrl, comment: comment);
}
