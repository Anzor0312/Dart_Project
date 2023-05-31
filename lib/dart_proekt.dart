import 'package:dart_proekt/core/constant/network/dio_config.dart';
import 'package:dart_proekt/core/constant/status_code_const.dart';
import 'package:dio/dio.dart';

import 'core/constant/network/dio_error_catch_config.dart';
//import 'package:firstapp/model/currency_model.dart';

class GetCurrencyService {
  static getCurrency() async {
    try {
      Response response = await DioConfig.createRequest()
          .get("http://192.168.42.37:4000/data");

      switch (response.statusCode) {
        case StatusCode.success:
          print(response.data);
          break;
        case StatusCode.notFound:
          print("404 Not Found");
          break;
        case StatusCode.notImplemented:
          print("504 Not Implemented");
          break;
        default:
          print("500 Internal Server Error");
          break;
      }
    } on DioError catch (e) {
      print(e);
      print(DioHandleCatchError.hendleCatchError(e));
    }
  }
}
