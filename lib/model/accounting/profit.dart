import 'dart:convert';

class Profit {
  Profit({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory Profit.fromRawJson(String str) => Profit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profit.fromJson(Map<String, dynamic> json) => Profit(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.name,
    this.percentage,
    this.current,
    this.last,
  });

  String name;
  int percentage;
  num current;
  int last;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        percentage: json["percentage"],
        current: json["current"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "percentage": percentage,
        "current": current,
        "last": last,
      };
}
