// To parse this JSON data, do
//
//     final confirmResetPasswordModel = confirmResetPasswordModelfromJson(jsonString);

import 'dart:convert';

ConfirmResetPasswordModel confirmResetPasswordModelfromJson(String str) =>
    ConfirmResetPasswordModel.fromJson(json.decode(str));

String confirmResetPasswordModeltoJson(ConfirmResetPasswordModel data) => json.encode(data.toJson());

class ConfirmResetPasswordModel {
  String? message;
  int? errorCode;
  bool? success;
  Data? data;

  ConfirmResetPasswordModel({
    this.message,
    this.errorCode,
    this.success,
    this.data,
  });

  factory ConfirmResetPasswordModel.fromJson(Map<String, dynamic> json) => ConfirmResetPasswordModel(
        message: json["message"],
        errorCode: json["errorCode"],
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errorCode": errorCode,
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  List<String>? accountId;

  Data({
    this.accountId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accountId: json["accountId"] == null ? [] : List<String>.from(json["accountId"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "accountId": accountId == null ? [] : List<dynamic>.from(accountId!.map((x) => x)),
      };
}
