class BaseModel {
  BaseModel({this.success, this.message});

  BaseModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    return map;
  }

  bool success;
  String message;
}
