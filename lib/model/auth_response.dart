class AuthenticationResponse {
  final String token;

  AuthenticationResponse({required this.token});
  static AuthenticationResponse fromJson(Map<String, dynamic> json) =>
      AuthenticationResponse(
        token: json['valid']['jwt']!,
      );
}
