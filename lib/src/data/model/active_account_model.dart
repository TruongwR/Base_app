// To parse this JSON data, do
//
//     final activeAccountModel = activeAccountModelfromJson(jsonString);

import 'dart:convert';

ActiveAccountModel activeAccountModelfromJson(String str) => ActiveAccountModel.fromJson(json.decode(str));

String activeAccountModeltoJson(ActiveAccountModel data) => json.encode(data.toJson());

class ActiveAccountModel {
  String? message;
  int? errorCode;
  bool? success;
  Data? data;

  ActiveAccountModel({
    this.message,
    this.errorCode,
    this.success,
    this.data,
  });

  factory ActiveAccountModel.fromJson(Map<String, dynamic> json) => ActiveAccountModel(
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
  List<String>? activationCode;
  List<String>? id;

  Data({
    this.activationCode,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        activationCode: json["activationCode"] == null ? [] : List<String>.from(json["activationCode"]!.map((x) => x)),
        id: json["id"] == null ? [] : List<String>.from(json["id"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "activationCode": activationCode == null ? [] : List<dynamic>.from(activationCode!.map((x) => x)),
        "id": id == null ? [] : List<dynamic>.from(id!.map((x) => x)),
      };
}
