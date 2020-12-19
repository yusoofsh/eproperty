import 'dart:convert';

class Sales {
  Sales({
    this.code,
    this.message,
    this.data,
  });

  int code;
  String message;
  List<Datum> data;

  factory Sales.fromRawJson(String str) => Sales.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
        code: json['code'],
        message: json['message'],
        data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.month,
    this.targetQty,
    this.realisasiQty,
    this.percentQty,
    this.targetValue,
    this.realisasiValue,
    this.percentValue,
  });

  int month;
  num targetQty;
  num realisasiQty;
  num percentQty;
  num targetValue;
  num realisasiValue;
  num percentValue;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        month: json['month'],
        targetQty: json['target_qty'],
        realisasiQty: json['realisasi_qty'],
        percentQty: json['percent_qty'],
        targetValue: json['target_value'],
        realisasiValue: json['realisasi_value'],
        percentValue: json['percent_value'],
      );

  Map<String, dynamic> toJson() => {
        'month': month,
        'target_qty': targetQty,
        'realisasi_qty': realisasiQty,
        'percent_qty': percentQty,
        'target_value': targetValue,
        'realisasi_value': realisasiValue,
        'percent_value': percentValue,
      };
}
