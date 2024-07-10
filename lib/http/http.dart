import 'package:callinteligence/http/http_response.dart';
import 'package:callinteligence/utils/logs.dart';
import 'package:dio/dio.dart';

class Http {
  late Dio _dio;
  Http({required Dio dio}) {
    _dio = dio;
  }

  Future<HttpResponse<T>> request<T>(String path,
      {Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      String method = "GET",
      T Function(dynamic data)? parser}) async {
    try {
      Response response = await _dio.request(
        path,
        options: Options(headers: headers, method: method),
        queryParameters: queryParameters,
        data: data,
      );
      Logs.p.i(response.data);
      if (parser != null) {
        return HttpResponse.success<T>(parser(response.data));
      }
      return HttpResponse.success<T>(response.data);
    } catch (e) {
      int statusCode = 0;
      String message = "Unknown error";
      dynamic data;
      if (e is DioException) {
        statusCode = -1;
        Logs.p.e(e.response);
        if (e.response != null) {
          statusCode = e.response!.statusCode!;
          message = e.response!.statusMessage!;
          data = e.response!.data;
        }
      }
      Logs.p.e(e);
      Logs.p.e(path);
      return HttpResponse.fail(statusCode, message, data);
    }
  }
}
