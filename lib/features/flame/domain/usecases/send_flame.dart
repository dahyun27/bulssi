import '../entities/flame_entity.dart';
import '../repositories/flame_repository.dart';

class SendFlame {
  const SendFlame(this._repository);
  final FlameRepository _repository;

  Future<FlameEntity> call(String receiverId) => _repository.sendFlame(receiverId);
}
