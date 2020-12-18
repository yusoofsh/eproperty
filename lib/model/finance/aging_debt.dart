import 'dart:convert';

class AgingDebt {
  AgingDebt({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  Data data;

  factory AgingDebt.fromRawJson(String str) =>
      AgingDebt.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AgingDebt.fromJson(Map<String, dynamic> json) => AgingDebt(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.total,
    this.detail,
  });

  int total;
  List<Detail> detail;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        detail:
            List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
      };
}

class Detail {
  Detail({
    this.name,
    this.category,
    this.value,
    this.percent,
  });

  String name;
  String category;
  int value;
  int percent;

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        name: json["name"],
        category: json["category"],
        value: json["value"],
        percent: json["percent"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "value": value,
        "percent": percent,
      };
}
