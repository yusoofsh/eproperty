import 'dart:convert';

class DebtAcceptance {
  DebtAcceptance({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory DebtAcceptance.fromRawJson(String str) =>
      DebtAcceptance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DebtAcceptance.fromJson(Map<String, dynamic> json) => DebtAcceptance(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.month,
    this.target,
    this.realisasi,
    this.percent,
  });

  int month;
  int target;
  int realisasi;
  int percent;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        month: json["month"],
        target: json["target"],
        realisasi: json["realisasi"],
        percent: json["percent"],
      );

  Map<String, dynamic> toJson() => {
        "month": month,
        "target": target,
        "realisasi": realisasi,
        "percent": percent,
      };
}
