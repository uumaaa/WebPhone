class HttpResponse<T> {
  final T? data;
  final HttpError? httpError;

  HttpResponse(
    this.data,
    this.httpError,
  );

  static HttpResponse<T> success<T>(T data) => HttpResponse(data, null);
  static HttpResponse<T> fail<T>(
    int statusCode,
    String message,
    dynamic data,
  ) =>
      HttpResponse<T>(
          null,
          HttpError(
            statusCode: statusCode,
            message: message,
            data: data,
          ));
}

class HttpError {
  final int statusCode;
  final String message;
  final dynamic data;

  HttpError({
    required this.statusCode,
    required this.message,
    required this.data,
  });
}
