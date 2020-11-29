// ignore_for_file: sort_constructors_first

import 'dart:convert';

class SalesModel {
  SalesModel({
    this.code,
    this.message,
  });

  final int code;
  final String message;

  factory SalesModel.fromRawJson(String str) =>
      SalesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SalesModel.fromJson(Map<String, dynamic> json) => SalesModel(
        code: json['code'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
      };
}

class SalesReservationModel extends SalesModel {
  SalesReservationModel({
    this.data,
  });

  final SalesReservationModelData data;

  factory SalesReservationModel.fromRawJson(String str) =>
      SalesReservationModel.fromJson(json.decode(str));

  @override
  String toRawJson() => json.encode(toJson());

  factory SalesReservationModel.fromJson(Map<String, dynamic> json) =>
      SalesReservationModel(
        data: SalesReservationModelData.fromJson(json['data']),
      );

  @override
  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data.toJson(),
      };
}

class SalesReservationModelData {
  SalesReservationModelData({
    this.asOf,
    this.bulanIni,
    this.batal,
  });

  final int asOf;
  final int bulanIni;
  final int batal;

  factory SalesReservationModelData.fromRawJson(String str) =>
      SalesReservationModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SalesReservationModelData.fromJson(Map<String, dynamic> json) =>
      SalesReservationModelData(
        asOf: json['asOf'],
        bulanIni: json['bulanIni'],
        batal: json['batal'],
      );

  Map<String, dynamic> toJson() => {
        'asOf': asOf,
        'bulanIni': bulanIni,
        'batal': batal,
      };
}

class SalesMailOrderModel extends SalesModel {
  SalesMailOrderModel({
    this.data,
  });

  final SalesMailOrderModelData data;

  factory SalesMailOrderModel.fromRawJson(String str) =>
      SalesMailOrderModel.fromJson(json.decode(str));

  @override
  String toRawJson() => json.encode(toJson());

  factory SalesMailOrderModel.fromJson(Map<String, dynamic> json) =>
      SalesMailOrderModel(
        data: SalesMailOrderModelData.fromJson(json['data']),
      );

  @override
  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data.toJson(),
      };
}

class SalesMailOrderModelData {
  SalesMailOrderModelData({
    this.asOf,
    this.bulanIni,
    this.bulanLalu,
  });

  final int asOf;
  final int bulanIni;
  final int bulanLalu;

  factory SalesMailOrderModelData.fromRawJson(String str) =>
      SalesMailOrderModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SalesMailOrderModelData.fromJson(Map<String, dynamic> json) =>
      SalesMailOrderModelData(
        asOf: json['asOf'],
        bulanIni: json['bulanIni'],
        bulanLalu: json['bulanLalu'],
      );

  Map<String, dynamic> toJson() => {
        'asOf': asOf,
        'bulanIni': bulanIni,
        'bulanLalu': bulanLalu,
      };
}
