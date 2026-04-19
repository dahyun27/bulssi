import '../../domain/entities/badge_entity.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this._dataSource);
  final ProfileRemoteDataSource _dataSource;

  @override
  Future<ProfileEntity> getProfile(String userId) => _dataSource.getProfile(userId);

  @override
  Future<List<BadgeEntity>> getBadges(String userId) => _dataSource.getBadges(userId);
}
