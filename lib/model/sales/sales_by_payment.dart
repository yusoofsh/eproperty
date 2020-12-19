import 'dart:convert';

class SalesByPayment {
  SalesByPayment({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory SalesByPayment.fromRawJson(String str) =>
      SalesByPayment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SalesByPayment.fromJson(Map<String, dynamic> json) => SalesByPayment(
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
  num unit;
  num value;

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
