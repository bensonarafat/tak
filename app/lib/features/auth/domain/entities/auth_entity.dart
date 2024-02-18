class AuthEntity {
  final String token;
  final int expiresIn;

  AuthEntity({
    required this.token,
    required this.expiresIn,
  });
}
