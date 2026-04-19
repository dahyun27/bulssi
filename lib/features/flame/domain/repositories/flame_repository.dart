import '../entities/flame_entity.dart';

abstract interface class FlameRepository {
  Future<FlameEntity> sendFlame(String receiverId);
  Future<int> getFlameBalance();
}
