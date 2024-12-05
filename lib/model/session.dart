import 'package:callinteligence/model/auth_response.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Session {
  final String token;
  final int expiresAt;
  final int createdAt;
  final int userID;
  final String userName;
  final String userEmail;
  final int userType;

  Session(
      {required this.userID,
      required this.userName,
      required this.userEmail,
      required this.userType,
      required this.token,
      required this.expiresAt,
      required this.createdAt});

  static Session fromJson(Map<String, dynamic> json) {
    return Session(
      token: json['token'],
      expiresAt: json['expiresAt'],
      createdAt: json['createdAt'],
      userID: json['userID'],
      userEmail: json['userEmail'],
      userName: json['userName'],
      userType: json['userType'],
    );
  }

  static Session fromAuthResponse(
      AuthenticationResponse authenticationResponse) {
    Map<String, dynamic> decodedToken =
        JwtDecoder.decode(authenticationResponse.token);
    return Session(
      token: authenticationResponse.token,
      expiresAt: decodedToken['exp'],
      createdAt: decodedToken['iat'],
      userID: decodedToken['data']['user_id'],
      userEmail: decodedToken['data']['user_email'],
      userName: decodedToken['data']['user_name'],
      userType: decodedToken['data']['user_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expiresAt': expiresAt,
      'createdAt': createdAt,
      'userID': userID,
      'userName': userName,
      'userType': userType,
      'userEmail': userEmail
    };
  }
}
