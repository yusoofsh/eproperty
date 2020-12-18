import 'dart:convert';

class KprReception {
  KprReception({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory KprReception.fromRawJson(String str) =>
      KprReception.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory KprReception.fromJson(Map<String, dynamic> json) => KprReception(
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
