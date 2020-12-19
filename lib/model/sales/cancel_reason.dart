import 'dart:convert';

class CancelReason {
  CancelReason({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory CancelReason.fromRawJson(String str) =>
      CancelReason.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CancelReason.fromJson(Map<String, dynamic> json) => CancelReason(
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
    this.unit,
  });

  String name;
  num unit;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json['name'],
        unit: json['unit'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'unit': unit,
      };
}
