class VerificationEntity {
  const VerificationEntity({
    required this.id,
    required this.missionId,
    required this.userId,
    required this.verifiedAt,
    this.imageUrl,
    this.comment,
  });

  final String id;
  final String missionId;
  final String userId;
  final DateTime verifiedAt;
  final String? imageUrl;
  final String? comment;
}
