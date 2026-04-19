import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/badge_model.dart';
import '../models/profile_model.dart';

abstract interface class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile(String userId);
  Future<List<BadgeModel>> getBadges(String userId);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<ProfileModel> getProfile(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    return ProfileModel.fromFirestore(doc.data()!, doc.id);
  }

  @override
  Future<List<BadgeModel>> getBadges(String userId) async {
    final snap = await _firestore.collection('users').doc(userId).collection('badges').get();
    return snap.docs.map((d) => BadgeModel.fromFirestore(d.data())).toList();
  }
}
