import 'dart:convert';

class MailOrder {
  MailOrder({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  Data data;

  factory MailOrder.fromRawJson(String str) =>
      MailOrder.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MailOrder.fromJson(Map<String, dynamic> json) => MailOrder(
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

  int asOf;
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
