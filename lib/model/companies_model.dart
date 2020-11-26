// ignore_for_file: sort_constructors_first

import 'dart:convert';

class CompaniesModel {
  CompaniesModel({
    this.success,
    this.data,
  });

  final bool success;
  final List<Datum> data;

  factory CompaniesModel.fromRawJson(String str) =>
      CompaniesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CompaniesModel.fromJson(Map<String, dynamic> json) => CompaniesModel(
        success: json['success'],
        data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
  });

  final int id;
  final String name;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
