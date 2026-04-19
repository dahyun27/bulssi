import '../repositories/mission_repository.dart';

class GetStreak {
  const GetStreak(this._repository);
  final MissionRepository _repository;

  Future<int> call(String missionId) => _repository.getStreak(missionId);
}
