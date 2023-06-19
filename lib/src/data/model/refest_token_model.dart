import 'dart:convert';

class RefestTokenModel {
  final String? message;
  final int? errorCode;
  final bool? success;
  String? accessToken;
  final List<String>? data;

  RefestTokenModel({
    this.message,
    this.errorCode,
    this.success,
    this.data,
    this.accessToken
  });

  RefestTokenModel copyWith({
    String? message,
    int? errorCode,
    bool? success,
    String? accessToken,
    List<String>? data,
  }) =>
      RefestTokenModel(
        message: message ?? this.message,
        errorCode: errorCode ?? this.errorCode,
        success: success ?? this.success,
        data: data ?? this.data,
      );

  factory RefestTokenModel.fromJson(String str) => RefestTokenModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RefestTokenModel.fromMap(Map<String, dynamic> json) => RefestTokenModel(
        message: json["message"],
        errorCode: json["errorCode"],
        accessToken: json['accessToken'],
        success: json["success"],
        data: json["data"] == null ? [] : List<String>.from(json["data"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "errorCode": errorCode,
        "success": success,
        "accessToken":accessToken,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
      };
}
