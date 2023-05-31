// To parse this JSON data, do
//
//     final UpdateProfileModel = UpdateProfileModelfromJson(jsonString);

import 'dart:convert';

UpdateProfileModel updateProfileModelfromJson(String str) => UpdateProfileModel.fromJson(json.decode(str));

String updateProfileModeltoJson(UpdateProfileModel data) => json.encode(data.toJson());

class UpdateProfileModel {
  String? message;
  int? errorCode;
  bool? success;
  Data? data;

  UpdateProfileModel({
    this.message,
    this.errorCode,
    this.success,
    this.data,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) => UpdateProfileModel(
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
  List<String>? password;
  List<String>? avatarFileId;
  List<String>? passwordOld;

  Data({
    this.password,
    this.avatarFileId,
    this.passwordOld,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        password: json["password"] == null ? [] : List<String>.from(json["password"]!.map((x) => x)),
        avatarFileId: json["avatarFileId"] == null ? [] : List<String>.from(json["avatarFileId"]!.map((x) => x)),
        passwordOld: json["passwordOld"] == null ? [] : List<String>.from(json["passwordOld"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "password": password == null ? [] : List<dynamic>.from(password!.map((x) => x)),
        "avatarFileId": avatarFileId == null ? [] : List<dynamic>.from(avatarFileId!.map((x) => x)),
        "passwordOld": passwordOld == null ? [] : List<dynamic>.from(passwordOld!.map((x) => x)),
      };
}
