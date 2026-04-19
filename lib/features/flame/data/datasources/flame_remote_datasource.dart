import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/config/app_config.dart';
import '../models/flame_model.dart';

abstract interface class FlameRemoteDataSource {
  Future<FlameModel> sendFlame({required String senderId, required String receiverId});
  Future<int> getFlameBalance(String userId);
}

class FlameRemoteDataSourceImpl implements FlameRemoteDataSource {
  FlameRemoteDataSourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<FlameModel> sendFlame({required String senderId, required String receiverId}) async {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);

    final todayCount = await _firestore
        .collection('flames')
        .where('senderId', isEqualTo: senderId)
        .where('sentAt', isGreaterThanOrEqualTo: startOfDay.toIso8601String())
        .count()
        .get();

    if ((todayCount.count ?? 0) >= AppConfig.dailyFlameLimit) {
      throw Exception('오늘의 불꽃을 모두 사용했습니다.');
    }

    final ref = _firestore.collection('flames').doc();
    final model = FlameModel(id: ref.id, senderId: senderId, receiverId: receiverId, sentAt: DateTime.now());
    await ref.set(model.toFirestore());
    return model;
  }

  @override
  Future<int> getFlameBalance(String userId) async {
    final today = DateTime.now();
    final startOfDay = DateTime(today.year, today.month, today.day);
    final sent = await _firestore
        .collection('flames')
        .where('senderId', isEqualTo: userId)
        .where('sentAt', isGreaterThanOrEqualTo: startOfDay.toIso8601String())
        .count()
        .get();
    return AppConfig.dailyFlameLimit - (sent.count ?? 0);
  }
}
