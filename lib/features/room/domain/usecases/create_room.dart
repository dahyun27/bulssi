import '../entities/room_entity.dart';
import '../repositories/room_repository.dart';

class CreateRoom {
  const CreateRoom(this._repository);
  final RoomRepository _repository;

  Future<RoomEntity> call({required String title, required RoomType type, required String category}) =>
      _repository.createRoom(title: title, type: type, category: category);
}
