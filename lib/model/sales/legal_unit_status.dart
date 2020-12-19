import 'dart:convert';

class LegalUnitStatus {
  LegalUnitStatus({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory LegalUnitStatus.fromRawJson(String str) =>
      LegalUnitStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LegalUnitStatus.fromJson(Map<String, dynamic> json) =>
      LegalUnitStatus(
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
    this.qty,
  });

  String name;
  int qty;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json['name'],
        qty: json['qty'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'qty': qty,
      };
}
