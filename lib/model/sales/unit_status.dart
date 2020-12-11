import 'dart:convert';

class UnitStatus {
  UnitStatus({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  Data data;

  factory UnitStatus.fromRawJson(String str) =>
      UnitStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UnitStatus.fromJson(Map<String, dynamic> json) => UnitStatus(
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
    this.statusAll,
    this.statusA,
    this.statusB,
    this.statusH,
  });

  int statusAll;
  int statusA;
  int statusB;
  int statusH;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        statusAll: json['statusAll'],
        statusA: json['statusA'],
        statusB: json['statusB'],
        statusH: json['statusH'],
      );

  Map<String, dynamic> toJson() => {
        'statusAll': statusAll,
        'statusA': statusA,
        'statusB': statusB,
        'statusH': statusH,
      };
}
