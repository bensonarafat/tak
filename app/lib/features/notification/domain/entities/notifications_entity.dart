class NotificationEntity {
  final int id;
  final String subject;
  final String message;
  final String createdAt;

  NotificationEntity({
    required this.id,
    required this.subject,
    required this.message,
    required this.createdAt,
  });
}
