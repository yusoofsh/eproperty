import 'dart:convert';

class BaseModel {
  BaseModel({
    this.success,
    this.message,
  });

  final bool success;
  final String message;

  factory BaseModel.fromRawJson(String str) =>
      BaseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        success: json['success'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };
}
