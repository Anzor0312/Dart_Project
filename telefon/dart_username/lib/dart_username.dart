import 'dart:io';

import 'package:dart_username/user_model/usermodel.dart';
import 'package:dio/dio.dart';

class Currencymodel {
  static currensy() async {
    try {
      Response response =
          await Dio().get("https://nbu.uz/uz/exchange-rates/json/");
      var resData = (response.data as List)
          .map((e) => CurrencyModel.fromJson(e))
          .toList();
      print("enter the exchange rate you have");
      String w = stdin.readLineSync()!;
      print("how much money do you have?");
      String miqdor = stdin.readLineSync()!;
      print("What exchange rate do you need?");
      String h = stdin.readLineSync()!;
      double son = 1;
      String string = "";

      for (CurrencyModel element in resData) {
        for (CurrencyModel a in resData) {
          if (a.code == h) {
            string = a.title!;
            son = double.parse(a.cbPrice!);
          }
          if (element.code == w) {
            print(
                "entered by you $miqdor ${element.title}  ${(double.parse(miqdor) * double.parse(element.cbPrice!)) / son}  $string is equal to");
          }
        }
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        print("Time out");
      } else {
        print("no internet connection");
      }
    }
  }
}
