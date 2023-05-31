import 'package:dio/dio.dart';

class DioConfig {
  // ignore: body_might_complete_normally_nullable
  static Dio createRequest() {
    Dio dio = Dio(BaseOptions
    (
      validateStatus: (int? statusCode) {
        if (statusCode != null) {
          if (statusCode >= 100 && statusCode < 500) {
            return true;
          } else {
            return false;
          }
        } else {
          return false;
        }
      },
      receiveDataWhenStatusError: true,
    ));

    // TIME OUT CONFIGURATION

    dio.options.connectTimeout = Duration(seconds: 15);
    dio.options.receiveTimeout = Duration(seconds: 25);
    dio.options.sendTimeout = Duration(seconds: 20);
    return dio;
  }
}