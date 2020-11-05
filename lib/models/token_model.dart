class TokenModel {
  bool success;
  String message;
  String token;

  TokenModel({
    this.success,
    this.message,
    this.token,
  });

  TokenModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['token'] = token;
    return map;
  }
}
