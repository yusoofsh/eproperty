import 'dart:convert';

class AgingReservation {
  AgingReservation({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory AgingReservation.fromRawJson(String str) =>
      AgingReservation.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AgingReservation.fromJson(Map<String, dynamic> json) =>
      AgingReservation(
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
    this.count,
  });

  String name;
  int count;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json['name'],
        count: json['count'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'count': count,
      };
}
