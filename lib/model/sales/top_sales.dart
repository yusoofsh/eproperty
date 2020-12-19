import 'dart:convert';

class TopSales {
  TopSales({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory TopSales.fromRawJson(String str) =>
      TopSales.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopSales.fromJson(Map<String, dynamic> json) => TopSales(
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
    this.jumlah,
    this.value,
  });

  String name;
  num jumlah;
  num value;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json['name'],
        jumlah: json['jumlah'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'jumlah': jumlah,
        'value': value,
      };
}
