import 'dart:convert';

class Ratio {
  Ratio({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  int data;

  factory Ratio.fromRawJson(String str) => Ratio.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ratio.fromJson(Map<String, dynamic> json) => Ratio(
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data,
      };
}
