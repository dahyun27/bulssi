import '../entities/user_entity.dart';

abstract interface class AuthRepository {
  Future<UserEntity> signInWithApple();
  Future<UserEntity> signInWithEmail({required String email, required String password});
  Future<UserEntity> signUpWithEmail({required String email, required String password, required String nickname});
  Future<void> signOut();
  Stream<UserEntity?> get authStateChanges;
}
