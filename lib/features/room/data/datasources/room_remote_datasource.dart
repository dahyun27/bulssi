import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/room_entity.dart';
import '../models/room_model.dart';

abstract interface class RoomRemoteDataSource {
  Future<RoomModel> createRoom({required String title, required RoomType type, required String category, required String creatorId});
  Future<RoomModel> joinRoomWithCode(String code);
  Stream<List<RoomModel>> getOpenRooms({String? category});
}

class RoomRemoteDataSourceImpl implements RoomRemoteDataSource {
  RoomRemoteDataSourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<RoomModel> createRoom({required String title, required RoomType type, required String category, required String creatorId}) async {
    final ref = _firestore.collection('rooms').doc();
    final inviteCode = type == RoomType.private ? ref.id.substring(0, 6).toUpperCase() : null;
    final model = RoomModel(id: ref.id, title: title, type: type, category: category, creatorId: creatorId, createdAt: DateTime.now(), inviteCode: inviteCode);
    await ref.set(model.toFirestore());
    return model;
  }

  @override
  Future<RoomModel> joinRoomWithCode(String code) async {
    final snap = await _firestore.collection('rooms').where('inviteCode', isEqualTo: code).limit(1).get();
    if (snap.docs.isEmpty) throw Exception('유효하지 않은 초대 코드입니다.');
    return RoomModel.fromFirestore(snap.docs.first.data(), snap.docs.first.id);
  }

  @override
  Stream<List<RoomModel>> getOpenRooms({String? category}) {
    Query<Map<String, dynamic>> query = _firestore.collection('rooms').where('type', isEqualTo: 'open');
    if (category != null) query = query.where('category', isEqualTo: category);
    return query.snapshots().map((snap) => snap.docs.map((d) => RoomModel.fromFirestore(d.data(), d.id)).toList());
  }
}
