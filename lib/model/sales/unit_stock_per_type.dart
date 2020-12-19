import 'dart:convert';

class UnitStockPerType {
  UnitStockPerType({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory UnitStockPerType.fromRawJson(String str) =>
      UnitStockPerType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UnitStockPerType.fromJson(Map<String, dynamic> json) =>
      UnitStockPerType(
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
    this.type,
    this.stock,
    this.sold,
    this.remain,
  });

  String type;
  num stock;
  num sold;
  num remain;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        type: json['type'],
        stock: json['stock'],
        sold: json['sold'],
        remain: json['remain'],
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'stock': stock,
        'sold': sold,
        'remain': remain,
      };
}
