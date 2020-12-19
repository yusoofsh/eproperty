import 'dart:convert';

class CollectionPercentage {
  CollectionPercentage({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  Data data;

  factory CollectionPercentage.fromRawJson(String str) =>
      CollectionPercentage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CollectionPercentage.fromJson(Map<String, dynamic> json) =>
      CollectionPercentage(
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
    this.lancar,
    this.tidakLancar,
  });

  num lancar;
  num tidakLancar;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        lancar: json['lancar'],
        tidakLancar: json['tidakLancar'],
      );

  Map<String, dynamic> toJson() => {
        'lancar': lancar,
        'tidakLancar': tidakLancar,
      };
}
