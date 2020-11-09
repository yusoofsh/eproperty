import 'base_model.dart';

class TokenModel extends BaseModel {
  TokenModel({this.token, this.user});

  TokenModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['token'] = token;
    if (user != null) {
      map['user'] = user.toJson();
    }
    return map;
  }

  String token;
  User user;
}

class User {
  User(
      {this.id,
      this.name,
      this.email,
      this.apiUrl,
      this.apiKey,
      this.level,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.accesses});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    apiUrl = json['api_url'];
    apiKey = json['api_key'];
    level = json['level'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['accesses'] != null) {
      accesses = [];
      json['accesses'].forEach((v) {
        accesses.add(Accesses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['api_url'] = apiUrl;
    map['api_key'] = apiKey;
    map['level'] = level;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    if (accesses != null) {
      map['accesses'] = accesses.map((v) => v.toJson()).toList();
    }
    return map;
  }

  int id;
  String name;
  String email;
  dynamic apiUrl;
  dynamic apiKey;
  int level;
  dynamic createdAt;
  String updatedAt;
  dynamic deletedAt;
  List<Accesses> accesses;
}

class Accesses {
  Accesses({this.name, this.status, this.userId});

  Accesses.fromJson(dynamic json) {
    name = json['name'];
    status = json['status'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['status'] = status;
    map['user_id'] = userId;
    return map;
  }

  String name;
  int status;
  int userId;
}
