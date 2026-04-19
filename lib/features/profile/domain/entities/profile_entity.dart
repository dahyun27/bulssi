class ProfileEntity {
  const ProfileEntity({
    required this.userId,
    required this.nickname,
    required this.totalVerifications,
    required this.maxStreak,
    required this.currentStreak,
    this.profileImageUrl,
  });

  final String userId;
  final String nickname;
  final int totalVerifications;
  final int maxStreak;
  final int currentStreak;
  final String? profileImageUrl;
}
