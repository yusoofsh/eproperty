import 'dart:convert';

class Reservation {
  Reservation({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  Data data;

  factory Reservation.fromRawJson(String str) =>
      Reservation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
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
    this.batal,
  });

  num asOf;
  int bulanIni;
  num batal;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        asOf: json['asOf'],
        bulanIni: json['bulanIni'],
        batal: json['batal'],
      );

  Map<String, dynamic> toJson() => {
        'asOf': asOf,
        'bulanIni': bulanIni,
        'batal': batal,
      };
}
