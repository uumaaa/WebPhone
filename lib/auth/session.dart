class Session {
  final String token;
  final int expiresIn;
  final DateTime createdAt;

  Session(
      {required this.token, required this.expiresIn, required this.createdAt});

  static Session fromJson(Map<String, dynamic> json) => Session(
      token: json['token'],
      expiresIn: json['expiresIn'],
      createdAt: DateTime.parse(json['createdAt']));

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expiresIn': expiresIn,
      'createdAt': createdAt.toString(),
    };
  }
}
