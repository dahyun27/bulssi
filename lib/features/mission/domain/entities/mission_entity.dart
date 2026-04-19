class MissionEntity {
  const MissionEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.category,
    required this.createdAt,
    this.streakCount = 0,
  });

  final String id;
  final String userId;
  final String title;
  final String category;
  final DateTime createdAt;
  final int streakCount;
}
