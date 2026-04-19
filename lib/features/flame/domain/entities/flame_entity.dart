class FlameEntity {
  const FlameEntity({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.sentAt,
  });

  final String id;
  final String senderId;
  final String receiverId;
  final DateTime sentAt;
}
