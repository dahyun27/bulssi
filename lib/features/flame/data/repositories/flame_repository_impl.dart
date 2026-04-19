import '../../domain/entities/flame_entity.dart';
import '../../domain/repositories/flame_repository.dart';
import '../datasources/flame_remote_datasource.dart';

class FlameRepositoryImpl implements FlameRepository {
  const FlameRepositoryImpl(this._dataSource, this._currentUserId);
  final FlameRemoteDataSource _dataSource;
  final String _currentUserId;

  @override
  Future<FlameEntity> sendFlame(String receiverId) =>
      _dataSource.sendFlame(senderId: _currentUserId, receiverId: receiverId);

  @override
  Future<int> getFlameBalance() => _dataSource.getFlameBalance(_currentUserId);
}
