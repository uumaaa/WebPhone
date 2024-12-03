import 'package:callinteligence/http/http.dart';
import 'package:callinteligence/http/http_response.dart';
import 'package:callinteligence/model/auth_response.dart';
import 'package:get_it/get_it.dart';

class AIAnalyticsAPI {
  final userAPI = 'users/';
  final loginAPI = 'login/';
  final refreshTokenAPI = 'refresh-token/';
  final Http _http;
  String baseAPI = GetIt.instance<String>();

  AIAnalyticsAPI(this._http);

  Future<HttpResponse<AuthenticationResponse>> refreshToken(
      String expiredToken) {
    return _http.request<AuthenticationResponse>(
      '$baseAPI$refreshTokenAPI',
      method: "POST",
      headers: {"refreshtoken": expiredToken},
      parser: (p0) => AuthenticationResponse.fromJson(p0),
    );
  }
}
