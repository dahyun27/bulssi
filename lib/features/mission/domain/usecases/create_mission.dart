import '../entities/mission_entity.dart';
import '../repositories/mission_repository.dart';

class CreateMission {
  const CreateMission(this._repository);
  final MissionRepository _repository;

  Future<MissionEntity> call({required String title, required String category}) =>
      _repository.createMission(title: title, category: category);
}
