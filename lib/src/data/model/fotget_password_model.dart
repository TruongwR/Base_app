// To parse this JSON data, do
//
//     final fotgetPasswordModel = fotgetPasswordModelfromJson(jsonString);

import 'dart:convert';

FotgetPasswordModel fotgetPasswordModelfromJson(String str) => FotgetPasswordModel.fromJson(json.decode(str));

String fotgetPasswordModeltoJson(FotgetPasswordModel data) => json.encode(data.toJson());

class FotgetPasswordModel {
  String? message;
  bool? success;
  List<Data>? data;

  FotgetPasswordModel({
    this.message,
    this.success,
    this.data,
  });

  factory FotgetPasswordModel.fromJson(Map<String, dynamic> json) => FotgetPasswordModel(
        message: json["message"],
        success: json["success"],
        data: json["data"] == null ? [] : List<Data>.from(json["data"]!.map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  String? id;
  String? firstName;
  String? lastName;
  String? avatarFileId;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.avatarFileId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        avatarFileId: json["avatarFileId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "avatarFileId": avatarFileId,
      };
}
