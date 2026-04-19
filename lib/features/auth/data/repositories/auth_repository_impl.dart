import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._dataSource);
  final AuthRemoteDataSource _dataSource;

  @override
  Future<UserEntity> signInWithApple() => _dataSource.signInWithApple();

  @override
  Future<UserEntity> signInWithEmail({required String email, required String password}) =>
      _dataSource.signInWithEmail(email: email, password: password);

  @override
  Future<UserEntity> signUpWithEmail({required String email, required String password, required String nickname}) =>
      _dataSource.signUpWithEmail(email: email, password: password, nickname: nickname);

  @override
  Future<void> signOut() => _dataSource.signOut();

  @override
  Stream<UserEntity?> get authStateChanges => _dataSource.authStateChanges;
}
