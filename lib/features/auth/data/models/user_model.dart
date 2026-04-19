import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.nickname,
    super.profileImageUrl,
    super.createdAt,
  });

  factory UserModel.fromFirestore(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      email: map['email'] as String,
      nickname: map['nickname'] as String,
      profileImageUrl: map['profileImageUrl'] as String?,
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'email': email,
        'nickname': nickname,
        'profileImageUrl': profileImageUrl,
        'createdAt': createdAt?.toIso8601String(),
      };
}
