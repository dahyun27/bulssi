import '../../domain/entities/mission_entity.dart';

class MissionModel extends MissionEntity {
  const MissionModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.category,
    required super.createdAt,
    super.streakCount,
  });

  factory MissionModel.fromFirestore(Map<String, dynamic> map, String id) {
    return MissionModel(
      id: id,
      userId: map['userId'] as String,
      title: map['title'] as String,
      category: map['category'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
      streakCount: (map['streakCount'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'userId': userId,
        'title': title,
        'category': category,
        'createdAt': createdAt.toIso8601String(),
        'streakCount': streakCount,
      };
}
