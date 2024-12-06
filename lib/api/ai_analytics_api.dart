import 'package:callinteligence/http/http.dart';
import 'package:callinteligence/model/http_response.dart';
import 'package:callinteligence/model/auth_response.dart';
import 'package:callinteligence/model/session.dart';
import 'package:callinteligence/model/transcription.dart';
import 'package:callinteligence/session/session_client.dart';
import 'package:callinteligence/utils/logs.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class AIAnalyticsAPI {
  final _baseURL = 'https://sttn2a.ddns.net/AI_Analytics/';
  final _loginURL = 'account/login/';
  final _refreshURL = 'account/login/refresh-token/';
  final _performTranscriptionURL = 'utilities/perform/transcription/';
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

  Future<HttpResponse<Transcription>> performTranscription(
      String audioFilePath) async {
    final SessionClient sessionClient = GetIt.instance<SessionClient>();
    final Session? session =
        await sessionClient.currentSession; //TODO session null
    final String token = session!.token;
    final FormData formData =
        FormData.fromMap({"audio": MultipartFile.fromFileSync(audioFilePath)});
    return _http.request<Transcription>(
      '$_baseURL$_performTranscriptionURL',
      method: "POST",
      headers: {
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer $token',
      },
      data: formData,
      parser: (p0) => Transcription.fromJson(p0),
    );
  }
}
