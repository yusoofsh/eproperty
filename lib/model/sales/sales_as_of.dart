import 'dart:convert';

class SalesAsOf {
  SalesAsOf({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory SalesAsOf.fromRawJson(String str) =>
      SalesAsOf.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SalesAsOf.fromJson(Map<String, dynamic> json) => SalesAsOf(
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
    this.value,
  });

  String name;
  int unit;
  int value;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json['name'],
        unit: json['unit'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'unit': unit,
        'value': value,
      };
}
