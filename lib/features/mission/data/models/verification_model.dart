import '../../domain/entities/verification_entity.dart';

class VerificationModel extends VerificationEntity {
  const VerificationModel({
    required super.id,
    required super.missionId,
    required super.userId,
    required super.verifiedAt,
    super.imageUrl,
    super.comment,
  });

  factory VerificationModel.fromFirestore(Map<String, dynamic> map, String id) {
    return VerificationModel(
      id: id,
      missionId: map['missionId'] as String,
      userId: map['userId'] as String,
      verifiedAt: DateTime.parse(map['verifiedAt'] as String),
      imageUrl: map['imageUrl'] as String?,
      comment: map['comment'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'missionId': missionId,
        'userId': userId,
        'verifiedAt': verifiedAt.toIso8601String(),
        'imageUrl': imageUrl,
        'comment': comment,
      };
}
