import '../../domain/entities/flame_entity.dart';

class FlameModel extends FlameEntity {
  const FlameModel({
    required super.id,
    required super.senderId,
    required super.receiverId,
    required super.sentAt,
  });

  factory FlameModel.fromFirestore(Map<String, dynamic> map, String id) {
    return FlameModel(
      id: id,
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      sentAt: DateTime.parse(map['sentAt'] as String),
    );
  }

  Map<String, dynamic> toFirestore() => {
        'senderId': senderId,
        'receiverId': receiverId,
        'sentAt': sentAt.toIso8601String(),
      };
}
