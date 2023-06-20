// To parse this JSON data, do
//
//     final getNewPasswordModel = getNewPasswordModelfromJson(jsonString);

import 'dart:convert';

GetNewPasswordModel getNewPasswordModelfromJson(String str) => GetNewPasswordModel.fromJson(json.decode(str));

String getNewPasswordModeltoJson(GetNewPasswordModel data) => json.encode(data.toJson());

class GetNewPasswordModel {
  bool? success;
  String? data;

  GetNewPasswordModel({
    this.success,
    this.data,
  });

  factory GetNewPasswordModel.fromJson(Map<String, dynamic> json) => GetNewPasswordModel(
        success: json["success"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
      };
}
