import 'dart:async';
import 'dart:convert';

import 'package:callinteligence/model/session.dart';
import 'package:callinteligence/api/ai_analytics_api.dart';
import 'package:callinteligence/model/http_response.dart';
import 'package:callinteligence/model/auth_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class SessionClient {
  final FlutterSecureStorage _secureStore;
  final AIAnalyticsAPI _aiAnalyticsAPI;
  Completer? _completer;
  SessionClient(this._secureStore, this._aiAnalyticsAPI);
  void _complete() {
    if (_completer != null) {
      if (!_completer!.isCompleted) {
        _completer!.complete();
      }
    }
  }

  Future<Session?> get currentSession async {
    if (_completer != null) {
      await _completer!.future;
    }
    _completer = Completer();
    bool keepSession = GetIt.instance<bool>();
    final String? data = await _secureStore.read(key: "SESSION");

    if (data != null) {
      final Session session = Session.fromJson(jsonDecode(data));
      final DateTime currentDay = DateTime.now();
      final int currentTimeStamp = currentDay.millisecondsSinceEpoch ~/ 1000;
      final int expiresAt = session.expiresAt;
      if (!keepSession) {
        if (currentTimeStamp > expiresAt) {
          _complete();
          await sigOutSession();
          return null;
        }
        _complete();
        return session;
      }
      if (currentTimeStamp < expiresAt) {
        _complete();
        return session;
      }
      final HttpResponse<AuthenticationResponse> response =
          await _aiAnalyticsAPI.refreshToken(session.token);
      if (response.data != null) {
        Session session = await saveSession(response.data!);
        _complete();
        return session;
      }
      _complete();
      return null;
    }
    _complete();
    return null;
  }

  Future<Session> saveSession(
      AuthenticationResponse authenticationResponse) async {
    final Session session = Session.fromAuthResponse(authenticationResponse);
    final String data = jsonEncode(session.toJson());
    await _secureStore.write(key: 'SESSION', value: data);
    return session;
  }

  Future<void> sigOutSession() async {
    await _secureStore.deleteAll();
  }
}
