enum BadgeType { streak1, streak7, streak30 }

class BadgeEntity {
  const BadgeEntity({
    required this.type,
    required this.earnedAt,
  });

  final BadgeType type;
  final DateTime earnedAt;

  String get label => switch (type) {
        BadgeType.streak1 => '첫 불씨',
        BadgeType.streak7 => '7일 연속',
        BadgeType.streak30 => '30일 연속',
      };

  String get emoji => switch (type) {
        BadgeType.streak1 => '🌱',
        BadgeType.streak7 => '🔥',
        BadgeType.streak30 => '💎',
      };
}
