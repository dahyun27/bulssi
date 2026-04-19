import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signInWithApple();
  Future<UserModel> signInWithEmail({required String email, required String password});
  Future<UserModel> signUpWithEmail({required String email, required String password, required String nickname});
  Future<void> signOut();
  Stream<UserModel?> get authStateChanges;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._auth, this._firestore);

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  @override
  Future<UserModel> signInWithApple() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signInWithEmail({required String email, required String password}) async {
    final credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final doc = await _firestore.collection('users').doc(credential.user!.uid).get();
    return UserModel.fromFirestore(doc.data()!, doc.id);
  }

  @override
  Future<UserModel> signUpWithEmail({required String email, required String password, required String nickname}) async {
    final credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final model = UserModel(id: credential.user!.uid, email: email, nickname: nickname, createdAt: DateTime.now());
    await _firestore.collection('users').doc(model.id).set(model.toFirestore());
    return model;
  }

  @override
  Future<void> signOut() => _auth.signOut();

  @override
  Stream<UserModel?> get authStateChanges => _auth.authStateChanges().asyncMap((user) async {
        if (user == null) return null;
        final doc = await _firestore.collection('users').doc(user.uid).get();
        return doc.exists ? UserModel.fromFirestore(doc.data()!, doc.id) : null;
      });
}
