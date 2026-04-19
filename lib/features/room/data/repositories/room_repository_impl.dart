import '../../domain/entities/room_entity.dart';
import '../../domain/repositories/room_repository.dart';
import '../datasources/room_remote_datasource.dart';

class RoomRepositoryImpl implements RoomRepository {
  const RoomRepositoryImpl(this._dataSource, this._currentUserId);
  final RoomRemoteDataSource _dataSource;
  final String _currentUserId;

  @override
  Future<RoomEntity> createRoom({required String title, required RoomType type, required String category}) =>
      _dataSource.createRoom(title: title, type: type, category: category, creatorId: _currentUserId);

  @override
  Future<RoomEntity> joinRoomWithCode(String code) => _dataSource.joinRoomWithCode(code);

  @override
  Stream<List<RoomEntity>> getOpenRooms({String? category}) => _dataSource.getOpenRooms(category: category);

  @override
  Stream<List<RoomEntity>> getMyRooms() => throw UnimplementedError();
}
