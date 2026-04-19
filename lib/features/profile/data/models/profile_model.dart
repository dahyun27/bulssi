import '../../domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.userId,
    required super.nickname,
    required super.totalVerifications,
    required super.maxStreak,
    required super.currentStreak,
    super.profileImageUrl,
  });

  factory ProfileModel.fromFirestore(Map<String, dynamic> map, String id) {
    return ProfileModel(
      userId: id,
      nickname: map['nickname'] as String,
      totalVerifications: (map['totalVerifications'] as int?) ?? 0,
      maxStreak: (map['maxStreak'] as int?) ?? 0,
      currentStreak: (map['currentStreak'] as int?) ?? 0,
      profileImageUrl: map['profileImageUrl'] as String?,
    );
  }
}
