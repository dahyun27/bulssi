import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/mission_model.dart';
import '../models/verification_model.dart';

abstract interface class MissionRemoteDataSource {
  Future<MissionModel> createMission({required String userId, required String title, required String category});
  Future<VerificationModel> verifyMission({required String missionId, required String userId, String? imageUrl, String? comment});
  Future<int> getStreak(String missionId);
  Stream<List<VerificationModel>> getVerificationFeed(String roomId);
}

class MissionRemoteDataSourceImpl implements MissionRemoteDataSource {
  MissionRemoteDataSourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<MissionModel> createMission({required String userId, required String title, required String category}) async {
    final ref = _firestore.collection('missions').doc();
    final model = MissionModel(id: ref.id, userId: userId, title: title, category: category, createdAt: DateTime.now());
    await ref.set(model.toFirestore());
    return model;
  }

  @override
  Future<VerificationModel> verifyMission({required String missionId, required String userId, String? imageUrl, String? comment}) async {
    final ref = _firestore.collection('verifications').doc();
    final model = VerificationModel(id: ref.id, missionId: missionId, userId: userId, verifiedAt: DateTime.now(), imageUrl: imageUrl, comment: comment);
    await ref.set(model.toFirestore());
    return model;
  }

  @override
  Future<int> getStreak(String missionId) async {
    final doc = await _firestore.collection('missions').doc(missionId).get();
    return (doc.data()?['streakCount'] as int?) ?? 0;
  }

  @override
  Stream<List<VerificationModel>> getVerificationFeed(String roomId) {
    return _firestore
        .collection('verifications')
        .where('roomId', isEqualTo: roomId)
        .orderBy('verifiedAt', descending: true)
        .snapshots()
        .map((snap) => snap.docs.map((d) => VerificationModel.fromFirestore(d.data(), d.id)).toList());
  }
}
