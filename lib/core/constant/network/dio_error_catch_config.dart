import 'package:dio/dio.dart';

class DioHandleCatchError {
  static String hendleCatchError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return "Connect Timeout";
      case DioErrorType.receiveTimeout:
        return "Receive Timeout";
      case DioErrorType.sendTimeout:
        return "Send Timeout";
      case DioErrorType.unknown:
        return "noConnection";
      default:
        return "smtWentWong";
    }
  }
}