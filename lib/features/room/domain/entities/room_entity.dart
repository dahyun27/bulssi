enum RoomType { private, open }

class RoomEntity {
  const RoomEntity({
    required this.id,
    required this.title,
    required this.type,
    required this.category,
    required this.creatorId,
    required this.createdAt,
    this.inviteCode,
    this.memberCount = 0,
  });

  final String id;
  final String title;
  final RoomType type;
  final String category;
  final String creatorId;
  final DateTime createdAt;
  final String? inviteCode;
  final int memberCount;
}
