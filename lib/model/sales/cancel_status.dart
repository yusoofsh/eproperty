import 'dart:convert';

class CancelStatus {
  CancelStatus({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  Data data;

  factory CancelStatus.fromRawJson(String str) =>
      CancelStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CancelStatus.fromJson(Map<String, dynamic> json) => CancelStatus(
        code: json['code'],
        message: json['message'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data.toJson(),
      };
}

class Data {
  Data({
    this.asOf,
    this.bulanIni,
    this.bulanLalu,
  });

  num asOf;
  int bulanIni;
  int bulanLalu;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        asOf: json['asOf'],
        bulanIni: json['bulanIni'],
        bulanLalu: json['bulanLalu'],
      );

  Map<String, dynamic> toJson() => {
        'asOf': asOf,
        'bulanIni': bulanIni,
        'bulanLalu': bulanLalu,
      };
}
