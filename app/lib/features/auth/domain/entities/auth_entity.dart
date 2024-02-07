class AuthEntity {
  final String token;
  final int expiresIn;
  final String message;
  final bool status;

  AuthEntity({
    required this.token,
    required this.expiresIn,
    required this.status,
    required this.message,
  });
}
