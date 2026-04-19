import '../entities/room_entity.dart';
import '../repositories/room_repository.dart';

class GetOpenRooms {
  const GetOpenRooms(this._repository);
  final RoomRepository _repository;

  Stream<List<RoomEntity>> call({String? category}) => _repository.getOpenRooms(category: category);
}
