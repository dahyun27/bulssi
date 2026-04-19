import '../../domain/entities/mission_entity.dart';
import '../../domain/entities/verification_entity.dart';
import '../../domain/repositories/mission_repository.dart';
import '../datasources/mission_remote_datasource.dart';

class MissionRepositoryImpl implements MissionRepository {
  const MissionRepositoryImpl(this._dataSource, this._currentUserId);
  final MissionRemoteDataSource _dataSource;
  final String _currentUserId;

  @override
  Future<MissionEntity> createMission({required String title, required String category}) =>
      _dataSource.createMission(userId: _currentUserId, title: title, category: category);

  @override
  Future<VerificationEntity> verifyMission({required String missionId, String? imageUrl, String? comment}) =>
      _dataSource.verifyMission(missionId: missionId, userId: _currentUserId, imageUrl: imageUrl, comment: comment);

  @override
  Future<int> getStreak(String missionId) => _dataSource.getStreak(missionId);

  @override
  Stream<List<VerificationEntity>> getVerificationFeed(String roomId) => _dataSource.getVerificationFeed(roomId);
}
