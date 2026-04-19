import '../../domain/entities/badge_entity.dart';

class BadgeModel extends BadgeEntity {
  const BadgeModel({required super.type, required super.earnedAt});

  factory BadgeModel.fromFirestore(Map<String, dynamic> map) {
    return BadgeModel(
      type: BadgeType.values.byName(map['type'] as String),
      earnedAt: DateTime.parse(map['earnedAt'] as String),
    );
  }
}
