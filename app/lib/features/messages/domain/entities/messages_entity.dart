class MessageEntity {
  final int id;
  final String title;
  final String message;
  final String createdAt;

  MessageEntity(
      {required this.id,
      required this.title,
      required this.message,
      required this.createdAt});
}
