class UserEntity {
  const UserEntity({
    required this.id,
    required this.email,
    required this.nickname,
    this.profileImageUrl,
    this.createdAt,
  });

  final String id;
  final String email;
  final String nickname;
  final String? profileImageUrl;
  final DateTime? createdAt;
}
