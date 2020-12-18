import 'dart:convert';

class MonthSummary {
  MonthSummary({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  Data data;

  factory MonthSummary.fromRawJson(String str) =>
      MonthSummary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MonthSummary.fromJson(Map<String, dynamic> json) => MonthSummary(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.thisMonth,
  });

  int thisMonth;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        thisMonth: json["thisMonth"],
      );

  Map<String, dynamic> toJson() => {
        "thisMonth": thisMonth,
      };
}
