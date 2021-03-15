import 'dart:convert';

class UserModel {
  UserModel({
    this.success,
    this.message,
    this.token,
    this.user,
  });

  final bool success;
  final String message;
  final String token;
  final User user;

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json['success'],
        message: json['message'],
        token: json['token'],
        user: User.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'token': token,
        'user': user.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.level,
    this.apiUrl,
    this.apiKey,
    this.status,
    this.image,
    this.access,
  });

  final int id;
  final String name;
  final String email;
  final String level;
  final String apiUrl;
  final String apiKey;
  final String status;
  final String image;
  final List<Access> access;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        level: json['level'],
        apiUrl: json['api_url'],
        apiKey: json['api_key'],
        status: json['status'],
        image: json['image'],
        access:
            List<Access>.from(json['access'].map((x) => Access.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'level': level,
        'api_url': apiUrl,
        'api_key': apiKey,
        'status': status,
        'image': image,
        'access': List<dynamic>.from(access.map((x) => x.toJson())),
      };
}

class Access {
  Access({
    this.name,
    this.status,
  });

  final String name;
  final bool status;

  factory Access.fromRawJson(String str) => Access.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Access.fromJson(Map<String, dynamic> json) => Access(
        name: json['name'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'status': status,
      };
}
