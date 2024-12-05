import 'package:callinteligence/http/http.dart';
import 'package:callinteligence/model/http_response.dart';
import 'package:callinteligence/model/auth_response.dart';
import 'package:dio/dio.dart';

class AIAnalyticsAPI {
  final _baseURL = 'https://sttn2a.ddns.net/AI_Analytics/';
  final _loginURL = 'account/login/';
  final _refreshURL = 'account/login/refresh-token/';
  final Http _http;

  AIAnalyticsAPI(this._http);

  Future<HttpResponse<AuthenticationResponse>> refreshToken(String oldToken) {
    return _http.request<AuthenticationResponse>(
      '$_baseURL$_refreshURL',
      method: "POST",
      headers: {'Authorization': 'Bearer $oldToken'},
      parser: (p0) => AuthenticationResponse.fromJson(p0),
    );
  }

  Future<HttpResponse<AuthenticationResponse>> getToken(
      String userEmail, String userPassword) {
    FormData formData = FormData.fromMap({
      'user_email': userEmail,
      'user_password': userPassword,
    });
    return _http.request<AuthenticationResponse>(
      '$_baseURL$_loginURL',
      method: "POST",
      headers: {
        'Content-Type': 'multipart/form-data',
      },
      data: formData,
      parser: (p0) => AuthenticationResponse.fromJson(p0),
    );
  }
}
