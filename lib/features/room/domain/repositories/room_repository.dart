import '../entities/room_entity.dart';

abstract interface class RoomRepository {
  Future<RoomEntity> createRoom({required String title, required RoomType type, required String category});
  Future<RoomEntity> joinRoomWithCode(String code);
  Stream<List<RoomEntity>> getOpenRooms({String? category});
  Stream<List<RoomEntity>> getMyRooms();
}
