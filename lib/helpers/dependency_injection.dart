//import 'package:callinteligence/http/http.dart';
//import 'package:dio/dio.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:callinteligence/api/ai_analytics_api.dart';
import 'package:callinteligence/session/session_client.dart';
import 'package:callinteligence/http/http.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

abstract class DependencyInjection {
  static void initialize() {
    final Dio dio = Dio();
    final Http http = Http(dio: dio);
    final AIAnalyticsAPI aiAnalyticsApi = AIAnalyticsAPI(http);
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final SessionClient authenticationClient =
        SessionClient(secureStorage, aiAnalyticsApi);
    GetIt.instance.registerSingleton<AIAnalyticsAPI>(aiAnalyticsApi);
    GetIt.instance.registerSingleton<SessionClient>(authenticationClient);
    GetIt.instance.registerFactory<bool>(() => false); // keepSession
  }
}
