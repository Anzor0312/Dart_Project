// To parse this JSON data, do
//
//     final currencyModel = currencyModelFromJson(jsonString);

import 'dart:convert';

List<CurrencyModel> currencyModelFromJson(String str) => List<CurrencyModel>.from(json.decode(str).map((x) => CurrencyModel.fromJson(x)));

String currencyModelToJson(List<CurrencyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrencyModel {
  CurrencyModel({
    this.title,
    this.code,
    this.cbPrice,
    this.nbuBuyPrice,
    this.nbuCellPrice,
    this.date,
  });

  String? title;
  String? code;
  String? cbPrice;
  String? nbuBuyPrice;
  String? nbuCellPrice;
  Date? date;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
    title: json["title"],
    code: json["code"],
    cbPrice: json["cb_price"],
    nbuBuyPrice: json["nbu_buy_price"],
    nbuCellPrice: json["nbu_cell_price"],
    date: dateValues.map[json["date"]],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "code": code,
    "cb_price": cbPrice,
    "nbu_buy_price": nbuBuyPrice,
    "nbu_cell_price": nbuCellPrice,
    "date": dateValues.reverse[date],
  };
}

enum Date { THE_28102022 }

final dateValues = EnumValues({
  "28.10.2022": Date.THE_28102022
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
