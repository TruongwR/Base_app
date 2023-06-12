// To parse this JSON data, do
//
//     final confirmPassword = confirmPasswordfromJson(jsonString);

import 'dart:convert';

ConfirmPasswordModel confirmPasswordfromJson(String str) => ConfirmPasswordModel.fromJson(json.decode(str));

String confirmPasswordtoJson(ConfirmPasswordModel data) => json.encode(data.toJson());

class ConfirmPasswordModel {
  String? message;
  bool? success;

  ConfirmPasswordModel({
    this.message,
    this.success,
  });

  factory ConfirmPasswordModel.fromJson(Map<String, dynamic> json) => ConfirmPasswordModel(
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
      };
}
