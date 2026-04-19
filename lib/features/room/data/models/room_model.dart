import '../../domain/entities/room_entity.dart';

class RoomModel extends RoomEntity {
  const RoomModel({
    required super.id,
    required super.title,
    required super.type,
    required super.category,
    required super.creatorId,
    required super.createdAt,
    super.inviteCode,
    super.memberCount,
  });

  factory RoomModel.fromFirestore(Map<String, dynamic> map, String id) {
    return RoomModel(
      id: id,
      title: map['title'] as String,
      type: map['type'] == 'private' ? RoomType.private : RoomType.open,
      category: map['category'] as String,
      creatorId: map['creatorId'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      inviteCode: map['inviteCode'] as String?,
      memberCount: (map['memberCount'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'title': title,
        'type': type.name,
        'category': category,
        'creatorId': creatorId,
        'createdAt': createdAt.toIso8601String(),
        'inviteCode': inviteCode,
        'memberCount': memberCount,
      };
}
