import '../entities/room_entity.dart';
import '../repositories/room_repository.dart';

class JoinRoomWithCode {
  const JoinRoomWithCode(this._repository);
  final RoomRepository _repository;

  Future<RoomEntity> call(String code) => _repository.joinRoomWithCode(code);
}
