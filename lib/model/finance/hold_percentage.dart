import 'dart:convert';

class HoldPercentage {
  HoldPercentage({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory HoldPercentage.fromRawJson(String str) =>
      HoldPercentage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HoldPercentage.fromJson(Map<String, dynamic> json) => HoldPercentage(
        code: json['code'],
        message: json['message'],
        data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.name,
    this.percent,
  });

  String name;
  num percent;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json['name'],
        percent: json['percent'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'percent': percent,
      };
}
